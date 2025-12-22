unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Printers, Buttons, DB, DBTables,
  DBCtrls, ExtDlgs, jpeg, WinSkinData, ADODB, ShellApi;

type
  TFrmprincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    Consultar1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    memail: TMenuItem;
    mramal: TMenuItem;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    mip: TMenuItem;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Timer1: TTimer;
    SpeedButton9: TSpeedButton;
    IPs1: TMenuItem;
    Ramais1: TMenuItem;
    Emails1: TMenuItem;
    RelaoCompletadeIPs1: TMenuItem;
    UsurioseLocais1: TMenuItem;
    ComputadoreseIPs1: TMenuItem;
    ToolButton1: TToolButton;
    NomeeRamal1: TMenuItem;
    RelaoCompleta1: TMenuItem;
    SpeedButton3: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton7: TSpeedButton;
    vnc: TSpeedButton;
    dremote: TSpeedButton;
    tarantella: TSpeedButton;
    Image1: TImage;
    SpeedButton10: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Systems1: TMenuItem;
    Systems2: TMenuItem;
    RelaoCompleta2: TMenuItem;
    N1: TMenuItem;
    Integrados1: TMenuItem;
    TarantellaNativeClient1: TMenuItem;
    Conexodereadetrabalhoremota1: TMenuItem;
    VNCViewer1: TMenuItem;
    ToolButton4: TToolButton;
    SpeedButton13: TSpeedButton;
    ServiosTarantella1: TMenuItem;
    SpeedButton14: TSpeedButton;
    N2: TMenuItem;
    ServiosTarantella2: TMenuItem;
    RelaoCompleta3: TMenuItem;
    N3: TMenuItem;
    SpeedButton15: TSpeedButton;
    ToolButton5: TToolButton;
    Grficos1: TMenuItem;
    SpeedButton16: TSpeedButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    RelaoCompleta4: TMenuItem;
    Nome1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure mgeralClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure mgraficoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mramalClick(Sender: TObject);
    procedure memailClick(Sender: TObject);
    procedure menderecoClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RelaoCompletadeIPs1Click(Sender: TObject);
    procedure ComputadoreseIPs1Click(Sender: TObject);
    procedure UsurioseLocais1Click(Sender: TObject);
    procedure IPs1Click(Sender: TObject);
    procedure Ramais1Click(Sender: TObject);
    procedure NomeeRamal1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RelaoCompleta1Click(Sender: TObject);
    procedure vncClick(Sender: TObject);
    procedure dremoteClick(Sender: TObject);
    procedure tarantellaClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Systems1Click(Sender: TObject);
    procedure RelaoCompleta2Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TarantellaNativeClient1Click(Sender: TObject);
    procedure Conexodereadetrabalhoremota1Click(Sender: TObject);
    procedure VNCViewer1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ServiosTarantella1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure RelaoCompleta3Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Emails1Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure RelaoCompleta4Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure Nome1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmprincipal: TFrmprincipal;
  //Variáveis para pegar o nome dos Labels
  aux :string;
  vet :integer;
  //Variáveis pra extrair arquivos do tipo WORD
  MSWord: Variant;
  Dir: string;
  varremote: integer;
  varvnc: integer;

implementation
uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit10, Unit11, Unit12, Unit13, Unit14, Unit15, Unit16, Unit17, Unit18, Unit20, Unit21, Unit22;
{$R *.DFM}

//FUNÇÃO PARA ABRIR PASTA NO EXPLORER
function ExecExplorer(OpenAtPath: string; OpenWithExplorer, OpenAsRoot: Boolean): boolean;
var
s: string;
begin
if OpenWithExplorer then
begin
if OpenAsRoot then
s := ' /e,/root,"' + OpenAtPath + '"'
else
s := ' /e,"' + OpenAtPath + '"';
end
else
s := '"' + OpenAtPath + '"';
result := ShellExecute(Application.Handle,PChar('open'),PChar('explorer.exe'),PChar(s),nil,SW_NORMAL) > 32;
end;

function mostrahora:string;
begin
  mostrahora:=timetostr(time);
end;

function mostradata:string;
var
  dthoje:tdatetime;
  diasemana:integer;
  strdiasemana:string;
