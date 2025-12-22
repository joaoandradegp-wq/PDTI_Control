unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, ADODB, StdCtrls, DBCtrls, Mask, Grids, IniFiles,
  DBGrids;

type
  TForm15 = class(TForm)
    Bevel6: TBevel;
    fechar: TSpeedButton;
    Label17: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
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
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Image1: TImage;
    Bevel1: TBevel;
    ADOQuery1codigo: TAutoIncField;
    ADOQuery1solicitante: TWideStringField;
    ADOQuery1servico: TWideStringField;
    ADOQuery1local: TWideStringField;
    ADOQuery1documento: TWideStringField;
    ADOQuery1numero: TWideStringField;
    ADOQuery1cit: TWideStringField;
    ADOQuery1data: TDateTimeField;
    ADOQuery1mes: TWideStringField;
    ADOQuery1ano: TWideStringField;
    ADOQuery1hora: TWideStringField;
    ADOQuery1obs: TWideStringField;
    ADOQuery1setor: TWideStringField;
    ADOQuery1cadastrante: TWideStringField;
    dbsolicitante: TDBEdit;
    Label15: TLabel;
    dbsetor: TDBComboBox;
    Label3: TLabel;
    Label1: TLabel;
    dblocal: TDBComboBox;
    Label14: TLabel;
    dbdocumento: TDBComboBox;
    dbcit: TDBComboBox;
    Label7: TLabel;
    dbnumero: TDBEdit;
    Label2: TLabel;
    Label6: TLabel;
    dbmemo: TDBMemo;
    Label11: TLabel;
    dbservico: TDBComboBox;
    procedure fecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure novoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure localizarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure dbsolicitanteEnter(Sender: TObject);
    procedure dbsolicitanteExit(Sender: TObject);
    procedure dblocalExit(Sender: TObject);
    procedure dbnumeroExit(Sender: TObject);
    procedure dbcitExit(Sender: TObject);
    procedure dbmemoExit(Sender: TObject);
    procedure dblocalEnter(Sender: TObject);
    procedure dbnumeroEnter(Sender: TObject);
    procedure dbcitEnter(Sender: TObject);
    procedure dbmemoEnter(Sender: TObject);
    procedure dbdocumentoChange(Sender: TObject);
    procedure dbnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure dblocalChange(Sender: TObject);
    procedure dbsetorEnter(Sender: TObject);
    procedure dbsetorExit(Sender: TObject);
    procedure dbsolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure dbservicoKeyPress(Sender: TObject; var Key: Char);
    procedure dbmemoKeyPress(Sender: TObject; var Key: Char);
    procedure dbservicoEnter(Sender: TObject);
    procedure dbservicoExit(Sender: TObject);
    procedure dbdocumentoExit(Sender: TObject);
    procedure dbdocumentoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;
  aux: string;
  ArqIni : TIniFile;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm15.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm15.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm15.novoClick(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbsolicitante.Enabled:=True;
dbservico.Enabled:=True;
dblocal.Enabled:=True;
dbsetor.Enabled:=True;
dbdocumento.Enabled:=True;
dbnumero.Enabled:=True;
dbcit.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Solicitante pronto pra digitar
dbsolicitante.SetFocus;
end;

procedure TForm15.FormActivate(Sender: TObject);
begin
ADOQuery1.Active:=True;
ADOQuery1.Append;

//Abaixo s„o os Edit's
dbsolicitante.Enabled:=True;
dbservico.Enabled:=True;
dblocal.Enabled:=True;
dbsetor.Enabled:=True;
dbdocumento.Enabled:=True;
dbnumero.Enabled:=True;
dbcit.Enabled:=True;
dbmemo.Enabled:=True;

//Abaixo s„o os Botıes
editar.Enabled:=False;
novo.Enabled:=False;
excluir.Enabled:=False;
cancelar.Enabled:=True;
gravar.Enabled:=True ;
localizar.Enabled:=False;

//Abaixo deixa o campo Solicitante pronto pra digitar
dbsolicitante.SetFocus;
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form15.Release;
Form15 := Nil;
end;

procedure TForm15.editarClick(Sender: TObject);
begin
ADOQuery1.Edit;

//Abaixo s„o os Edit's
dbsolicitante.Enabled:=True;
dbservico.Enabled:=True;
dblocal.Enabled:=True;
dbsetor.Enabled:=True;
dbdocumento.Enabled:=True;
dbnumero.Enabled:=True;

if dblocal.ItemIndex = 1 then
begin
dbsetor.Enabled:=False;
end;

if dbdocumento.ItemIndex = 1 then
begin
dbcit.Enabled:=True;
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

procedure TForm15.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
ADOQuery1.Active:=False;

//Abaixo s„o os Edit's
dbsolicitante.Enabled:=False;
dbservico.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbdocumento.Enabled:=False;
dbnumero.Enabled:=False;
dbcit.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo s„o os botıes
editar.Enabled:=False;
novo.Enabled:=True;
excluir.Enabled:=False;
cancelar.Enabled:=False;
gravar.Enabled:=False;
localizar.Enabled:=True;
end;

procedure TForm15.excluirClick(Sender: TObject);
begin
if dbcit.ItemIndex <> -1 then
begin
  if MessageDlg(#13+'Deseja realmente excluir o registro abaixo?'+#13+#13+'Documento: '+dbdocumento.Text+#13+'N˙mero: '+dbnumero.Text+#13+'CIT: '+dbcit.Text,mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Registro de cÛdigo '+dbcodigo.Caption+' deletado com sucesso!', mtinformation, [mbOk], 0);
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
end
else
begin
  if MessageDlg(#13+'Deseja realmente excluir o registro abaixo?'+#13+#13+'Documento: '+dbdocumento.Text+#13+'N˙mero: '+dbnumero.Text,mtConfirmation, [mbyes, mbcancel],0) = mrYes then
  begin
  MessageDlg(#13+'Registro de cÛdigo '+dbcodigo.Caption+' deletado com sucesso!', mtinformation, [mbOk], 0);
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
end;

procedure TForm15.localizarClick(Sender: TObject);
begin
Edit1.Clear;
Edit1.Text:=Trim(Inputbox('Consulta','Digite o cÛdigo do registro:',''));
ADOQuery1.Active:=True;

    if not ADOQuery1.Locate('codigo', trim(Edit1.Text), []) then
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

procedure TForm15.gravarClick(Sender: TObject);
var
dia, mes, ano: word;
mes_string:string;
cont:integer;
begin
cont:=0;

ArqIni := TIniFile.Create('C:\PDTI\conbd.Ini');
Try
aux := ArqIni.ReadString('LOGIN', 'USUARIO', aux );
Finally
ArqIni.Free;
end;

if trim(dbsolicitante.Text) = '' then
begin
aux:=Label15.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbsolicitante.SetFocus;
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
end

else if dbservico.ItemIndex = -1 then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbservico.SetFocus;
end

else if dbdocumento.ItemIndex = -1 then
begin
aux:=Label6.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbdocumento.SetFocus;
end

else if trim(dbnumero.Text) = '' then
begin
aux:=Label2.Caption;
vet:=length(aux);
delete(aux,vet,1);
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbnumero.SetFocus;
end

else if ((dbcit.ItemIndex = -1) and (dbcit.Enabled = true)) then
begin
aux:=Label7.Caption;
vet:=length(aux);
delete(aux,vet,1);
cont:=1;
MessageDlg(#13+'Preencha corretamente o campo '+aux+'.', mtwarning, [mbOk], 0);
dbcit.SetFocus;
end;

 if (Trim(dbsolicitante.Text)<>'')
and (dbservico.ItemIndex > -1)
and (dblocal.ItemIndex > -1)
and (dbdocumento.ItemIndex > -1)
and (Trim(dbnumero.Text)<>'')
and (cont = 0) then
          
begin

//Abaixo para garantir letras mai˙sculas
dbsolicitante.Text:=uppercase(dbsolicitante.Text);
dbmemo.Text:=uppercase(dbmemo.Text);

if ADOQuery1.FieldByName('data').Value = null then
ADOQuery1.FieldByName('data').Value:=date;

if ADOQuery1.FieldByName('hora').Value = null then
ADOQuery1.FieldByName('hora').Value:=time;


if Trim(dbmemo.Text) = '' then
dbmemo.Text:='N/A';

if dbcit.Enabled = False then
ADOQuery1.FieldByName('cit').Value := 'N/A';

if dbsetor.Enabled = False then
ADOQuery1.FieldByName('setor').Value:='REDE MINEIRA';

DecodeDate(Date,ano,mes,dia);

     if mes = 1 then
     mes_string:='JANEIRO'
     else if mes = 2 then
     mes_string:='FEVEREIRO'
     else if mes = 3 then
     mes_string:='MAR«O'
     else if mes = 4 then
     mes_string:='ABRIL'
     else if mes = 5 then
     mes_string:='MAIO'
     else if mes = 6 then
     mes_string:='JUNHO'
     else if mes = 7 then
     mes_string:='JULHO'
     else if mes = 8 then
     mes_string:='AGOSTO'
     else if mes = 9 then
     mes_string:='SETEMBRO'
     else if mes = 10 then
     mes_string:='OUTUBRO'
     else if mes = 11 then
     mes_string:='NOVEMBRO'
     else if mes = 12 then
     mes_string:='DEZEMBRO';

ADOQuery1.FieldByName('mes').Value := mes_string;
ADOQuery1.FieldByName('ano').Value := ano;
ADOQuery1.FieldByName('cadastrante').Value := UpperCase(aux);

ADOQuery1.Post;

//Abaixo s„o os Edit's
dbsolicitante.Enabled:=False;
dbservico.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbdocumento.Enabled:=False;
dbnumero.Enabled:=False;
dbcit.Enabled:=False;
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

procedure TForm15.dbsolicitanteEnter(Sender: TObject);
begin
dbsolicitante.Color:=clWindow;
dbsolicitante.Text:=trim(uppercase(dbsolicitante.Text));
end;

procedure TForm15.dbsolicitanteExit(Sender: TObject);
begin
dbsolicitante.Color:=cl3DLight;
dbsolicitante.Text:=trim(uppercase(dbsolicitante.Text));
end;

procedure TForm15.dblocalExit(Sender: TObject);
begin
dblocal.Color:=cl3DLight;
end;

procedure TForm15.dbnumeroExit(Sender: TObject);
begin
dbnumero.Color:=cl3DLight;
dbnumero.Text:=trim(uppercase(dbnumero.Text));
end;

procedure TForm15.dbcitExit(Sender: TObject);
begin
dbcit.Color:=cl3DLight;
dbcit.Text:=trim(uppercase(dbcit.Text));
end;

procedure TForm15.dbmemoExit(Sender: TObject);
begin
dbmemo.Color:=cl3DLight;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm15.dblocalEnter(Sender: TObject);
begin
dblocal.Color:=clWindow;
end;

procedure TForm15.dbnumeroEnter(Sender: TObject);
begin
dbnumero.Color:=clWindow;
dbnumero.Text:=trim(uppercase(dbnumero.Text));
end;

procedure TForm15.dbcitEnter(Sender: TObject);
begin
dbcit.Color:=clWindow;
dbcit.Text:=trim(uppercase(dbcit.Text));
end;

procedure TForm15.dbmemoEnter(Sender: TObject);
begin
dbmemo.Color:=clWindow;
dbmemo.Text:=trim(uppercase(dbmemo.Text));
end;

procedure TForm15.dbdocumentoChange(Sender: TObject);
begin
if dbdocumento.Text = 'NOTA FISCAL - NF' then
begin
dbcit.ItemIndex:=-1;
dbcit.Field.Text:='';
dbcit.Enabled:=False;
end
else
dbcit.Enabled:=True;
end;

procedure TForm15.dbnumeroKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:.,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbnumero.SetFocus;
end;
end;

procedure TForm15.dblocalChange(Sender: TObject);
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

procedure TForm15.dbsetorEnter(Sender: TObject);
begin
dbsetor.Color:=clWindow;
end;

procedure TForm15.dbsetorExit(Sender: TObject);
begin
dbsetor.Color:=cl3DLight;
end;

procedure TForm15.dbsolicitanteKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%®&*()_-+={}[]?;:.,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbsolicitante.SetFocus;
end;
end;

procedure TForm15.dbservicoKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%®&*()_-+={}[]?;:.,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
dbservico.SetFocus;
end;
end;

procedure TForm15.dbmemoKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,|\/*"~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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

procedure TForm15.dbservicoEnter(Sender: TObject);
begin
dbservico.Color:=clWindow;
end;

procedure TForm15.dbservicoExit(Sender: TObject);
begin
dbservico.Color:=cl3DLight;
end;

procedure TForm15.dbdocumentoExit(Sender: TObject);
begin
dbdocumento.Color:=cl3DLight;
end;

procedure TForm15.dbdocumentoEnter(Sender: TObject);
begin
dbdocumento.Color:=clWindow;
end;

end.
