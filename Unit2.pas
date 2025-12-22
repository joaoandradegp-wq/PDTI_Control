unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Db, DBTables, Buttons, Printers, ExtCtrls, Grids, DBGrids,
  ExtDlgs, ImgList, ComObj, ShellApi, ADODB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dbnomepc: TDBEdit;
    dbip: TDBEdit;
    dbmemo: TDBMemo;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    novo: TSpeedButton;
    editar: TSpeedButton;
    excluir: TSpeedButton;
    gravar: TSpeedButton;
    cancelar: TSpeedButton;
    localizar: TSpeedButton;
    Label15: TLabel;
    dbusuario: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label17: TLabel;
    Label14: TLabel;
    dblocal: TDBComboBox;
    Bevel6: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    fechar: TSpeedButton;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label3: TLabel;
    dbsetor: TDBComboBox;
    procedure novoClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure localizarClick(Sender: TObject);
    procedure fecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbnomepcExit(Sender: TObject);
    procedure dbusuarioExit(Sender: TObject);
    procedure dbusuarioEnter(Sender: TObject);
    procedure dbnomepcEnter(Sender: TObject);
    procedure dblocalEnter(Sender: TObject);
    procedure dbipEnter(Sender: TObject);
    procedure dbmemoEnter(Sender: TObject);
    procedure dblocalExit(Sender: TObject);
    procedure dbipExit(Sender: TObject);
    procedure dbmemoExit(Sender: TObject);
    procedure dbmemoChange(Sender: TObject);
    procedure dbnomepcKeyPress(Sender: TObject; var Key: Char);
    procedure dbusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure dbipKeyPress(Sender: TObject; var Key: Char);
    procedure dbmemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbsetorEnter(Sender: TObject);
    procedure dbsetorExit(Sender: TObject);
    procedure dblocalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  cont: integer;

implementation

uses Unit1, Unit12;

{$R *.DFM}

