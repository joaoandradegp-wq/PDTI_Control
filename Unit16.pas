unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, Buttons, DB,
  ADODB, Animate, GIFCtrl;

type
  TForm16 = class(TForm)
    fechar: TSpeedButton;
    Bevel7: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    filtrar: TSpeedButton;
    Label6: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    abrir: TSpeedButton;
    atualizar: TSpeedButton;
    excluir: TSpeedButton;
    Bevel4: TBevel;
    deletar: TSpeedButton;
    dblocal: TDBEdit;
    dbsolicitante: TDBEdit;
    dbsetor: TDBEdit;
    dbservico: TDBEdit;
    combo_mes: TComboBox;
    edit_ano: TEdit;
    dbcodigo: TDBText;
    Label21: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbnumero: TDBEdit;
    dbdocumento: TDBEdit;
    dbcit: TDBEdit;
    dbmemo: TDBMemo;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Timer1: TTimer;
    ADOQuery1codigo: TAutoIncField;
    ADOQuery1solicitante: TWideStringField;
    ADOQuery1servico: TWideStringField;
    ADOQuery1local: TWideStringField;
    ADOQuery1documento: TWideStringField;
    ADOQuery1numero: TWideStringField;
    ADOQuery1cit: TWideStringField;
    ADOQuery1data: TDateTimeField;
    ADOQuery1mes: TWideStringField;
    ADOQuery1ano: TWideStringField;
    ADOQuery1hora: TWideStringField;
    ADOQuery1obs: TWideStringField;
    ADOQuery1setor: TWideStringField;
    ADOQuery1cadastrante: TWideStringField;
    dbcad: TDBText;
    Label13: TLabel;
    Bevel5: TBevel;
    ComboBox1: TComboBox;
    Label14: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery2codigo: TAutoIncField;
    ADOQuery2login: TWideStringField;
    ADOQuery2senha: TWideStringField;
    Label15: TLabel;
    Panel1: TPanel;
    RxGIFAnimator1: TRxGIFAnimator;
    procedure fecharClick(Sender: TObject);
    procedure abrirClick(Sender: TObject);
    procedure atualizarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure deletarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure filtrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm16.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm16.abrirClick(Sender: TObject);
