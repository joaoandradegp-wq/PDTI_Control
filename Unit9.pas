unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  ADODB;

type
  TForm9 = class(TForm)
    fechar: TSpeedButton;
    Bevel7: TBevel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    atualizar: TSpeedButton;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbramal: TDBEdit;
    dbnome: TDBEdit;
    dbsetor: TDBEdit;
    dbmemo: TDBMemo;
    combosetor: TComboBox;
    Label3: TLabel;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure atualizarClick(Sender: TObject);
    procedure combosetorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit1, Unit12;

{$R *.dfm}


procedure TForm9.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label2.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form9.Release;
Form9 := Nil;
end;

procedure TForm9.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=true;
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
SpeedButton1.Enabled:=False;
ADOQuery1.Active:=true;
combosetor.ItemIndex:=0;

   ADOQuery1.close;
   ADOQuery1.sql.clear;
   ADOQuery1.sql.Add('Select * from ramais order by nome');
   ADOQuery1.open;

   if ADOQuery1.RecordCount > 0 then
   begin
   DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
   SpeedButton1.Enabled:=false;
   atualizar.Enabled:=true;
   combosetor.Enabled:=True;
      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';
   end
     else if ADOQuery1.RecordCount = 0 then
     begin
     Label2.Caption:='Nenhum Registro';
     ADOQuery1.Active:=False;
     MessageDlg(#13+'Não existem registros a serem mostrados!', mtWarning, [mbOk], 0);
     end;
end;

procedure TForm9.atualizarClick(Sender: TObject);
begin
atualizar.Enabled:=False;
combosetor.Enabled:=False;
DBGrid1.Enabled:=False;
dbnome.Enabled:=False;
dbramal.Enabled:=False;
dbsetor.Enabled:=False;
dbmemo.Enabled:=False;

ADOQuery1.Active:=False;
ADOQuery1.Active:=True;
ADOQuery1.Refresh;

if ADOQuery1.RecordCount = 0 then
begin
SpeedButton1.Enabled:=True;
atualizar.Enabled:=False;
MessageDlg(#13+'Não existem registros a serem mostrados!', mtWarning, [mbOk], 0);
end
 else
 begin
 atualizar.Enabled:=True;
 combosetor.Enabled:=True;
 DBGrid1.Enabled:=True;
 dbnome.Enabled:=True;
 dbramal.Enabled:=True;
 dbsetor.Enabled:=True;
 dbmemo.Enabled:=True;
 end;
MessageDlg(#13+'Banco de Dados atualizado com sucesso!', mtinformation, [mbOk], 0);
end;

procedure TForm9.combosetorChange(Sender: TObject);
begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combosetor.ItemIndex = 0 then
      ADOQuery1.sql.Add('Select * from ramais order by nome')
      else
      ADOQuery1.sql.Add('Select * from ramais where setor="'+uppercase(trim(combosetor.Text))+'" order by nome');

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
  MessageDlg(#13+'Não existem ramais cadastrados nesse setor no Sistema!', mtwarning, [mbOk], 0);
  combosetor.SetFocus;
  atualizar.Enabled:=False;
  SpeedButton1.Enabled:=True;
  combosetor.ItemIndex:=-1;
  combosetor.Enabled:=False;
  end;
end;

end.