begin
  dthoje:=date;
  diasemana:=dayofweek(dthoje);
  case diasemana of
  1:strdiasemana:='Domingo';
  2:strdiasemana:='Segunda-feira';
  3:strdiasemana:='Terça-feira';
  4:strdiasemana:='Quarta-feira';
  5:strdiasemana:='Quinta-feira';
  6:strdiasemana:='Sexta-feira';
  7:strdiasemana:='Sábado';
  end;
  mostradata:=strdiasemana+' '+datetostr(dthoje);
end;

procedure TFrmprincipal.Sair1Click(Sender: TObject);
begin
close;
end;

procedure TFrmprincipal.mgeralClick(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);{Carrega form na memória}
Form3.ShowModal;{Mostra form em modo exclusivo}
Form3.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton1Click(Sender: TObject);
begin
Application.CreateForm(TForm2, Form2);{Carrega form na memória}
Form2.ShowModal;{Mostra form em modo exclusivo}
Form2.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton2Click(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);{Carrega form na memória}
Form3.ShowModal;{Mostra form em modo exclusivo}
Form3.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton4Click(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);{Carrega form na memória}
Form5.ShowModal;{Mostra form em modo exclusivo}
Form5.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton5Click(Sender: TObject);
begin
Application.CreateForm(TForm6, Form6);{Carrega form na memória}
Form6.ShowModal;{Mostra form em modo exclusivo}
Form6.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton6Click(Sender: TObject);
begin
Application.CreateForm(TForm9, Form9);{Carrega form na memória}
Form9.ShowModal;{Mostra form em modo exclusivo}
Form9.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton8Click(Sender: TObject);
begin
Close;
end;

procedure TFrmprincipal.mgraficoClick(Sender: TObject);
begin
Application.CreateForm(TForm10, Form10);{Carrega form na memória}
Form10.ShowModal;{Mostra form em modo exclusivo}
Form10.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Timer1Timer(Sender: TObject);
begin
  STATUSBAR1.PANELS[0].TEXT:=mostrahora();
  STATUSBAR1.PANELS[1].TEXT:=mostradata();

 if (fileexists('C:\Arquivos de programas\RealVNC\VNC4\vncviewer.exe')) then
 begin
 vnc.Enabled:=True;
 VNCViewer1.Enabled:=True;
 varvnc:=1;
 end
   else if (fileexists('C:\Program Files\RealVNC\VNC4\vncviewer.exe')) then
   begin
   vnc.Enabled:=True;
   VNCViewer1.Enabled:=True;
   varvnc:=2;
   end
    else
    begin
    vnc.Enabled:=False;
    VNCViewer1.Enabled:=False;
    varvnc:=0;
    end;

  if (fileexists('C:\windows\system32\mstsc.exe')) then
  begin
  dremote.Enabled:=True; 
  Conexodereadetrabalhoremota1.Enabled:=True;
  varremote:=1;
  end
    else if (fileexists('C:\winnt\system32\mstsc.exe')) then
    begin
    dremote.Enabled:=True;
    Conexodereadetrabalhoremota1.Enabled:=True;
    varremote:=2;
    end
      else if (fileexists('C:\Program Files\Remote Desktop\mstsc.exe')) then
      begin
      dremote.Enabled:=True;
      Conexodereadetrabalhoremota1.Enabled:=True;
      varremote:=3;
      end
        else
        begin
        dremote.Enabled:=False;
        Conexodereadetrabalhoremota1.Enabled:=False;
        varremote:=0;
        end;

if not(fileexists('C:\ARQUIV~1\TARANT~1\TARANT~1\ttwebtop.exe')) then
begin
tarantella.Enabled:=False;
TarantellaNativeClient1.Enabled:=False;
end
else
begin
tarantella.Enabled:=True;
TarantellaNativeClient1.Enabled:=True;
end;

end;

