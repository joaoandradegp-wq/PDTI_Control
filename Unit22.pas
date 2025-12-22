unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Mask, DB, ADODB, Buttons,
  ExtCtrls;

type
  TForm22 = class(TForm)
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    fechar: TSpeedButton;
    Bevel7: TBevel;
    Bevel2: TBevel;
    Label21: TLabel;
    dbcodigo: TDBText;
    Edit1: TEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label17: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    dbnome: TDBEdit;
    dbsenha: TDBEdit;
    dbmail: TDBEdit;
    dbsetor: TDBEdit;
    dbmemo: TDBMemo;
    DBGrid1: TDBGrid;
    procedure fecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm22.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm22.SpeedButton1Click(Sender: TObject);
begin
if trim(Edit1.Text) = '' then   //Se o Edit1 for igual à VAZIO
begin
aux:=Label16.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' válido!', mtwarning, [mbOk], 0);
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

        ADOQuery1.sql.Add('Select * from emails where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     aux:=Label16.Caption;
     vet:=length(aux);
     delete(aux,vet,1);

     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+aux+' não encontrada no Sistema!', mtwarning, [mbOk], 0);
     Edit1.Text:='';
     Edit1.SetFocus;
     end;
   end;
end;

procedure TForm22.Edit1KeyPress(Sender: TObject; var Key: Char);
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
aux:=Label16.Caption;
vet:=length(aux);
delete(aux,vet,1);

ADOQuery1.Active:=false;
DBGrid1.Options:=[];
Label3.Caption:='Nenhum Registro';
MessageDlg(#13+'Digite um '+aux+' válido!', mtwarning, [mbOk], 0);
Edit1.SetFocus;
end

   else
   begin
   ADOQuery1.close;
   ADOQuery1.sql.clear;

        ADOQuery1.sql.Add('Select * from emails where nome like "'+uppercase(trim(Edit1.text))+'%" order by nome');
        ADOQuery1.open;
        DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

     if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
     Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
     else
     Label3.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

     if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
     begin
     aux:=Label16.Caption;
     vet:=length(aux);
     delete(aux,vet,1);

     ADOQuery1.Active:=false;
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     Label3.Caption:='Nenhum Registro';
     MessageDlg(#13+aux+' não encontrado no Sistema!', mtwarning, [mbOk], 0);
     Edit1.Text:='';
     Edit1.SetFocus;
     end;
   end;
end;

end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Edit1.Text:='';
DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
Label3.Caption:='Nenhum Registro';
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form22.Release;
Form22 := Nil;
end;

procedure TForm22.FormDestroy(Sender: TObject);
begin
Frmprincipal.Enabled:=True;
end;

end.
