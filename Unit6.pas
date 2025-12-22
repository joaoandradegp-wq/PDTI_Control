unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons,
  ExtCtrls, ComObj, ADODB, IdBaseComponent, IdComponent, IdRawBase,
  IdRawClient, IdIcmpClient, ShellApi;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    DataSource1: TDataSource;
    Edit2: TEdit;
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    Label1: TLabel;
    fechar: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    SpeedButton2: TSpeedButton;
    Bevel7: TBevel;
    Bevel2: TBevel;
    ADOQuery1: TADOQuery;
    Label17: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    dblocal: TDBEdit;
    dbip: TDBEdit;
    dbusuario: TDBEdit;
    dbnomepc: TDBEdit;
    dbmemo: TDBMemo;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label5: TLabel;
    dbsetor: TDBEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    IdIcmpClient1: TIdIcmpClient;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    vnc: TSpeedButton;
    netsend: TSpeedButton;
    verifica: TSpeedButton;
    raiz: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure fecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure verificaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Timer1Timer(Sender: TObject);
    procedure vncClick(Sender: TObject);
    procedure netsendClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure raizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  aux :string;
  vet :integer;

implementation

uses Unit1, Unit12, Unit19;

{$R *.dfm}

//FUN«√O PARA ABRIR PASTA NO EXPLORER
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

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Edit1.Text:='';
Edit2.Text:='';
DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label3.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form6.Release;
Form6 := Nil;
end;


procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

if trim(Edit1.Text) = '' then   //Se o Edit1 for igual ‡ VAZIO
begin
aux:=Label16.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' v·lido!', mtwarning, [mbOk], 0);
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox1.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where nome_computador like "'+uppercase(trim(Edit1.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
      else
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where nome_computador like "%'+uppercase(trim(Edit1.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

      if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
      begin
      aux:=Label16.Caption;
      vet:=length(aux);
      delete(aux,vet,1);

      ADOQuery1.Active:=false;
      DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
      Label3.Caption:='Nenhum Registro';
      MessageDlg(#13+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
      Edit1.Text:='';
      Edit1.SetFocus;
      end
       else
       begin
       netsend.Enabled:=True;
       raiz.Enabled:=True;
       verifica.Enabled:=True;
       Timer1.Enabled:=True;
       end;
   end;

end;

procedure TForm6.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

if trim(Edit2.Text) = '' then   //Se o Edit1 for igual ‡ VAZIO
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' v·lido!', mtwarning, [mbOk], 0);
Edit2.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox2.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where ip like "'+uppercase(trim(Edit2.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
      else
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where ip like "%'+uppercase(trim(Edit2.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

      if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
      begin
      aux:=Label1.Caption;
      vet:=length(aux);
      delete(aux,vet,1);

      ADOQuery1.Active:=false;
      DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
      Label3.Caption:='Nenhum Registro';
      MessageDlg(#13+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
      Edit2.Text:='';
      Edit2.SetFocus;
      end
       else
       begin
       netsend.Enabled:=True;
       raiz.Enabled:=True;
       verifica.Enabled:=True;
       Timer1.Enabled:=True;
       end;
   end;
  
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
Edit1.SetFocus;
end;

if key = #13 then
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

if trim(Edit1.Text) = '' then   //Se o Edit1 for igual ‡ VAZIO
begin
aux:=Label16.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' v·lido!', mtwarning, [mbOk], 0);
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox1.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where nome_computador like "'+uppercase(trim(Edit1.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
      else
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where nome_computador like "%'+uppercase(trim(Edit1.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

      if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
      begin
      aux:=Label16.Caption;
      vet:=length(aux);
      delete(aux,vet,1);

      ADOQuery1.Active:=false;
      DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
      Label3.Caption:='Nenhum Registro';
      MessageDlg(#13+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
      Edit1.Text:='';
      Edit1.SetFocus;
      end
       else
       begin
       netsend.Enabled:=True;
       raiz.Enabled:=True;
       verifica.Enabled:=True;
       Timer1.Enabled:=True;
       end;
   end;
end;

end;

procedure TForm6.FormActivate(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm6.Edit2KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
Edit2.SetFocus;
end;

if key = #13 then
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

if trim(Edit2.Text) = '' then   //Se o Edit1 for igual ‡ VAZIO
begin
aux:=Label1.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' v·lido!', mtwarning, [mbOk], 0);
Edit2.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox2.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where ip like "'+uppercase(trim(Edit2.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
      else
      begin
      ADOQuery1.sql.Add('Select * from controle_ips where ip like "%'+uppercase(trim(Edit2.text))+'%" order by nome_computador');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

      if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
      begin
      aux:=Label1.Caption;
      vet:=length(aux);
      delete(aux,vet,1);

      ADOQuery1.Active:=false;
      DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
      Label3.Caption:='Nenhum Registro';
      MessageDlg(#13+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
      Edit2.Text:='';
      Edit2.SetFocus;
      end
       else
       begin
       netsend.Enabled:=True;
       raiz.Enabled:=True;
       verifica.Enabled:=True;
       Timer1.Enabled:=True;
       end;
   end;
end;

end;

procedure TForm6.verificaClick(Sender: TObject);
var
ip :string;
begin
label9.Caption:='';
DBGrid1.Enabled:=False;
verifica.Enabled:=False;

ip:=dbip.Text;
IdIcmpClient1.Host := ip;
IdIcmpClient1.Ping;

 if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
 begin
 Label9.Left:=13;
 Label9.Caption := 'ONLINE';
 Label9.Font.Color:=clBlue;
 end
    else
    begin
    Label9.Left:=11;
    Label9.Caption := 'OFFLINE';
    Label9.Font.Color:=clRed;
    end;

DBGrid1.Enabled:=True;
verifica.Enabled:=True;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
Label9.Caption := '';
end;

procedure TForm6.Timer1Timer(Sender: TObject);
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

procedure TForm6.vncClick(Sender: TObject);
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

procedure TForm6.netsendClick(Sender: TObject);
begin
Application.CreateForm(TForm19, Form19);{Carrega form na memÛria}
Form19.ShowModal;{Mostra form em modo exclusivo}
Form19.Free; {Libera MemÛria}
frmprincipal.Enabled:=False;
end;

procedure TForm6.Edit1Enter(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

procedure TForm6.ComboBox1Enter(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

procedure TForm6.Edit2Enter(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

procedure TForm6.ComboBox2Enter(Sender: TObject);
begin
vnc.Enabled:=False;
Timer1.Enabled:=False;
netsend.Enabled:=False;
raiz.Enabled:=False;
verifica.Enabled:=False;
Label9.Caption := '';

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

procedure TForm6.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Label9.Caption := '';
end;

procedure TForm6.raizClick(Sender: TObject);
begin
execExplorer('\\'+dbip.Text+'\c$\', True,True);
end;

end.

