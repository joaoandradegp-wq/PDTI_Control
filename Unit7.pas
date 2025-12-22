unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, DBCtrls, Buttons, ExtCtrls,ComObj,
  ADODB;

type
  TForm7 = class(TForm)
    Bevel3: TBevel;
    Label16: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    fechar: TSpeedButton;
    Bevel7: TBevel;
    Bevel2: TBevel;
    Label17: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label21: TLabel;
    dbcodigo: TDBText;
    Label1: TLabel;
    Label5: TLabel;
    dbramal: TDBEdit;
    dbnome: TDBEdit;
    dbsetor: TDBEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dbmemo: TDBMemo;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    ComboBox2: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit1, Unit12;

{$R *.DFM}


procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label3.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form7.Release;
Form7 := Nil;
end;

procedure TForm7.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm7.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
if trim(Edit1.Text) = '' then   //Se o Edit1 for igual à VAZIO
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um Nome válido!', mtwarning, [mbOk], 0);
Edit1.Text:='';
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox1.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from ramais where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from ramais where nome like "%'+uppercase(trim(Edit1.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
        end;

     if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
     Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
     else
     Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+'Nome não encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit1.Text:='';
     Edit1.SetFocus;
     end;
   end;
   
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
if trim(Edit2.Text) = '' then   //Se o Edit1 for igual à VAZIO
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um Ramal válido!', mtwarning, [mbOk], 0);
Edit2.Text:='';
Edit2.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox2.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from ramais where ramal="'+uppercase(trim(Edit2.text))+'" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from ramais where ramal like "%'+uppercase(trim(Edit2.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
        end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+'Ramal não encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit2.Text:='';
     Edit2.SetFocus;
     end;
   end;
   
end;

procedure TForm7.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%¨&*()_-+={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
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
if trim(Edit1.Text) = '' then   //Se o Edit1 for igual à VAZIO
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um Nome válido!', mtwarning, [mbOk], 0);
Edit1.Text:='';
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox1.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from ramais where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from ramais where nome like "%'+uppercase(trim(Edit1.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
        end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+'Nome não encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit1.Text:='';
     Edit1.SetFocus;
     end;
   end;
end;

end;

procedure TForm7.Edit2KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%¨&*()_+-={}[]?;:,.|\/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµşÚÛÙıİ';//caracteres especiais que sql não aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
min = 'abcdefghijklmnopqrstuvwxyz';
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
Edit2.SetFocus;
end;

if key = #13 then
begin
if trim(Edit2.Text) = '' then   //Se o Edit1 for igual à VAZIO
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um Ramal válido!', mtwarning, [mbOk], 0);
Edit2.Text:='';
Edit2.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

      if combobox2.ItemIndex = 0 then
      begin
      ADOQuery1.sql.Add('Select * from ramais where ramal="'+uppercase(trim(Edit2.text))+'" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from ramais where ramal like "%'+uppercase(trim(Edit2.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
        end;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+'Ramal não encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit2.Text:='';
     Edit2.SetFocus;
     end;
   end;
end;

end;

procedure TForm7.Edit1Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

procedure TForm7.ComboBox1Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

procedure TForm7.Edit2Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

procedure TForm7.ComboBox2Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

end.

