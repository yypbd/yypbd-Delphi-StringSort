unit Form.StringSortTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormStringSortTest = class(TForm)
    PageControlMain: TPageControl;
    PanelBottom: TPanel;
    ButtonInitialize: TButton;
    TabSheetData: TTabSheet;
    TabSheetStringList: TTabSheet;
    TabSheet3: TTabSheet;
    MemoData: TMemo;
    MemoStringList: TMemo;
    ButtonSort: TButton;
    RadioGroupSortType: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInitializeClick(Sender: TObject);
    procedure ButtonSortClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitData;
    procedure DoTestStringList;
  public
    { Public declarations }
  end;

var
  FormStringSortTest: TFormStringSortTest;

implementation

uses
  Sort.StringCompare;

{$R *.dfm}

procedure TFormStringSortTest.ButtonInitializeClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    0: InitData;
    1: MemoStringList.Clear;
  end;
end;

procedure TFormStringSortTest.ButtonSortClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    0:
    begin

    end;
    1: DoTestStringList;
  end;
end;

procedure TFormStringSortTest.DoTestStringList;
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Assign( MemoData.Lines );

    case RadioGroupSortType.ItemIndex of
      0: StringList.CustomSort( TStringSortCompare.DoNatural );
      1: StringList.CustomSort( TStringSortCompare.DoCompareStr );
      2: StringList.CustomSort( TStringSortCompare.DoWinAPI );
      3: StringList.CustomSort( TStringSortCompare.DoStrCmpLogicalW );
    end;

    MemoStringList.Lines.Assign( StringList );
  finally
    StringList.Free;
  end;
end;

procedure TFormStringSortTest.FormCreate(Sender: TObject);
begin
  PageControlMain.ActivePageIndex := 0;
  InitData;
end;

procedure TFormStringSortTest.InitData;
begin
  MemoData.Clear;
  MemoData.Lines.Add( '20 - Twenty' );
  MemoData.Lines.Add( '1 - One' );
  MemoData.Lines.Add( '10 - Ten (1)' );
  MemoData.Lines.Add( '2 - Two' );
  MemoData.Lines.Add( '20 - Twenty' );
  MemoData.Lines.Add( '15 - Fifteen' );
  MemoData.Lines.Add( '1 - One (b)' );
  MemoData.Lines.Add( '10 - Ten (2)' );
  MemoData.Lines.Add( '3 - Three' );
  MemoData.Lines.Add( '10 - Ten (100)' );
  MemoData.Lines.Add( '1-2' );
  MemoData.Lines.Add( '1-02' );
  MemoData.Lines.Add( '1-20' );
  MemoData.Lines.Add( '10-20' );
  MemoData.Lines.Add( 'fred' );
  MemoData.Lines.Add( 'jane' );
  MemoData.Lines.Add( 'pic01",' );
  MemoData.Lines.Add( 'pic2' );
  MemoData.Lines.Add( 'pic02' );
  MemoData.Lines.Add( 'pic02a' );
  MemoData.Lines.Add( 'pic3' );
  MemoData.Lines.Add( 'pic4' );
  MemoData.Lines.Add( 'pic 4 else' );
  MemoData.Lines.Add( 'pic 5' );
  MemoData.Lines.Add( 'pic05' );
  MemoData.Lines.Add( 'pic 5",' );
  MemoData.Lines.Add( 'pic 5 something' );
  MemoData.Lines.Add( 'pic 6' );
  MemoData.Lines.Add( 'pic   7' );
  MemoData.Lines.Add( 'pic100' );
  MemoData.Lines.Add( 'pic100a' );
  MemoData.Lines.Add( 'pic120' );
  MemoData.Lines.Add( 'pic121",' );
  MemoData.Lines.Add( 'pic02000' );
  MemoData.Lines.Add( 'tom' );
  MemoData.Lines.Add( 'x2-g8' );
  MemoData.Lines.Add( 'x2-y7' );
  MemoData.Lines.Add( 'x2-y08' );
  MemoData.Lines.Add( 'x8-y8"' );
  MemoData.Lines.Add( 'a - 1' );
  MemoData.Lines.Add( 'a - 10' );
  MemoData.Lines.Add( 'a - 99' );
  MemoData.Lines.Add( 'a - 9' );
  MemoData.Lines.Add( 'a - 10000' );
end;

end.