begin
ADOQuery1.Active:=true;

   if ADOQuery1.RecordCount > 0 then
   begin
   DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
   abrir.Enabled:=false;
   atualizar.Enabled:=true;
   filtrar.Enabled:=True;
   excluir.Enabled:=True;

      if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
      else
      Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

   end
     else if ADOQuery1.RecordCount = 0 then
     begin
     Label2.Caption:='Nenhum Registro';
     ADOQuery1.Active:=False;
     MessageDlg(#13+'Não existem serviços cadastrados no Sistema!', mtWarning, [mbOk], 0);
     end;

end;

procedure TForm16.atualizarClick(Sender: TObject);
begin
//Abaixo são os Botões
atualizar.Enabled:=False;
excluir.Enabled:=False;
DBGrid1.Enabled:=False;

//Abaixo são os Edits
dbsolicitante.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbservico.Enabled:=False;
dbdocumento.Enabled:=False;
dbnumero.Enabled:=False;
dbcit.Enabled:=False;
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
   //Abaixo são os Botões
   atualizar.Enabled:=True;
   excluir.Enabled:=True;
   DBGrid1.Enabled:=True;

   //Abaixo são os Edits
   dbsolicitante.Enabled:=True;
   dblocal.Enabled:=True;
   dbsetor.Enabled:=True;
   dbservico.Enabled:=True;
   dbdocumento.Enabled:=True;
   dbnumero.Enabled:=True;
   dbcit.Enabled:=True;
   dbmemo.Enabled:=True;
   end;

MessageDlg(#13+'Banco de Dados atualizado com sucesso!', mtinformation, [mbOk], 0);
end;

procedure TForm16.excluirClick(Sender: TObject);
begin
if dbcit.Text = 'N/A' then
begin
    if MessageDlg(#13+'Deseja realmente excluir o registro abaixo?'+#13+#13+'Documento: '+dbdocumento.Text+#13+'Número: '+dbnumero.Text,mtConfirmation, [mbyes, mbcancel],0) = mrYes then
    begin
    MessageDlg(#13+'Registro de código '+dbcodigo.Caption+' deletado com sucesso!', mtinformation, [mbOk], 0);
    ADOQuery1.Delete;
    ADOQuery1.Refresh;
    end;
end
 else
 begin
    if MessageDlg(#13+'Deseja realmente excluir o registro abaixo?'+#13+#13+'Documento: '+dbdocumento.Text+#13+'Número: '+dbnumero.Text+#13+'CIT: '+dbcit.Text,mtConfirmation, [mbyes, mbcancel],0) = mrYes then
    begin
    MessageDlg(#13+'Registro de código '+dbcodigo.Caption+' deletado com sucesso!', mtinformation, [mbOk], 0);
    ADOQuery1.Delete;
    ADOQuery1.Refresh;
    end;
 end;

end;

procedure TForm16.deletarClick(Sender: TObject);
begin
if MessageDlg(#13+'Deseja realmente excluir TODOS os registros do mês de '+combo_mes.Text+' de '+edit_ano.Text+'?',mtConfirmation, [mbyes, mbcancel],0) = mrYes then
begin

//Abaixo os Edits
dbsolicitante.Enabled:=False;
dblocal.Enabled:=False;
dbsetor.Enabled:=False;
dbservico.Enabled:=False;
dbdocumento.Enabled:=False;
dbnumero.Enabled:=False;
dbcit.Enabled:=False;
dbmemo.Enabled:=False;

//Abaixo os Botões
atualizar.Enabled:=False;
excluir.Enabled:=False;
deletar.Enabled:=False;

//Abaixo os Botões e Edits do Topo
ComboBox1.Enabled:=False;
combo_mes.Enabled:=False;
filtrar.Enabled:=False;
edit_ano.Enabled:=False;

fechar.Enabled:=False;
Enabled:=False;

DBGrid1.Enabled:=False;
DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];

ADOQuery1.First;
Timer1.Enabled:=True;

Panel1.Visible:=False;
end;

end;

procedure TForm16.Timer1Timer(Sender: TObject);
begin
    ADOQuery1.Delete;

    if ADOQuery1.Eof = False then
    ADOQuery1.Next
    else
    begin
    Timer1.Enabled:=False;

    //Abaixo os Botões e Edits do Topo
    ComboBox1.Enabled:=True;
    combo_mes.Enabled:=True;
    filtrar.Enabled:=True;
    edit_ano.Enabled:=True;

    //Abaixo os Botões
    atualizar.Enabled:=True;
    excluir.Enabled:=False;
    deletar.Enabled:=False;

    //Abaixo os Edits
    dbsolicitante.Enabled:=True;
    dblocal.Enabled:=True;
    dbsetor.Enabled:=True;
    dbservico.Enabled:=True;
    dbdocumento.Enabled:=True;
    dbnumero.Enabled:=True;
    dbcit.Enabled:=True;
    dbmemo.Enabled:=True;

    fechar.Enabled:=True;
    DBGrid1.Enabled:=True;
    Panel1.Visible:=True;
    Enabled:=True;

    MessageDlg(#13+'Registros do mês de '+combo_mes.Text+' de '+edit_ano.Text+' excluídos com sucesso!', mtinformation, [mbOk], 0);
    end;

     if ADOQuery1.RecordCount = 0 then
     begin
     Label2.Caption:='Nenhum Registro';
     DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
     ADOQuery1.Active:=False;
     end;
end;

procedure TForm16.filtrarClick(Sender: TObject);
begin
if combo_mes.Text = '' then
begin
MessageDlg(#13+'Preencha corretamente o mês a ser pesquisado!', mtwarning, [mbOk], 0);
combo_mes.SetFocus;
end

else if Trim(edit_ano.Text) = '' then
begin
MessageDlg(#13+'Preencha corretamente o ano a ser pesquisado!', mtwarning, [mbOk], 0);
edit_ano.SetFocus;
end

else if Length(edit_ano.Text) <> 4 then
begin
MessageDlg(#13+'O ano deve estar no formato de 4 dígitos!', mtwarning, [mbOk], 0);
edit_ano.SetFocus;
end
 else
 begin
    ADOQuery1.close;
    ADOQuery1.sql.clear;

      if ComboBox1.ItemIndex = 0 then
      ADOQuery1.sql.Add('Select * from tarantella where mes = "'+combo_mes.Text+'" and ano = "'+edit_ano.Text+'" order by data,hora desc')
      else
      ADOQuery1.sql.Add('Select * from tarantella where mes = "'+combo_mes.Text+'" and ano = "'+edit_ano.Text+'" and cadastrante = "'+ComboBox1.Text+'" order by data,hora desc');

    ADOQuery1.open;

     if ADOQuery1.RecordCount > 1 then  //Pra contar a quantidade de Registros
     Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registros'
     else
     Label2.Caption:=IntToStr(ADOQuery1.RecordCount)+' Registro';

  if ADOQuery1.RecordCount = 0 then   //Caso não apareça nenhum registro
  begin
  deletar.Enabled:=False;
  filtrar.Enabled:=True;
  excluir.Enabled:=False;
  DBGrid1.Options:=[dgColumnResize,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
  Label2.Caption:='Nenhum Registro';

  if ComboBox1.ItemIndex = 0 then
  MessageDlg(#13+'Não existem registros do mês de '+combo_mes.Text+' de '+edit_ano.Text+' no Sistema!', mtwarning, [mbOk], 0)
  else
  MessageDlg(#13+'Não existem registros do mês de '+combo_mes.Text+' de '+edit_ano.Text+' cadastrados por '+ComboBox1.Text+' no Sistema!', mtwarning, [mbOk], 0);

  combo_mes.SetFocus;
  end
    else
    begin
    deletar.Enabled:=True;
    filtrar.Enabled:=True;
    excluir.Enabled:=True;
    DBGrid1.Options:=[dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
    end;
 end;

end;

procedure TForm16.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ADOQuery1.Active=True then
begin
ADOQuery1.Active:=false;
end;

Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da Memória
Form16.Release;
Form16 := Nil;
end;

procedure TForm16.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm16.ComboBox1Enter(Sender: TObject);
var
i,y:integer;
begin
Combobox1.Items.Clear;
Combobox1.Items.Add('TODOS');
Combobox1.ItemIndex:=0;
ADOQuery2.Open;
y:=ADOQuery2.RecordCount;
i:=0;
while i < y do
begin
i:=i+1;
Combobox1.Items.Add(UpperCase(ADOQuery2.Fieldbyname('login').Value));
ADOQuery2.Next;
end;
ADOQuery2.Close;
end;

end.
