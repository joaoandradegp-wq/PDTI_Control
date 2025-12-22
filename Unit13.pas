unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls;

type
  TForm13 = class(TForm)
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label17: TLabel;
    Label14: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    Label11: TLabel;
    fechar: TSpeedButton;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label3: TLabel;
    dbnome: TDBEdit;
    dbtsystems: TDBEdit;
    dbmemo: TDBMemo;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    novo: TSpeedButton;
    editar: TSpeedButton;
    excluir: TSpeedButton;
    gravar: TSpeedButton;
    cancelar: TSpeedButton;
    localizar: TSpeedButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    dbsisdia: TDBEdit;
    dbsetor: TDBComboBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    dbsenha: TDBEdit;
    procedure fecharClick(Sender: TObject);
    procedure novoClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure localizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dbnomeEnter(Sender: TObject);
    procedure dbnomeExit(Sender: TObject);
    procedure dbnomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbsisdiaEnter(Sender: TObject);
    procedure dbsisdiaExit(Sender: TObject);
    procedure dbsisdiaKeyPress(Sender: TObject; var Key: Char);
    procedure dbtsystemsEnter(Sender: TObject);
    procedure dbtsystemsExit(Sender: TObject);
    procedure dbtsystemsKeyPress(Sender: TObject; var Key: Char);
    procedure dbsenhaExit(Sender: TObject);
    procedure dbsenhaEnter(Sender: TObject);
    procedure dbsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure dbsetorEnter(Sender: TObject);
    procedure dbsetorExit(Sender: TObject);
    procedure dbsetorKeyPress(Sender: TObject; var Key: Char);
    procedure dbmemoChange(Sender: TObject);
    procedure dbmemoClick(Sender: TObject);
    procedure dbmemoEnter(Sender: TObject);
    procedure dbmemoExit(Sender: TObject);
    procedure dbmemoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm13.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm13.novoClick(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo são os Edit's
dbnome.Enabled:=True;
dbsisdia.Enabled:=True;
dbtsystems.Enabled:=True;
dbsenha.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo são os Botões
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Nome pronto pra digitar
dbnome.SetFocus;
end;

procedure TForm13.editarClick(Sender: TObject);
begin
ADOQuery1.Edit;

//Abaixo são os Edit's
dbnome.Enabled:=True;
dbsisdia.Enabled:=True;
dbtsystems.Enabled:=True;
dbsenha.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo são os Botões
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;
end;

procedure TForm13.gravarClick(Sender: TObject);
begin
if trim(dbnome.Text) = '' then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);

MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbnome.SetFocus;
end

else if trim(dbtsystems.Text) = '' then
begin
aux:=Label2.Caption;
vet:=length(aux);
delete(aux,vet,1);

MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbtsystems.SetFocus;
end

else if trim(dbsenha.Text) = '' then
begin
aux:=Label14.Caption;
vet:=length(aux);
delete(aux,vet,1);

MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsenha.SetFocus;
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
and (Trim(dbtsystems.Text)<>'')
and (Trim(dbsenha.Text)<>'')
and (Trim(dbsetor.Text)<>'') then

begin
if trim(dbmemo.Text) = '' then
dbmemo.Text:='N/A';

if trim(dbsisdia.Text) = '' then
dbsisdia.Text:='N/A';

//Abaixo para garantir letras maiúsculas
dbnome.Text:=uppercase(dbnome.Text);
dbmemo.Text:=uppercase(dbmemo.Text);

ADOQuery1.Post;

//Abaixo são os Edit's
dbnome.Enabled:=False;
dbsisdia.Enabled:=False;
dbtsystems.Enabled:=False;
dbsenha.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo são os botões
editar.Enabled:=True;
novo.Enabled:=True;
excluir.Enabled:=True;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

end;

procedure TForm13.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
ADOQuery1.Active:=False;

//Abaixo são os Edit's
dbnome.Enabled:=False;
dbsisdia.Enabled:=False;
dbtsystems.Enabled:=False;
dbsenha.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo são os botões
editar.Enabled:=False;
novo.Enabled:=True;
excluir.Enabled:=False;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

