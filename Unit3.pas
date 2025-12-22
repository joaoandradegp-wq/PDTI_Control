unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, ComObj,
  ADODB, icmp, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, Gauges, ShellApi, Animate, GIFCtrl;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    abrir: TSpeedButton;
    atualizar: TSpeedButton;
    fechar: TSpeedButton;
    Label17: TLabel;
    dbnomepc: TDBEdit;
    dbip: TDBEdit;
    dbusuario: TDBEdit;
    dblocal: TDBEdit;
    ADOQuery1: TADOQuery;
    Bevel7: TBevel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label4: TLabel;
    dbsetor: TDBEdit;
    dbmemo: TDBMemo;
    ADOQuery1ip: TWideStringField;
    ADOQuery1Cdigo: TAutoIncField;
    ADOQuery1nome_computador: TWideStringField;
    ADOQuery1usuario: TWideStringField;
    ADOQuery1obs: TMemoField;
    ADOQuery1setor: TWideStringField;
    ADOQuery1localz: TWideStringField;
    GroupBox3: TGroupBox;
    IdIcmpClient1: TIdIcmpClient;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    vnc: TSpeedButton;
    Timer1: TTimer;
    combo_local: TComboBox;
    netsend: TSpeedButton;
    verifica: TSpeedButton;
    Label9: TLabel;
    raiz: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure abrirClick(Sender: TObject);
    procedure atualizarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fecharClick(Sender: TObject);
    procedure vncClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure combo_localChange(Sender: TObject);
    procedure netsendClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure verificarClick(Sender: TObject);
    procedure verificaClick(Sender: TObject);
    procedure raizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  nr: integer;

implementation

uses Unit1, Unit12, Unit19;

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

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label2.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form3.Release;
Form3 := Nil;
end;

procedure TForm3.abrirClick(Sender: TObject);
begin
abrir.Enabled:=False;
ADOQuery1.Active:=True;
combo_local.ItemIndex:=0;

   if ADOQuery1.RecordCount > 0 then
   begin
   combo_local.Enabled:=True;
   DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
   atualizar.Enabled:=True;
   verifica.Enabled:=True;
   Timer1.Enabled:=True;
   netsend.Enabled:=True;
   raiz.Enabled:=True;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

   end
    else if ADOQuery1.RecordCount = 0 then
    begin
    combo_local.Enabled:=False;
    vnc.Enabled:=False;
    Timer1.Enabled:=False;
    netsend.Enabled:=False;
    raiz.Enabled:=False;
    Label2.Caption:='Nenhum Registro';
    ADOQuery1.Active:=False;
    MessageDlg(#13+'Não existem registros a serem mostrados!', mtWarning, [mbOk], 0);
    end;

end;

procedure TForm3.atualizarClick(Sender: TObject);
begin
label5.Caption:='';
combo_local.Enabled:=False;

//Abaixo são os Botões
atualizar.Enabled:=False;
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
DBGrid1.Enabled:=False;
verifica.Enabled:=False;

//Abaixo são os Edits
dbnomepc.Enabled:=False;
dbusuario.Enabled:=False;
dbip.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

ADOQuery1.Active:=False;
ADOQuery1.Active:=True;
ADOQuery1.Refresh;

  if ADOQuery1.RecordCount = 0 then
  begin
  abrir.Enabled:=True;
  atualizar.Enabled:=False;
  MessageDlg(#13+'Não existem registros a serem mostrados!', mtWarning, [mbOk], 0);
  end
   else
   begin
   combo_local.Enabled:=True;

   //Abaixo são os Botões
   atualizar.Enabled:=True;
   Timer1.Enabled:=True;
   netsend.Enabled:=True;
   raiz.Enabled:=True;
   DBGrid1.Enabled:=True;
   verifica.Enabled:=True;

   //Abaixo são os Edits
   dbnomepc.Enabled:=True;
   dbusuario.Enabled:=True;
   dbip.Enabled:=True;
   dblocal.Enabled:=True;
   dbsetor.Enabled:=True;
   dbmemo.Enabled:=True;
   end;

MessageDlg(#13+'Banco de Dados atualizado com sucesso!', mtinformation, [mbOk], 0);
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
Close;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm3.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm3.vncClick(Sender: TObject);
var
a:string;
b:string;
begin

if varvnc = 1 then
begin
a:='C:\Arquivos de programas\RealVNC\VNC4\vncviewer.exe '+dbip.Text;
Winexec(pchar(a),SW_SHOWNORMAL);
end
else
begin
b:='C:\Program Files\RealVNC\VNC4\vncviewer.exe '+dbip.Text;
Winexec(pchar(b),SW_SHOWNORMAL);
end;

end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
 if (fileexists('C:\Arquivos de programas\RealVNC\VNC4\vncviewer.exe')) then
 begin
 vnc.Enabled:=True;
 varvnc:=1;
 end
   else if (fileexists('C:\Program Files\RealVNC\VNC4\vncviewer.exe')) then
   begin
   vnc.Enabled:=True;
   varvnc:=2;
   end
    else
    begin
    vnc.Enabled:=False;
    varvnc:=0;
    end;
end;

procedure TForm3.combo_localChange(Sender: TObject);
begin
  ADOQuery1.close;
  ADOQuery1.sql.clear;

  if combo_local.ItemIndex = 0 then
  ADOQuery1.sql.Add('Select * from controle_ips order by usuario')
  else
  ADOQuery1.sql.Add('Select * from controle_ips where localz="'+uppercase(combo_local.Text)+'" order by usuario');

  ADOQuery1.open;
  DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

   if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
   Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
   else
   Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

   if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
   begin
   ADOQuery1.Active:=false;
   DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
   Label2.Caption:='Nenhum Registro';
   MessageDlg(#13+'Não existem máquinas cadastradas em CARDIESEL no Sistema!', mtWarning, [mbOk], 0);
   end;
   
end;

procedure TForm3.netsendClick(Sender: TObject);
begin
Application.CreateForm(TForm19, Form19);{Carrega form na memória}
Form19.ShowModal;{Mostra form em modo exclusivo}
Form19.Free; {Libera Memória}
frmprincipal.Enabled:=False;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
Label5.Caption := '';
end;

procedure TForm3.verificarClick(Sender: TObject);
var
ip :string;
begin
label5.Caption:='';
DBGrid1.Enabled:=False;
verifica.Enabled:=False;

ip:=dbip.Text;
IdIcmpClient1.Host := ip;
IdIcmpClient1.Ping;

 if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
 begin
 Label5.Left:=13;
 Label5.Caption := 'ONLINE';
 Label5.Font.Color:=clBlue;
 end
    else
    begin
    Label5.Left:=11;
    Label5.Caption := 'OFFLINE';
    Label5.Font.Color:=clRed;
    end;

DBGrid1.Enabled:=True;
verifica.Enabled:=True;
end;


procedure TForm3.verificaClick(Sender: TObject);
var
ip :string;
begin
label5.Caption:='';
DBGrid1.Enabled:=False;
verifica.Enabled:=False;

ip:=dbip.Text;
IdIcmpClient1.Host := ip;
IdIcmpClient1.Ping;

 if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
 begin
 Label5.Left:=13;
 Label5.Caption := 'ONLINE';
 Label5.Font.Color:=clBlue;
 end
    else
    begin
    Label5.Left:=11;
    Label5.Caption := 'OFFLINE';
    Label5.Font.Color:=clRed;
    end;

DBGrid1.Enabled:=True;
verifica.Enabled:=True;
end;

procedure TForm3.raizClick(Sender: TObject);
begin
execExplorer('\\'+dbip.Text+'\c$\', True,True);
end;

end.

