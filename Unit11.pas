unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, IniFiles;

type
  TForm11 = class(TForm)
    fechar: TSpeedButton;
    Bevel7: TBevel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    gravar: TSpeedButton;
    cancelar: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    ADOQuery1codigo: TAutoIncField;
    ADOQuery1login: TWideStringField;
    ADOQuery1senha: TWideStringField;
    Edit2: TEdit;
    ProgramIcon: TImage;
    Label3: TLabel;
    DBText1: TDBText;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  ArqIni : TIniFile;

implementation

uses Unit1, Unit12, U_Cipher;

{$R *.dfm}

procedure TForm11.fecharClick(Sender: TObject);
begin
close;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Label6.Visible:=False;
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form11.Release;
Form11 := Nil;
end;

procedure TForm11.FormActivate(Sender: TObject);
var
aux: string;
begin
ArqIni := TIniFile.Create('C:\PDTI\conbd.Ini');
Try
aux := ArqIni.ReadString('LOGIN', 'USUARIO', aux );
Finally
ArqIni.Free;
end;

ADOQuery1.close;
ADOQuery1.sql.clear;
ADOQuery1.sql.Add('Select * from admin where login= "'+aux+'"');
ADOQuery1.open;

ADOQuery1.Active:=True;
ADOQuery1.Edit;
end;

procedure TForm11.cancelarClick(Sender: TObject);
begin
ADOQuery1.Cancel;
Edit1.Text:='';
Edit2.Text:='';
Label6.Visible:=False;
ADOQuery1.Edit;
Edit2.SetFocus;
end;

procedure TForm11.gravarClick(Sender: TObject);
begin
if trim(Edit2.Text) = '' then
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);

MessageDlg(#13+'Preencha corretamente o campo '+aux, mtwarning, [mbOk], 0);
Label6.Visible:=False;
Edit2.SetFocus;
end

else if trim(Edit2.Text) <> trim(Edit1.Text) then
begin
MessageDlg(#13+'ConfirmaÁ„o de Senha inv·lida!', mtwarning, [mbOk], 0);
Label6.Visible:=False;
Edit1.Text:='';
Edit1.SetFocus;
end

else
begin
 if MessageDlg(#13+'Deseja realmente alterar a senha administrativa?',mtConfirmation, mbOkCancel, 0) = mrOk then
 begin
 ADOQuery1.FieldByName('senha').Value:=MD5Hash(Trim(Edit2.Text));
 Edit1.Text:='';
 Edit2.Text:='';
 Label6.Visible:=True;
 Edit2.SetFocus;
 ADOQuery1.Post;
 ADOQuery1.Edit;
 end
   else
   begin
   ADOQuery1.Cancel;
   Edit1.Text:='';
   Edit2.Text:='';
   Label6.Visible:=False;
   ADOQuery1.Edit;
   Edit2.SetFocus;
   end;
end;

end;

procedure TForm11.Edit2KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais+mai)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
Edit2.SetFocus;
end;
end;

procedure TForm11.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais+mai)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
Edit1.SetFocus;
end;
end;

procedure TForm11.FormDestroy(Sender: TObject);
begin
Frmprincipal.Enabled:=True;
end;

end.