procedure TFrmprincipal.mramalClick(Sender: TObject);
begin
Application.CreateForm(TForm4, Form4);{Carrega form na memória}
Form4.ShowModal;{Mostra form em modo exclusivo}
Form4.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.memailClick(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);{Carrega form na memória}
Form5.ShowModal;{Mostra form em modo exclusivo}
Form5.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.menderecoClick(Sender: TObject);
begin
Application.CreateForm(TForm6, Form6);{Carrega form na memória}
Form6.ShowModal;{Mostra form em modo exclusivo}
Form6.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Sobre1Click(Sender: TObject);
begin
Aboutbox.Visible:=True;
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton7Click(Sender: TObject);
begin
Application.CreateForm(TForm4, Form4);{Carrega form na memória}
Form4.ShowModal;{Mostra form em modo exclusivo}
Form4.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton9Click(Sender: TObject);
begin
Application.CreateForm(TForm11, Form11);{Carrega form na memória}
Form11.ShowModal;{Mostra form em modo exclusivo}
Form11.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmprincipal.Release;
frmprincipal := Nil;
Login.Close;
end;

procedure TFrmprincipal.FormCreate(Sender: TObject);
begin
Login.Visible:=False;
Login.ADOQuery1.Active:=False;

varremote:=0;
varvnc:=0;
end;

procedure TFrmprincipal.RelaoCompletadeIPs1Click(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);{Carrega form na memória}
Form3.ShowModal;{Mostra form em modo exclusivo}
Form3.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.ComputadoreseIPs1Click(Sender: TObject);
begin
Application.CreateForm(TForm6, Form6);{Carrega form na memória}
Form6.ShowModal;{Mostra form em modo exclusivo}
Form6.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.UsurioseLocais1Click(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);{Carrega form na memória}
Form5.ShowModal;{Mostra form em modo exclusivo}
Form5.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.IPs1Click(Sender: TObject);
begin
Application.CreateForm(TForm2, Form2);{Carrega form na memória}
Form2.ShowModal;{Mostra form em modo exclusivo}
Form2.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Ramais1Click(Sender: TObject);
begin
Application.CreateForm(TForm4, Form4);{Carrega form na memória}
Form4.ShowModal;{Mostra form em modo exclusivo}
Form4.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.NomeeRamal1Click(Sender: TObject);
begin
Application.CreateForm(TForm7, Form7);{Carrega form na memória}
Form7.ShowModal;{Mostra form em modo exclusivo}
Form7.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton3Click(Sender: TObject);
begin
Application.CreateForm(TForm7, Form7);{Carrega form na memória}
Form7.ShowModal;{Mostra form em modo exclusivo}
Form7.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.RelaoCompleta1Click(Sender: TObject);
begin
Application.CreateForm(TForm9, Form9);{Carrega form na memória}
Form9.ShowModal;{Mostra form em modo exclusivo}
Form9.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.vncClick(Sender: TObject);
begin
if varvnc = 1 then
Winexec('C:\Arquivos de programas\RealVNC\VNC4\vncviewer.exe',SW_SHOWNORMAL)
else
Winexec('C:\Program Files\RealVNC\VNC4\vncviewer.exe',SW_SHOWNORMAL);
end;

procedure TFrmprincipal.dremoteClick(Sender: TObject);
var
a:string;
b:string;
c:string;
begin

if varremote = 1 then
begin
a:='C:\windows\system32\mstsc.exe';
Winexec(pchar(a),SW_SHOWNORMAL);
end
else if varremote = 2 then
begin
b:='C:\winnt\system32\mstsc.exe';
Winexec(pchar(b),SW_SHOWNORMAL);
end
else
begin
c:='C:\Program Files\Remote Desktop\mstsc.exe';
Winexec(pchar(c),SW_SHOWNORMAL);
end;

end;

procedure TFrmprincipal.tarantellaClick(Sender: TObject);
begin
Winexec('C:\ARQUIV~1\TARANT~1\TARANT~1\ttwebtop.exe',SW_SHOWNORMAL);
end;