procedure TForm13.excluirClick(Sender: TObject);
begin
  if MessageDlg(#13+'Deseja realmente excluir o registro T-Systems '+dbtsystems.Text+'?',mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Registro T-Systems '+dbtsystems.Text+' deletado com sucesso!', mtinformation, [mbOk], 0);
  ADOQuery1.Delete;
  ADOQuery1.Active:=False;

  //Abaixo são os botões
  novo.Enabled:=True;
  excluir.Enabled:=False;
  editar.Enabled:=False;
  gravar.Enabled:=False;
  cancelar.Enabled:=False;
  localizar.Enabled:=True;
  end;
end;

procedure TForm13.localizarClick(Sender: TObject);
begin
Edit1.Clear;
Edit1.Text:=Trim(Inputbox('Consulta','Digite o código do registro:',''));
ADOQuery1.Active:=True;

    if not ADOQuery1.Locate('Código', trim(Edit1.Text), []) then
    begin
    ADOQuery1.Active:=false;

    //Abaixo são os botões
    novo.Enabled:=True;
    excluir.Enabled:=False;
    editar.Enabled:=False;
    cancelar.Enabled:=False;
    gravar.Enabled:=False;
    localizar.Enabled:=True;

    MessageDlg(#13+'Código '+Edit1.Text+' não encontrado no Sistema!', mtwarning, [mbOk], 0);
    end
      else
      begin
      //Abaixo são os botões
      editar.Enabled:=True;
      novo.Enabled:=True;
      excluir.Enabled:=True;
      localizar.Enabled:=True;
      end;
end;

procedure TForm13.FormActivate(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo são os Edit's
dbnome.Enabled:=True;
dbsisdia.Enabled:=True;
dbtsystems.Enabled:=True;
dbsenha.Enabled:=True;
dbsetor.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo são os Botões
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Nome pronto pra digitar
dbnome.SetFocus;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form13.Release;
Form13 := Nil;
end;

procedure TForm13.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm13.dbnomeEnter(Sender: TObject);
begin
dbnome.Color:=clWindow;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm13.dbnomeExit(Sender: TObject);
begin
dbnome.Color:=cl3DLight;
dbnome.Text:=trim(uppercase(dbnome.Text));
end;

procedure TForm13.dbnomeKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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

procedure TForm13.dbsisdiaEnter(Sender: TObject);
begin
dbsisdia.Color:=clWindow;
dbsisdia.Text:=trim(dbsisdia.Text);
end;

procedure TForm13.dbsisdiaExit(Sender: TObject);
begin
dbsisdia.Color:=cl3DLight;
dbsisdia.Text:=trim(dbsisdia.Text);
end;

procedure TForm13.dbsisdiaKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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
dbsisdia.SetFocus;
end;
end;

procedure TForm13.dbtsystemsEnter(Sender: TObject);
begin
dbtsystems.Color:=clWindow;
dbtsystems.Text:=trim(dbtsystems.Text);
end;

procedure TForm13.dbtsystemsExit(Sender: TObject);
begin
dbtsystems.Color:=cl3DLight;
dbtsystems.Text:=trim(dbtsystems.Text);
end;

procedure TForm13.dbtsystemsKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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
dbtsystems.SetFocus;
end;
end;

procedure TForm13.dbsenhaExit(Sender: TObject);
begin
dbsenha.Color:=cl3DLight;
dbsenha.Text:=trim(dbsenha.Text);
end;

procedure TForm13.dbsenhaEnter(Sender: TObject);
begin
dbsenha.Color:=clWindow;
dbsenha.Text:=trim(dbsenha.Text);
end;

procedure TForm13.dbsenhaKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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

procedure TForm13.dbsetorEnter(Sender: TObject);
begin
dbsetor.Color:=clWindow;
end;

procedure TForm13.dbsetorExit(Sender: TObject);
begin
dbsetor.Color:=cl3DLight;
end;

procedure TForm13.dbsetorKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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
dbsetor.SetFocus;
end;
end;

procedure TForm13.dbmemoChange(Sender: TObject);
begin
//Abaixo o contador de caracteres
Label8.Caption:=FormatFloat('000',StrToFloat(IntToStr(100-length(dbmemo.Text))));
end;

procedure TForm13.dbmemoClick(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm13.dbmemoEnter(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm13.dbmemoExit(Sender: TObject);
begin
dbmemo.Color:=cl3DLight;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm13.dbmemoKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_+={}[]?;:|\/*"~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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

end.
