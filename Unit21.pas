unit Unit21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, DB, ADODB, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons;

type
  TForm21 = class(TForm)
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    fechar: TSpeedButton;
    Label17: TLabel;
    Bevel7: TBevel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    atualizar: TSpeedButton;
    dbnome: TDBEdit;
    dbsenha: TDBEdit;
    dbmail: TDBEdit;
    dbsetor: TDBEdit;
    dbmemo: TDBMemo;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Label11: TLabel;
    combosetor: TComboBox;
    procedure fecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure atualizarClick(Sender: TObject);
    procedure combo_localChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure combosetorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm21.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm21.SpeedButton1Click(Sender: TObject);
begin
SpeedButton1.Enabled:=False;
ADOQuery1.Active:=true;
combosetor.ItemIndex:=0;

   ADOQuery1.close;
   ADOQuery1.sql.clear;
   ADOQuery1.sql.Add('Select * from emails order by nome');
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

procedure TForm21.atualizarClick(Sender: TObject);
begin
atualizar.Enabled:=False;
combosetor.Enabled:=False;
DBGrid1.Enabled:=False;
dbnome.Enabled:=False;
dbsenha.Enabled:=False;
dbmail.Enabled:=False;
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
 dbsenha.Enabled:=True;
 dbmail.Enabled:=True;
 dbsetor.Enabled:=True;
 dbmemo.Enabled:=True;
 end;
MessageDlg(#13+'Banco de Dados atualizado com sucesso!', mtinformation, [mbOk], 0);
end;

procedure TForm21.combo_localChange(Sender: TObject);
begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combosetor.ItemIndex = 0 then
      ADOQuery1.sql.Add('Select * from emails order by nome')
      else
      ADOQuery1.sql.Add('Select * from emails where setor="'+uppercase(trim(combosetor.Text))+'" order by nome');

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

procedure TForm21.FormClose(Sender: TObject; var Action: TCloseAction);
begin
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label2.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form21.Release;
Form21 := Nil;
end;
end;

procedure TForm21.FormDestroy(Sender: TObject);
begin
Frmprincipal.Enabled:=True;
end;

procedure TForm21.combosetorChange(Sender: TObject);
begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combosetor.ItemIndex = 0 then
      ADOQuery1.sql.Add('Select * from emails order by nome')
      else
      ADOQuery1.sql.Add('Select * from emails where setor="'+uppercase(trim(combosetor.Text))+'" order by nome');

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
