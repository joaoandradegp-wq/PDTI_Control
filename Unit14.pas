unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons,
  ExtCtrls;

type
  TForm14 = class(TForm)
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    Label1: TLabel;
    fechar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel7: TBevel;
    Bevel2: TBevel;
    Label21: TLabel;
    dbcodigo: TDBText;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dbsisdia: TDBEdit;
    dbnome: TDBEdit;
    dbsetor: TDBEdit;
    dbmemo: TDBMemo;
    dbsenha: TDBEdit;
    dbtsystem: TDBEdit;
    procedure fecharClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  aux :string;
  vet :integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm14.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm14.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
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
      ADOQuery1.sql.Add('Select * from tsystems where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from tsystems where nome like "%'+uppercase(trim(Edit1.text))+'%" order by nome');
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
     end;
   end;
end;

end;

procedure TForm14.Edit2KeyPress(Sender: TObject; var Key: Char);
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
      ADOQuery1.sql.Add('Select * from tsystems where tsystems like "'+uppercase(trim(Edit2.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from tsystems where tsystems like "%'+uppercase(trim(Edit2.text))+'%" order by nome');
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
     MessageDlg(#13+'Usu·rio '+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit2.Text:='';
     Edit2.SetFocus;
     end;
   end;
end;

end;

procedure TForm14.SpeedButton1Click(Sender: TObject);
begin
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
      ADOQuery1.sql.Add('Select * from tsystems where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from tsystems where nome like "%'+uppercase(trim(Edit1.text))+'%" order by nome');
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
     MessageDlg(#13+aux+' n„o encontrada no Sistema!', mtwarning, [mbOk], 0);
     Edit1.Text:='';
     Edit1.SetFocus;
     end;
   end;

end;

procedure TForm14.SpeedButton2Click(Sender: TObject);
begin
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
      ADOQuery1.sql.Add('Select * from tsystems where tsystems like "'+uppercase(trim(Edit2.text))+'%" order by nome');
      ADOQuery1.open;
      DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      end
        else
        begin
        ADOQuery1.sql.Add('Select * from tsystems where tsystems like "%'+uppercase(trim(Edit2.text))+'%" order by nome');
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
     MessageDlg(#13+'Usu·rio '+aux+' n„o encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit2.Text:='';
     Edit2.SetFocus;
     end;
   end;

end;

procedure TForm14.FormActivate(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
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
Form14.Release;
Form14 := Nil;
end;

procedure TForm14.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm14.Edit1Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

procedure TForm14.Edit2Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

procedure TForm14.ComboBox2Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit1.Text:='';
end;

procedure TForm14.ComboBox1Enter(Sender: TObject);
begin
ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
Edit2.Text:='';
end;

end.
