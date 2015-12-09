program NaturalOrderTest;

uses
  EMemLeaks,
  Vcl.Forms,
  Form.NaturalOrderTest in 'Form.NaturalOrderTest.pas' {FormNaturalOrderTest},
  Sort.StringList in '..\..\lib\Sort.StringList.pas',
  Sort.ListView in '..\..\lib\Sort.ListView.pas',
  Sort.StringCompare in '..\..\lib\Sort.StringCompare.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Natural Order Test v0.1';
  Application.CreateForm(TFormNaturalOrderTest, FormNaturalOrderTest);
  Application.Run;
end.
