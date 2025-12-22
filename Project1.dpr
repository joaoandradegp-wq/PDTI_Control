program Project1;

uses
  Forms,
  Windows,
  Unit1 in 'Unit1.pas' {Frmprincipal},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit7 in 'Unit7.pas' {Form7},
  Unit6 in 'Unit6.pas' {Form6},
  Unit10 in 'Unit10.pas' {Form10},
  Unit8 in 'Unit8.pas' {AboutBox},
  Unit9 in 'Unit9.pas' {Form9},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Login},
  Unit13 in 'Unit13.pas' {Form13},
  Unit14 in 'Unit14.pas' {Form14},
  Unit15 in 'Unit15.pas' {Form15},
  Unit16 in 'Unit16.pas' {Form16},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {Form19},
  Unit20 in 'Unit20.pas' {Form20},
  Unit21 in 'Unit21.pas' {Form21},
  Unit22 in 'Unit22.pas' {Form22};

var
Hand : THandle;

{$R *.RES}

begin
  Hand := FindWindow('TApplication', 'Phobos DTI Control 1.0');
  if Hand = 0 then
  begin
  Application.Initialize;
  Application.Title := 'Phobos DTI Control 1.0';
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
  end
  else
  ShowWindow(Hand,SW_NORMAL);
end.