procedure TFrmprincipal.SpeedButton11Click(Sender: TObject);
begin
Application.CreateForm(TForm13, Form13);{Carrega form na memória}
Form13.ShowModal;{Mostra form em modo exclusivo}
Form13.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton12Click(Sender: TObject);
begin
Application.CreateForm(TForm10, Form10);{Carrega form na memória}
Form10.ShowModal;{Mostra form em modo exclusivo}
Form10.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Systems1Click(Sender: TObject);
begin
Application.CreateForm(TForm13, Form13);{Carrega form na memória}
Form13.ShowModal;{Mostra form em modo exclusivo}
Form13.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.RelaoCompleta2Click(Sender: TObject);
begin
Application.CreateForm(TForm10, Form10);{Carrega form na memória}
Form10.ShowModal;{Mostra form em modo exclusivo}
Form10.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton10Click(Sender: TObject);
begin
Application.CreateForm(TForm14, Form14);{Carrega form na memória}
Form14.ShowModal;{Mostra form em modo exclusivo}
Form14.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.N1Click(Sender: TObject);
begin
Application.CreateForm(TForm14, Form14);{Carrega form na memória}
Form14.ShowModal;{Mostra form em modo exclusivo}
Form14.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.TarantellaNativeClient1Click(Sender: TObject);
begin
Winexec('C:\ARQUIV~1\TARANT~1\TARANT~1\ttwebtop.exe',SW_SHOWNORMAL);
end;

procedure TFrmprincipal.Conexodereadetrabalhoremota1Click(Sender: TObject);
begin
if varremote = 1 then
Winexec('C:\windows\system32\mstsc.exe',SW_SHOWNORMAL)
else
Winexec('C:\winnt\system32\mstsc.exe',SW_SHOWNORMAL);
end;

procedure TFrmprincipal.VNCViewer1Click(Sender: TObject);
begin
if varvnc = 1 then
Winexec('C:\Arquivos de programas\RealVNC\VNC4\vncviewer.exe',SW_SHOWNORMAL)
else
Winexec('C:\Program Files\RealVNC\VNC4\vncviewer.exe',SW_SHOWNORMAL);
end;

procedure TFrmprincipal.SpeedButton13Click(Sender: TObject);
begin
Application.CreateForm(TForm15, Form15);{Carrega form na memória}
Form15.ShowModal;{Mostra form em modo exclusivo}
Form15.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.ServiosTarantella1Click(Sender: TObject);
begin
Application.CreateForm(TForm15, Form15);{Carrega form na memória}
Form15.ShowModal;{Mostra form em modo exclusivo}
Form15.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton14Click(Sender: TObject);
begin
Application.CreateForm(TForm16, Form16);{Carrega form na memória}
Form16.ShowModal;{Mostra form em modo exclusivo}
Form16.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.RelaoCompleta3Click(Sender: TObject);
begin
Application.CreateForm(TForm16, Form16);{Carrega form na memória}
Form16.ShowModal;{Mostra form em modo exclusivo}
Form16.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton15Click(Sender: TObject);
begin
Application.CreateForm(TForm17, Form17);{Carrega form na memória}
Form17.ShowModal;{Mostra form em modo exclusivo}
Form17.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Grficos1Click(Sender: TObject);
begin
Application.CreateForm(TForm17, Form17);{Carrega form na memória}
Form17.ShowModal;{Mostra form em modo exclusivo}
Form17.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton16Click(Sender: TObject);
begin
Application.CreateForm(TForm18, Form18);{Carrega form na memória}
Form18.ShowModal;{Mostra form em modo exclusivo}
Form18.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Emails1Click(Sender: TObject);
begin
Application.CreateForm(TForm20, Form20);{Carrega form na memória}
Form20.ShowModal;{Mostra form em modo exclusivo}
Form20.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton17Click(Sender: TObject);
begin
Application.CreateForm(TForm20, Form20);{Carrega form na memória}
Form20.ShowModal;{Mostra form em modo exclusivo}
Form20.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.RelaoCompleta4Click(Sender: TObject);
begin
Application.CreateForm(TForm21, Form21);{Carrega form na memória}
Form21.ShowModal;{Mostra form em modo exclusivo}
Form21.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton18Click(Sender: TObject);
begin
Application.CreateForm(TForm21, Form21);{Carrega form na memória}
Form21.ShowModal;{Mostra form em modo exclusivo}
Form21.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.SpeedButton19Click(Sender: TObject);
begin
Application.CreateForm(TForm22, Form22);{Carrega form na memória}
Form22.ShowModal;{Mostra form em modo exclusivo}
Form22.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TFrmprincipal.Nome1Click(Sender: TObject);
begin
Application.CreateForm(TForm22, Form22);{Carrega form na memória}
Form22.ShowModal;{Mostra form em modo exclusivo}
Form22.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

end.
