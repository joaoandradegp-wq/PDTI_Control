unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, DBCtrls, Buttons,ComObj,
  ADODB;

type
  TForm4 = class(TForm)
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label17: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    dbnome: TDBEdit;
    dbramal: TDBEdit;
    dbmemo: TDBMemo;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    novo: TSpeedButton;
    editar: TSpeedButton;
    excluir: TSpeedButton;
    gravar: TSpeedButton;
    localizar: TSpeedButton;
    Bevel4: TBevel;
    Bevel3: TBevel;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    cancelar: TSpeedButton;
    fechar: TSpeedButton;
    Label3: TLabel;
    dbsetor: TDBComboBox;
    procedure novoClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure localizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fecharClick(Sender: TObject);
    procedure dbnomeEnter(Sender: TObject);
    procedure dbnomeExit(Sender: TObject);
    procedure dbnomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbramalKeyPress(Sender: TObject; var Key: Char);
    procedure dbramalEnter(Sender: TObject);
    procedure dbramalExit(Sender: TObject);
    procedure dbmemoClick(Sender: TObject);
    procedure dbmemoEnter(Sender: TObject);
    procedure dbmemoExit(Sender: TObject);
    procedure dbmemoKeyPress(Sender: TObject; var Key: Char);
    procedure dbmemoChange(Sender: TObject);
    procedure dbsetorEnter(Sender: TObject);
    procedure dbsetorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, Unit12;

{$R *.DFM}


procedure TForm4.novoClick(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbramal.Enabled:=True;
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
dbnome.SetFocus;
end;

procedure TForm4.editarClick(Sender: TObject);
begin
ADOQuery1.Edit;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbramal.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;
end;

procedure TForm4.gravarClick(Sender: TObject);
begin
if trim(dbnome.Text) = '' then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbnome.SetFocus;
end

else if trim(dbramal.Text) = '' then
begin
aux:=Label2.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbramal.SetFocus;
end

else if dbsetor.Text = '' then
begin
aux:=Label3.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsetor.SetFocus;
end;

 if (Trim(dbnome.Text)<>'')
and (Trim(dbramal.Text)<>'')
and (Trim(dbsetor.Text)<>'') then

begin
if trim(dbmemo.Text) = '' then
dbmemo.Text:='N/A';

//Abaixo para garantir letras mai˙sculas
dbnome.Text:=uppercase(dbnome.Text);
dbramal.Text:=uppercase(dbramal.Text);
dbmemo.Text:=uppercase(dbmemo.Text);

ADOQuery1.Post;

//Abaixo s„o os Edit's
dbnome.Enabled:=False;
dbramal.Enabled:=False;
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

procedure TForm4.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
ADOQuery1.Active:=False;

//Abaixo s„o os Edit's
dbnome.Enabled:=False;
dbramal.Enabled:=False;
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

procedure TForm4.excluirClick(Sender: TObject);
begin
  if MessageDlg(#13+'Deseja realmente excluir o ramal '+dbramal.Text+'?',mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Computador '+dbramal.Text+' deletado com sucesso!', mtinformation, [mbOk], 0);
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

procedure TForm4.localizarClick(Sender: TObject);
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

    MessageDlg(#13+'CÛdigo '+Edit1.Text+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
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

procedure TForm4.FormActivate(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbramal.Enabled:=True;
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
dbnome.SetFocus;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form4.Release;
Form4 := Nil;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm4.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm4.dbnomeEnter(Sender: TObject);
begin
dbnome.Color:=clWindow;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm4.dbnomeExit(Sender: TObject);
begin
dbnome.Color:=cl3DLight;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm4.dbnomeKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%®&*()_-+={}[]?;:,.|\*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbnome.SetFocus;
end;
end;

procedure TForm4.dbramalKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
min = 'abcdefghijklmnopqrstuvwxyz';
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
dbramal.SetFocus;
end;
end;

procedure TForm4.dbramalEnter(Sender: TObject);
begin
dbramal.Color:=clWindow;
dbramal.Text:=trim(dbramal.Text);
end;

procedure TForm4.dbramalExit(Sender: TObject);
begin
dbramal.Color:=cl3DLight;
dbramal.Text:=trim(dbramal.Text);
end;

procedure TForm4.dbmemoClick(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm4.dbmemoEnter(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm4.dbmemoExit(Sender: TObject);
begin
dbmemo.Color:=cl3DLight;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm4.dbmemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm4.dbmemoChange(Sender: TObject);
begin
//Abaixo o contador de caracteres
Label8.Caption:=FormatFloat('000',StrToFloat(IntToStr(100-length(dbmemo.Text))));
end;

procedure TForm4.dbsetorEnter(Sender: TObject);
begin
dbsetor.Color:=clWindow;
dbsetor.Text:=trim(uppercase(dbsetor.Text));
end;

procedure TForm4.dbsetorExit(Sender: TObject);
begin
dbsetor.Color:=cl3DLight;
dbsetor.Text:=trim(uppercase(dbsetor.Text));
end;

end.
