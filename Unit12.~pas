unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, WinSkinData, ExtCtrls, IniFiles,
  Menus;

type
  TLogin = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SkinData1: TSkinData;
    ADOConnection1: TADOConnection;
    SpeedButton2: TSpeedButton;
    ProgramIcon: TImage;
    Label3: TLabel;
    Edit3: TEdit;
    SpeedButton3: TSpeedButton;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Sobre1: TMenuItem;
    ADOQuery1: TADOQuery;
    ADOQuery1codigo: TAutoIncField;
    ADOQuery1login: TWideStringField;
    ADOQuery1senha: TWideStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;
  conexao:string;
  ArqIni : TIniFile;
  Dir: string;
  usuario: string;
  senha: string;

implementation

uses Unit1, Unit8, U_Cipher;

{$R *.dfm}

procedure TLogin.SpeedButton1Click(Sender: TObject);
begin
usuario:='';
senha:='';

SpeedButton1.Enabled:=False;

 if Trim(Edit3.Text) = '' then
 begin
 MessageDlg(#13+'Digite o local onde está o Banco de Dados!', mtwarning, [mbOk], 0);
 Edit3.SetFocus;
 SpeedButton1.Enabled:=True;
 end
   else
   begin
     If not(fileexists(Trim(Edit3.Text))) then
     begin
     MessageDlg(#13+'Base de dados não encontrada!', mtwarning, [mbOk], 0);
     Edit3.SetFocus;
     SpeedButton1.Enabled:=True;
     end
       else
       begin
           conexao:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Trim(Edit3.Text)+';Persist Security Info=False';
           ADOConnection1.ConnectionString:=conexao;

           ADOQuery1.close;
           ADOQuery1.sql.clear;
           ADOQuery1.sql.Add('Select * from admin where login= "'+trim(Edit1.text)+'" and senha= "'+Md5Hash(Trim(Edit2.text))+'"');
           ADOQuery1.open;

           if ADOQuery1.RecordCount > 0 then
           begin
           ArqIni := TIniFile.Create('C:\PDTI\conbd.Ini');
           Try
           ArqIni.WriteString('LOGIN', 'CONEXAO', Trim(Edit3.Text));
           ArqIni.WriteString('LOGIN', 'USUARIO', Trim(Edit1.Text));
           Finally
           ArqIni.Free;
           end;

           usuario:=ADOQuery1.FieldByName('login').Value;
           senha:=ADOQuery1.FieldByName('senha').Value;

            if (Trim(Edit1.Text) = usuario)
            and (Md5Hash(Trim(Edit2.Text)) = senha) then
            begin
            Application.CreateForm(Tfrmprincipal, frmprincipal);{Carrega form na memória}
            frmprincipal.ShowModal;{Mostra form em modo exclusivo}
            frmprincipal.Free; {Libera Memória}
            end
             else
             begin
             SpeedButton1.Enabled:=True;
             ADOConnection1.Close;
             MessageDlg(#13+'Login ou senha inválidos!', mtwarning, [mbOk], 0);
             Edit1.SetFocus;
             end;
           end
           else
           begin
           ADOConnection1.Close;
           MessageDlg(#13+'Login ou senha inválidos!', mtwarning, [mbOk], 0);
           Edit1.SetFocus;
           SpeedButton1.Enabled:=True;
           end;
       end;
   end;
end;

procedure TLogin.FormCreate(Sender: TObject);
begin
conexao:='';
Dir := 'C:\PDTI';

if not DirectoryExists(Dir) then
ForceDirectories(Dir);

ArqIni := TIniFile.Create('C:\PDTI\conbd.Ini');
Try
Edit3.Text := ArqIni.ReadString('LOGIN', 'CONEXAO', Edit3.Text );
Edit1.Text := ArqIni.ReadString('LOGIN', 'USUARIO', Edit1.Text );
Finally
ArqIni.Free;
end;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Login.Release;
Login := Nil;
end;

procedure TLogin.SpeedButton2Click(Sender: TObject);
begin
Close;
end;

procedure TLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>0123456789!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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

procedure TLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Var
Str : String;
begin
usuario:='';
senha:='';

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

if key = #13 then
begin
SpeedButton1.Enabled:=False;

 if Trim(Edit3.Text) = '' then
 begin
 MessageDlg(#13+'Digite o local onde está o Banco de Dados!', mtwarning, [mbOk], 0);
 Edit3.SetFocus;
 SpeedButton1.Enabled:=True;
 end
   else
   begin
     If not(fileexists(Trim(Edit3.Text))) then
     begin
     MessageDlg(#13+'Base de dados não encontrada!', mtwarning, [mbOk], 0);
     Edit3.SetFocus;
     SpeedButton1.Enabled:=True;
     end
       else
       begin
           conexao:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Trim(Edit3.Text)+';Persist Security Info=False';
           ADOConnection1.ConnectionString:=conexao;

           ADOQuery1.close;
           ADOQuery1.sql.clear;
           ADOQuery1.sql.Add('Select * from admin where login= "'+trim(Edit1.text)+'" and senha= "'+Md5Hash(Trim(Edit2.text))+'"');
           ADOQuery1.open;

           if ADOQuery1.RecordCount > 0 then
           begin
           ArqIni := TIniFile.Create('C:\PDTI\conbd.Ini');
           Try
           ArqIni.WriteString('LOGIN', 'CONEXAO', Trim(Edit3.Text));
           ArqIni.WriteString('LOGIN', 'USUARIO', Trim(Edit1.Text));
           Finally
           ArqIni.Free;
           end;

           usuario:=ADOQuery1.FieldByName('login').Value;
           senha:=ADOQuery1.FieldByName('senha').Value;

            if (Trim(Edit1.Text) = usuario)
            and (Md5Hash(Trim(Edit2.Text)) = senha) then
            begin
            Application.CreateForm(Tfrmprincipal, frmprincipal);{Carrega form na memória}
            frmprincipal.ShowModal;{Mostra form em modo exclusivo}
            frmprincipal.Free; {Libera Memória}
            end
             else           
             begin
             SpeedButton1.Enabled:=True;
             ADOConnection1.Close;
             MessageDlg(#13+'Login ou senha inválidos!', mtwarning, [mbOk], 0);
             Edit1.SetFocus;
             end;
           end
           else
           begin
           ADOConnection1.Close;
           MessageDlg(#13+'Login ou senha inválidos!', mtwarning, [mbOk], 0);
           Edit1.SetFocus;
           SpeedButton1.Enabled:=True;
           end;
       end;
   end;
end;

end;

procedure TLogin.SpeedButton3Click(Sender: TObject);
begin
If OpenDialog1.Execute then
Edit3.Text:=OpenDialog1.FileName;
end;

procedure TLogin.Edit3KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_-+={}[]?;,.|/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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
Edit3.SetFocus;
end;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
if Trim(Edit3.Text) <> '' then
Edit1.SetFocus
else
Edit3.SetFocus;

if Trim(Edit1.Text) <> '' then
Edit2.SetFocus
else
Edit1.SetFocus;

end;

procedure TLogin.Sobre1Click(Sender: TObject);
begin
Aboutbox.Visible:=True;
Login.Enabled:=False;
end;

end.
