unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, DB, ADODB;

type
  TForm20 = class(TForm)
    Label19: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label17: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    fechar: TSpeedButton;
    Label3: TLabel;
    dbnome: TDBEdit;
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
    cancelar: TSpeedButton;
    dbsetor: TDBComboBox;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    dbsenha: TDBEdit;
    dbmail: TDBEdit;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure novoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure localizarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure dbnomeEnter(Sender: TObject);
    procedure dbnomeExit(Sender: TObject);
    procedure dbnomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbsetorEnter(Sender: TObject);
    procedure dbsetorExit(Sender: TObject);
    procedure dbmailEnter(Sender: TObject);
    procedure dbmailExit(Sender: TObject);
    procedure dbsenhaEnter(Sender: TObject);
    procedure dbsenhaExit(Sender: TObject);
    procedure dbmemoChange(Sender: TObject);
    procedure dbmemoEnter(Sender: TObject);
    procedure dbmemoExit(Sender: TObject);
    procedure dbmemoKeyPress(Sender: TObject; var Key: Char);
    procedure dbmailKeyPress(Sender: TObject; var Key: Char);
    procedure dbsenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm20.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form20.Release;
Form20 := Nil;
end;

procedure TForm20.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm20.novoClick(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbsetor.Enabled:=True;
dbmail.Enabled:=True;
dbsenha.Enabled:=True;
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

procedure TForm20.FormActivate(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbsetor.Enabled:=True;
dbmail.Enabled:=True;
dbsenha.Enabled:=True;
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

procedure TForm20.editarClick(Sender: TObject);
begin
ADOQuery1.Edit;

//Abaixo s„o os Edit's
dbnome.Enabled:=True;
dbsetor.Enabled:=True;
dbmail.Enabled:=True;
dbsenha.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;
end;

procedure TForm20.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
ADOQuery1.Active:=False;

//Abaixo s„o os Edit's
dbnome.Enabled:=False;
dbsetor.Enabled:=False;
dbmail.Enabled:=False;
dbsenha.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo s„o os botıes
editar.Enabled:=False;
novo.Enabled:=True;
excluir.Enabled:=False;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

procedure TForm20.excluirClick(Sender: TObject);
begin
  if MessageDlg(#13+'Deseja realmente excluir o e-mail '+dbmail.Text+'?',mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Email '+dbmail.Text+' deletado com sucesso!', mtinformation, [mbOk], 0);
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

procedure TForm20.localizarClick(Sender: TObject);
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

procedure TForm20.gravarClick(Sender: TObject);
begin
if trim(dbnome.Text) = '' then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbnome.SetFocus;
end

else if dbsetor.Text = '' then
begin
aux:=Label3.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsetor.SetFocus;
end

else if dbmail.Text = '' then
begin
aux:=Label2.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbmail.SetFocus;
end

else if Trim(dbsenha.Text) = '' then
begin
aux:=Label5.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsenha.SetFocus;
end;

 if (Trim(dbnome.Text)<>'')
and (Trim(dbsenha.Text)<>'')
and (Trim(dbmail.Text)<>'') then

begin
if trim(dbmemo.Text) = '' then
dbmemo.Text:='N/A';

//Abaixo para garantir letras mai˙sculas
dbnome.Text:=uppercase(dbnome.Text);

ADOQuery1.Post;

//Abaixo s„o os Edit's
dbnome.Enabled:=False;
dbsetor.Enabled:=False;
dbmail.Enabled:=False;
dbsenha.Enabled:=False;
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

procedure TForm20.dbnomeEnter(Sender: TObject);
begin
dbnome.Color:=clWindow;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm20.dbnomeExit(Sender: TObject);
begin
dbnome.Color:=cl3DLight;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm20.dbnomeKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm20.dbsetorEnter(Sender: TObject);
begin
dbsetor.Color:=clWindow;
end;

procedure TForm20.dbsetorExit(Sender: TObject);
begin
dbsetor.Color:=cl3DLight;
end;

procedure TForm20.dbmailEnter(Sender: TObject);
begin
dbmail.Color:=clWindow;
dbmail.Text:=trim(dbmail.Text);
end;

procedure TForm20.dbmailExit(Sender: TObject);
begin
dbmail.Color:=cl3DLight;
dbmail.Text:=trim(dbmail.Text);
end;

procedure TForm20.dbsenhaEnter(Sender: TObject);
begin
dbsenha.Color:=clWindow;
dbsenha.Text:=trim(dbsenha.Text);
end;

procedure TForm20.dbsenhaExit(Sender: TObject);
begin
dbsenha.Color:=cl3DLight;
dbsenha.Text:=trim(dbsenha.Text);
end;

procedure TForm20.dbmemoChange(Sender: TObject);
begin
//Abaixo o contador de caracteres
Label8.Caption:=FormatFloat('000',StrToFloat(IntToStr(100-length(dbmemo.Text))));
end;

procedure TForm20.dbmemoEnter(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm20.dbmemoExit(Sender: TObject);
begin
dbmemo.Color:=cl3DLight;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm20.dbmemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm20.dbmailKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '#$%®&*()_-+={}[]?;:,|\*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbmail.SetFocus;
end;
end;

procedure TForm20.dbsenhaKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbsenha.SetFocus;
end;
end;

end.
