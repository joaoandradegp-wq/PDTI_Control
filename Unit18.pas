unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls, Mask, DBCtrls,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient;

type
  TForm18 = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    enviar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    Bevel6: TBevel;
    fechar: TSpeedButton;
    Edit2: TEdit;
    ADOQuery1Cdigo: TAutoIncField;
    ADOQuery1nome_computador: TWideStringField;
    ADOQuery1usuario: TWideStringField;
    ADOQuery1ip: TWideStringField;
    ADOQuery1obs: TMemoField;
    ADOQuery1setor: TWideStringField;
    ADOQuery1localz: TWideStringField;
    IdIcmpClient1: TIdIcmpClient;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure enviarClick(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm18.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form18.Release;
Form18 := Nil;
end;

procedure TForm18.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm18.enviarClick(Sender: TObject);
var
a:string;
begin

if Trim(Edit1.Text) = '' then
MessageDlg(#13+'Preencha corretamente o campo Mensagem.', mtwarning, [mbOk], 0)
else
begin
ComboBox1.Enabled:=False;
enviar.Enabled:=False;
Edit1.Enabled:=False;

IdIcmpClient1.Host := Edit2.Text;
IdIcmpClient1.Ping;

if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
begin
  if ComboBox1.ItemIndex = 0 then
  begin
  a:='net send * '+Trim(Edit1.Text);
  Winexec(pchar(a),SW_HIDE);
  MessageDlg(#13+'Mensagem enviada para '+ComboBox1.Text+' com sucesso!', mtinformation, [mbOk], 0);

  ComboBox1.Enabled:=True;
  Edit1.Enabled:=True;
  enviar.Enabled:=True;
  Edit1.SetFocus;
  end
    else
    begin
    a:='net send '+Edit2.Text+' '+Trim(Edit1.Text);
    Winexec(pchar(a),SW_HIDE);
    MessageDlg(#13+'Mensagem enviada para '+ComboBox1.Text+' com sucesso!', mtinformation, [mbOk], 0);

    ComboBox1.Enabled:=True;
    Edit1.Enabled:=True;
    enviar.Enabled:=True;
    Edit1.SetFocus;
    end;
end
 else
 begin
 MessageDlg(#13+'Não foi possível enviar a mensagem para '+ComboBox1.Text+'.', mtwarning, [mbOk], 0);
 ComboBox1.Enabled:=True;
 Edit1.Enabled:=True;
 enviar.Enabled:=True;
 ComboBox1.SetFocus;
 end;
end;

end;

procedure TForm18.ComboBox1Select(Sender: TObject);
begin
ADOQuery1.close;
ADOQuery1.sql.clear;
ADOQuery1.sql.Add('Select * from controle_ips order by usuario');
ADOQuery1.Open;
end;

procedure TForm18.ComboBox1Enter(Sender: TObject);
var
i,y:integer;
begin
Combobox1.Items.Clear;
Combobox1.Items.Add('TODOS');
Combobox1.ItemIndex:=0;
ADOQuery1.Open;
y:=ADOQuery1.RecordCount;
i:=0;
while i < y do
begin
i:=i+1;
if ADOQuery1.Fieldbyname('setor').Value <> 'REDE MINEIRA' then
if ADOQuery1.Fieldbyname('usuario').Value <> 'N/A' then
if ADOQuery1.Fieldbyname('usuario').Value <> 'ADMINISTRATOR' then
Combobox1.Items.Add(UpperCase(ADOQuery1.Fieldbyname('usuario').Value));
ADOQuery1.Next;
end;
ADOQuery1.Close;
end;

procedure TForm18.ComboBox1Click(Sender: TObject);
begin
ADOQuery1.close;
ADOQuery1.sql.clear;
ADOQuery1.sql.Add('Select * from controle_ips where usuario="'+uppercase(ComboBox1.Text)+'" order by usuario');
ADOQuery1.Open;
if ComboBox1.ItemIndex <> 0 then
Edit2.Text:=ADOQuery1.FieldByName('ip').Value;
end;

procedure TForm18.Edit1KeyPress(Sender: TObject; var Key: Char);
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
   ComboBox1.Enabled:=False;
   enviar.Enabled:=False;
   Edit1.Enabled:=False;

   IdIcmpClient1.Host := Edit2.Text;
   IdIcmpClient1.Ping;

  if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
  begin
     if ComboBox1.ItemIndex = 0 then
     begin
     a:='net send * '+Trim(Edit1.Text);
     Winexec(pchar(a),SW_HIDE);

     MessageDlg(#13+'Mensagem enviada para '+ComboBox1.Text+' com sucesso!', mtinformation, [mbOk], 0);
     ComboBox1.Enabled:=True;
     Edit1.Enabled:=True;
     enviar.Enabled:=True;
     Edit1.SetFocus;
     end
       else
       begin
       a:='net send '+Edit2.Text+' '+Trim(Edit1.Text);
       Winexec(pchar(a),SW_HIDE);

       MessageDlg(#13+'Mensagem enviada para '+ComboBox1.Text+' com sucesso!', mtinformation, [mbOk], 0);
       ComboBox1.Enabled:=True;
       Edit1.Enabled:=True;
       enviar.Enabled:=True;
       Edit1.SetFocus;
       end;
   end
     else
     begin
     MessageDlg(#13+'Não foi possível enviar a mensagem para '+ComboBox1.Text+'.', mtwarning, [mbOk], 0);
     ComboBox1.Enabled:=True;
     Edit1.Enabled:=True;
     enviar.Enabled:=True;
     ComboBox1.SetFocus;
     end;
end;
end;

end;

procedure TForm18.FormShow(Sender: TObject);
begin
ComboBox1.ItemIndex:=0;
end;

end.
