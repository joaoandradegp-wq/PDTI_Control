unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient;

type
  TForm19 = class(TForm)
    Bevel6: TBevel;
    fechar: TSpeedButton;
    enviar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure enviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses Unit1, Unit3, Unit5, Unit6;

{$R *.dfm}

procedure TForm19.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Form3 <> nil then
Form3.Enabled:=True
else if Form5 <> nil then
Form5.Enabled:=True
else if Form6 <> nil then
Form6.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form19.Release;
Form19 := Nil;
end;

procedure TForm19.FormDestroy(Sender: TObject);
begin
if Form3 <> nil then
Form3.Enabled:=True
else if Form5 <> nil then
Form5.Enabled:=True
else if Form6 <> nil then
Form6.Enabled:=True;
end;

procedure TForm19.enviarClick(Sender: TObject);
var
a:string;
begin
if Trim(Edit1.Text) = '' then
MessageDlg(#13+'Preencha corretamente o campo Mensagem.', mtwarning, [mbOk], 0)
else
begin

Edit1.Enabled:=False;
enviar.Enabled:=False;

if Form3 <> nil then
IdIcmpClient1.Host := Form3.dbip.Text
else if Form5 <> nil then
IdIcmpClient1.Host := Form5.dbip.Text
else if Form6 <> nil then
IdIcmpClient1.Host := Form6.dbip.Text;

IdIcmpClient1.Ping;

if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
begin
a:='net send '+Edit2.Text+' '+Trim(Edit1.Text);
Winexec(pchar(a),SW_HIDE);
MessageDlg(#13+'Mensagem enviada para '+Label3.Caption+' com sucesso!', mtinformation, [mbOk], 0);
Edit1.Enabled:=True;
enviar.Enabled:=True;
Edit1.SetFocus;
end
else
begin
MessageDlg(#13+'Não foi possível enviar a mensagem para '+Label3.Caption+'.', mtwarning, [mbOk], 0);
Edit1.Enabled:=True;
enviar.Enabled:=True;
Edit1.SetFocus;
end;

end;

end;

procedure TForm19.FormShow(Sender: TObject);
begin

if Form3 <> nil then
begin

 if Form3.dbusuario.Text = 'N/A' then
 Label3.Caption:=Form3.dbnomepc.Text+' - '+Form3.dbsetor.Text
 else if Form3.dbusuario.Text = 'ADMINISTRATOR' then
 Label3.Caption:=Form3.dbnomepc.Text
 else
 Label3.Caption:=Form3.dbusuario.Text;

Edit2.Text:=Form3.dbip.Text;
end
else if Form5 <> nil then
begin

 if Form5.dbusuario.Text = 'N/A' then
 Label3.Caption:=Form5.dbnomepc.Text+' - '+Form5.dbsetor.Text
 else if Form5.dbusuario.Text = 'ADMINISTRATOR' then
 Label3.Caption:=Form5.dbnomepc.Text
 else
 Label3.Caption:=Form5.dbusuario.Text;

Edit2.Text:=Form5.dbip.Text;
end
else if Form6 <> nil then
begin

 if Form6.dbusuario.Text = 'N/A' then
 Label3.Caption:=Form6.dbnomepc.Text+' - '+Form6.dbsetor.Text
 else if Form6.dbusuario.Text = 'ADMINISTRATOR' then
 Label3.Caption:=Form6.dbnomepc.Text
 else
 Label3.Caption:=Form6.dbusuario.Text;

Edit2.Text:=Form6.dbip.Text;
end;

end;

procedure TForm19.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '"/';
Var
Str,a : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
Edit1.SetFocus;
end;

if key = #13 then
begin
if Trim(Edit1.Text) = '' then
MessageDlg(#13+'Preencha corretamente o campo Mensagem.', mtwarning, [mbOk], 0)
else
begin

Edit1.Enabled:=False;
enviar.Enabled:=False;

if Form3 <> nil then
IdIcmpClient1.Host := Form3.dbip.Text
else if Form5 <> nil then
IdIcmpClient1.Host := Form5.dbip.Text
else if Form6 <> nil then
IdIcmpClient1.Host := Form6.dbip.Text;

IdIcmpClient1.Ping;

if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
begin
a:='net send '+Edit2.Text+' '+Trim(Edit1.Text);
Winexec(pchar(a),SW_HIDE);
MessageDlg(#13+'Mensagem enviada para '+Label3.Caption+' com sucesso!', mtinformation, [mbOk], 0);
Edit1.Enabled:=True;
enviar.Enabled:=True;
Edit1.SetFocus;
end
else
begin
MessageDlg(#13+'Não foi possível enviar a mensagem para '+Label3.Caption+'.', mtwarning, [mbOk], 0);
Edit1.Enabled:=True;
enviar.Enabled:=True;
Edit1.SetFocus;
end;
end;

end;

end;

end.