procedure TForm2.novoClick(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnomepc.Enabled:=True;
dbusuario.Enabled:=True;
dbip.Enabled:=True;
dblocal.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Nome pronto pra digitar
dbnomepc.SetFocus;
end;

procedure TForm2.excluirClick(Sender: TObject);
begin
  if MessageDlg(#13+'Deseja realmente excluir o computador '+dbnomepc.Text+'?',mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Computador '+dbnomepc.Text+' deletado com sucesso!', mtinformation, [mbOk], 0);
  ADOQuery1.Delete;
  ADOQuery1.Active:=False;

  //Abaixo s„o os botıes
  novo.Enabled:=True;
  excluir.Enabled:=False;
  editar.Enabled:=False;
  gravar.Enabled:=False;
  cancelar.Enabled:=False;
  localizar.Enabled:=True;
  end;
end;

procedure TForm2.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
ADOQuery1.Active:=False;

//Abaixo s„o os Edit's
dbnomepc.Enabled:=False;
dbusuario.Enabled:=False;
dbip.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo s„o os botıes
editar.Enabled:=False;
novo.Enabled:=True;
excluir.Enabled:=False;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

procedure TForm2.gravarClick(Sender: TObject);
begin
cont:=0;

if trim(dbnomepc.Text) = '' then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbnomepc.SetFocus;
end

else if trim(dbip.Text) = '' then
begin
aux:=Label2.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbip.SetFocus;
end

else if dblocal.ItemIndex = -1 then
begin
aux:=Label14.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dblocal.SetFocus;
end

else if ((dbsetor.ItemIndex = -1) and (dbsetor.Enabled = true)) then
begin
aux:=Label3.Caption;
vet:=length(aux);
delete(aux,vet,1);
cont:=1;
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsetor.SetFocus;
end;

 if (Trim(dbnomepc.Text)<>'')
and (Trim(dbip.Text)<>'')
and (dblocal.ItemIndex > -1)
and (cont = 0) then

begin
if Trim(dbmemo.Text) = '' then
dbmemo.Text:='N/A';

if Trim(dbusuario.Text) = '' then
dbusuario.Text:='N/A';

//Abaixo para garantir letras mai˙sculas
dbnomepc.Text:=uppercase(dbnomepc.Text);
dbusuario.Text:=uppercase(dbusuario.Text);
dbmemo.Text:=uppercase(dbmemo.Text);

if dbsetor.Enabled=False then
ADOQuery1.FieldByName('setor').Value:='REDE MINEIRA';

ADOQuery1.Post;

//Abaixo s„o os Edit's
dbnomepc.Enabled:=False;
dbusuario.Enabled:=False;
dbip.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo s„o os botıes
editar.Enabled:=True;
novo.Enabled:=True;
excluir.Enabled:=True;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

end;

procedure TForm2.editarClick(Sender: TObject);
begin
ADOQuery1.Edit;

//Abaixo s„o os Edit's
dbnomepc.Enabled:=True;
dbusuario.Enabled:=True;
dbip.Enabled:=True;
dblocal.Enabled:=True;

if dblocal.ItemIndex = 0 then
begin
dbsetor.Enabled:=True;
end;

dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;
end;

procedure TForm2.localizarClick(Sender: TObject);
begin
Edit1.Clear;
Edit1.Text:=Trim(Inputbox('Consulta','Digite o cÛdigo do registro:',''));
ADOQuery1.Active:=True;

    if not ADOQuery1.Locate('CÛdigo', trim(Edit1.Text), []) then
    begin
    ADOQuery1.Active:=false;

    //Abaixo s„o os botıes
    novo.Enabled:=True;
    excluir.Enabled:=False;
    editar.Enabled:=False;
    cancelar.Enabled:=False;
    gravar.Enabled:=False;
    localizar.Enabled:=True;

    MessageDlg(#13+'CÛdigo n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
    end
      else
      begin
      //Abaixo s„o os botıes
      editar.Enabled:=True;
      novo.Enabled:=True;
      excluir.Enabled:=True;
      localizar.Enabled:=True;
      end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnomepc.Enabled:=True;
dbusuario.Enabled:=True;
dbip.Enabled:=True;
dblocal.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Nome pronto pra digitar
dbnomepc.SetFocus;
end;

procedure TForm2.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm2.dbnomepcExit(Sender: TObject);
begin
dbnomepc.Color:=cl3DLight;
dbnomepc.Text:=trim(uppercase(dbnomepc.Text));
end;

procedure TForm2.dbusuarioExit(Sender: TObject);
begin
dbusuario.Color:=cl3DLight;
dbusuario.Text:=trim(uppercase(dbusuario.Text));
end;

procedure TForm2.dbusuarioEnter(Sender: TObject);
begin
dbusuario.Color:=clWindow;
dbusuario.Text:=trim(uppercase(dbusuario.Text));
end;

procedure TForm2.dbnomepcEnter(Sender: TObject);
begin
dbnomepc.Color:=clWindow;
dbnomepc.Text:=trim(uppercase(dbnomepc.Text));
end;

procedure TForm2.dblocalEnter(Sender: TObject);
begin
dblocal.Color:=clWindow;
end;

procedure TForm2.dbipEnter(Sender: TObject);
begin
dbip.Color:=clWindow;
end;

procedure TForm2.dbmemoEnter(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=(uppercase(dbmemo.Text));
end;

procedure TForm2.dblocalExit(Sender: TObject);
begin
dblocal.Color:=cl3DLight;
end;

procedure TForm2.dbipExit(Sender: TObject);
begin
dbip.Color:=cl3DLight;
dbip.Text:=trim(dbip.Text);
end;

procedure TForm2.dbmemoExit(Sender: TObject);
begin
dbmemo.Color:=cl3DLight;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm2.dbmemoChange(Sender: TObject);
begin
//Abaixo o contador de caracteres
Label8.Caption:=FormatFloat('000',StrToFloat(IntToStr(100-length(dbmemo.Text))));
end;

procedure TForm2.dbnomepcKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
dbnomepc.SetFocus;
end;
end;

procedure TForm2.dbusuarioKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%®&*()_+={}[]?;:,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
dbusuario.SetFocus;
end;
end;

procedure TForm2.dbipKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVXYZ';
min = 'abcdefghijklmnopqrstuvxyz';
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais+mai+min)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
dbip.SetFocus;
end;
end;

procedure TForm2.dbmemoKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_+={}[]?;:|\/*"~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
dbmemo.SetFocus;
end;
end;


procedure TForm2.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form2.Release;
Form2 := Nil;
end;

procedure TForm2.dbsetorEnter(Sender: TObject);
begin
dbsetor.Color:=clWindow;
dbsetor.Text:=trim(uppercase(dbsetor.Text));
end;

procedure TForm2.dbsetorExit(Sender: TObject);
begin
dbsetor.Color:=cl3DLight;
dbsetor.Text:=trim(uppercase(dbsetor.Text));
end;

procedure TForm2.dblocalChange(Sender: TObject);
begin
if dblocal.Text = 'REDE MINEIRA' then
begin
dbsetor.ItemIndex:=-1;
dbsetor.Field.Text:='';
dbsetor.Enabled:=False;
end
else
dbsetor.Enabled:=True;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
cont:=0;
end;

end.

