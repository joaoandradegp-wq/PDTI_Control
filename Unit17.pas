unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Series, TeEngine, ExtCtrls, TeeProcs, Chart,
  DbChart, ComCtrls, DB, ADODB, ImgList, ComObj, jpeg;

type
  TForm17 = class(TForm)
    Bevel7: TBevel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    GroupBox2: TGroupBox;
    filtrar: TSpeedButton;
    Label6: TLabel;
    Label1: TLabel;
    combo_mes: TComboBox;
    edit_ano: TEdit;
    fechar: TSpeedButton;
    ADOQuery1: TADOQuery;
    ADOQuery1mes: TWideStringField;
    ADOQuery1ano: TWideStringField;
    ADOQuery1setor: TWideStringField;
    ADOQuery1qtde: TIntegerField;
    ImageList1: TImageList;
    ADOQuery1cadastrante: TWideStringField;
    combo_graf: TComboBox;
    Label2: TLabel;
    DBChart4: TDBChart;
    BarSeries2: TBarSeries;
    assunto_b: TSpeedButton;
    procedure fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure filtrarClick(Sender: TObject);
    procedure assunto_bClick(Sender: TObject);
    procedure edit_anoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses Unit1, Unit12;

{$R *.dfm}

procedure TForm17.fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Frmprincipal.Enabled:=True;

//Abaixo para Liberar o Form da MemÛria
Form17.Release;
Form17 := Nil;
end;

procedure TForm17.FormDestroy(Sender: TObject);
begin
frmprincipal.Enabled:=True;
end;

procedure TForm17.filtrarClick(Sender: TObject);
var
cont: integer;
begin
cont:=0;

if combo_graf.ItemIndex = -1 then
begin
MessageDlg(#13+'Preencha corretamente o tipo de gr·fico a ser gerado!', mtwarning, [mbOk], 0);
combo_graf.SetFocus;
end

else if combo_mes.Text = '' then
begin
MessageDlg(#13+'Preencha corretamente o mÍs a ser pesquisado!', mtwarning, [mbOk], 0);
combo_mes.SetFocus;
end

else if Trim(edit_ano.Text) = '' then
begin
MessageDlg(#13+'Preencha corretamente o ano a ser pesquisado!', mtwarning, [mbOk], 0);
edit_ano.SetFocus;
end

else if Length(edit_ano.Text) <> 4 then
begin
MessageDlg(#13+'O ano deve estar no formato de 4 dÌgitos!', mtwarning, [mbOk], 0);
edit_ano.SetFocus;
end
  else
  begin
  if PageControl2.ActivePage = TabSheet5 then
  begin
     if combo_graf.ItemIndex = 0 then
     begin
       DBChart4.Visible:=False;
       DBChart1.Visible:=True;
       Series1.Clear;
       ADOQuery1.close;
       ADOQuery1.sql.clear;
       ADOQuery1.sql.Add('Select COUNT(setor) as qtde,setor,cadastrante,mes,ano from tarantella where mes = "'+combo_mes.Text+'" and ano = "'+edit_ano.Text+'" group by setor,cadastrante,mes,ano order by setor');
       ADOQuery1.open;

       while not ADOQuery1.Eof do
       begin
       Series1.AddY(ADOQuery1qtde.Value, ADOQuery1setor.AsString);
       ADOQuery1.Next;
       end;

        if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
        begin
        cont:=1;
        assunto_b.Enabled:=False;
        MessageDlg(#13+'N„o existem registros do mÍs de '+combo_mes.Text+' de '+edit_ano.Text+' no Sistema!', mtwarning, [mbOk], 0);
        combo_mes.SetFocus;
        end;
        ADOQuery1.Close;

     end
      else
      begin
      DBChart1.Visible:=False;
      DBChart4.Visible:=True;
      BarSeries2.Clear;
      ADOQuery1.close;
      ADOQuery1.sql.clear;
      ADOQuery1.sql.Add('Select COUNT(cadastrante) as qtde,cadastrante,setor,mes,ano from tarantella where mes = "'+combo_mes.Text+'" and ano = "'+edit_ano.Text+'" group by cadastrante,setor,mes,ano order by cadastrante');
      ADOQuery1.open;


         while not ADOQuery1.Eof do
         begin
         BarSeries2.AddY(ADOQuery1qtde.Value, ADOQuery1setor.AsString);
         ADOQuery1.Next;
         end;

         if ADOQuery1.RecordCount = 0 then   //Caso n„o apareÁa nenhum registro
         begin
         cont:=1;
         assunto_b.Enabled:=False;
         MessageDlg(#13+'N„o existem registros do mÍs de '+combo_mes.Text+' de '+edit_ano.Text+' no Sistema!', mtwarning, [mbOk], 0);
         combo_mes.SetFocus;
         end;
     ADOQuery1.Close;
     end;
  end;
  if cont = 0 then
  assunto_b.Enabled:=True;
end;

end;

procedure TForm17.assunto_bClick(Sender: TObject);
var
MSWord: Variant;
begin

if combo_graf.ItemIndex = 1 then
DBChart4.SaveToBitmapFile('\\adc04\P.D\Phobos DTI Control\'+'G02'+ '.bmp')
else
DBChart1.SaveToBitmapFile('\\adc04\P.D\Phobos DTI Control\'+'G01'+ '.bmp');

//Abaixo j· mexe com o Word
MSWord:= CreateOleObject ('Word.Basic');
MSWord.FileNew;
MSWord.AppShow;
MSWord.appmaximize;

MSWord.leftPara;

MSWord.insertpicture('\\adc04\P.D\Phobos DTI Control\CAR.jpg');
MSWord.insert(#13);
MSWord.insert(#13);
MSWord.insert(#13);
MSWord.insert(#13);

MSWord.FontSize(16);
MSWord.CenterPara;
MSWord.insert('PHOBOS DTI CONTROL');
MSWord.insert(#13);

MSWord.FontSize(16);
MSWord.italic;
MSWord.bold;
MSWord.insert('ServiÁos T-Systems por Setor');
MSWord.insert(#13);MSWord.insert(#13);
MSWord.insert(#13);MSWord.insert(#13);

MSWord.CenterPara;

if combo_graf.ItemIndex = 1 then
MSWord.insertpicture('\\adc04\P.D\Phobos DTI Control\G02.bmp')
else
MSWord.insertpicture('\\adc04\P.D\Phobos DTI Control\G01.bmp');

MSWord.insert(#13);
MSWord.rightPara;
MSWord.insert(#13 +'--'+#13);
MSWord.insert('Gr·fico extraÌdo dia '+DateToStr(date)+' ‡s '+TimeToStr(time));

MSWord.insert(#13);MSWord.insert(#13);MSWord.insert(#13);
MSWord.insert(#13);MSWord.insert(#13);

MSWord.insertpicture('\\adc04\P.D\Phobos DTI Control\VDL.jpg');

MessageDlg(#13+'Gr·fico quantitativo gerado com sucesso!', mtinformation, [mbOk], 0);

if combo_graf.ItemIndex = 1 then
Windows.DeleteFile('\\adc04\P.D\Phobos DTI Control\G02.bmp')
else
Windows.DeleteFile('\\adc04\P.D\Phobos DTI Control\G01.bmp');
end;

procedure TForm17.edit_anoKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '<>!@#$%®&*()_-+={}[]?;:,.|\/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
mai = 'ABCDEFGHIJKLMNOPQRSTUVXYZ';
min = 'abcdefghijklmnopqrstuvxyz';
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
edit_ano.SetFocus;
end;

end;

end.
