unit Form.NaturalOrderTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormNaturalOrderTest = class(TForm)
    PageControlMain: TPageControl;
    TabSheetData: TTabSheet;
    MemoData: TMemo;
    TabSheetStringList: TTabSheet;
    MemoStringList: TMemo;
    TabSheetListView: TTabSheet;
    ListView1: TListView;
    PanelBottom: TPanel;
    ButtonInitialize: TButton;
    ButtonSort: TButton;
    ButtonCaseSort: TButton;
    procedure ButtonInitializeClick(Sender: TObject);
    procedure ButtonSortClick(Sender: TObject);
    procedure ButtonCaseSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
    FAsc: Boolean;

    procedure InitData;
    procedure DoTestStringList( ACaseSensitive: Boolean );
    procedure DoTestListView( ACaseSensitive: Boolean );
  public
    { Public declarations }
  end;

var
  FormNaturalOrderTest: TFormNaturalOrderTest;

implementation

uses
  Sort.StringList, Sort.ListView;

{$R *.dfm}

procedure TFormNaturalOrderTest.ButtonCaseSortClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    1: DoTestStringList(True);
    2: DoTestListView(True);
  end;
end;

procedure TFormNaturalOrderTest.ButtonInitializeClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
  ListGroup: TListGroup;
begin
  case PageControlMain.ActivePageIndex of
    0: InitData;
    1: MemoStringList.Clear;
    2:
    begin
      ListView1.Clear;
      for I := 0 to MemoData.Lines.Count - 1 do
      begin
        ListItem := ListView1.Items.Add;
        ListItem.Caption := MemoData.Lines.Strings[I];
        ListItem.SubItems.Add( MemoData.Lines.Strings[I] );
        ListItem.SubItems.Add( MemoData.Lines.Strings[I] );
      end;
    end;
  end;
end;

procedure TFormNaturalOrderTest.ButtonSortClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    1: DoTestStringList(False);
    2: DoTestListView(False);
  end;
end;

procedure TFormNaturalOrderTest.DoTestListView( ACaseSensitive: Boolean );
begin
  TListViewSort.SortByColumn( ListView1, 0, ACaseSensitive, FAsc );
  FAsc := not FAsc;
end;

procedure TFormNaturalOrderTest.DoTestStringList( ACaseSensitive: Boolean );
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Assign( MemoData.Lines );

    TStringListSort.Sort( StringList, ACaseSensitive, FAsc );
    FAsc := not FAsc;

    MemoStringList.Lines.Assign( StringList );
  finally
    StringList.Free;
  end;
end;

procedure TFormNaturalOrderTest.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;

  FAsc := True;
  PageControlMain.ActivePageIndex := 0;

  InitData;
end;

procedure TFormNaturalOrderTest.InitData;
begin
  MemoData.Clear;
  MemoData.Lines.Add( '20 - Twenty' );
  MemoData.Lines.Add( '1 - One' );
  MemoData.Lines.Add( '10 - Ten (1)' );
  MemoData.Lines.Add( '2 - Two' );
  MemoData.Lines.Add( '20 - twenty' );
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
  MemoData.Lines.Add( 'Pic02a' );
  MemoData.Lines.Add( 'pic3' );
  MemoData.Lines.Add( 'pic4' );
  MemoData.Lines.Add( 'pic 4 else' );
  MemoData.Lines.Add( 'pic 5' );
  MemoData.Lines.Add( 'pic05' );
  MemoData.Lines.Add( 'pic 5",' );
  MemoData.Lines.Add( 'pic 5 something' );
  MemoData.Lines.Add( 'Pic 6' );
  MemoData.Lines.Add( 'Pic   7' );
  MemoData.Lines.Add( 'pic100' );
  MemoData.Lines.Add( 'pic100a' );
  MemoData.Lines.Add( 'Pic120' );
  MemoData.Lines.Add( 'pic121",' );
  MemoData.Lines.Add( 'pic02000' );
  MemoData.Lines.Add( 'tom' );
  MemoData.Lines.Add( 'x2-g8' );
  MemoData.Lines.Add( 'x2-y7' );
  MemoData.Lines.Add( 'x2-y08' );
  MemoData.Lines.Add( 'x8-y8"' );
  MemoData.Lines.Add( 'a - 1' );
  MemoData.Lines.Add( 'A - 10' );
  MemoData.Lines.Add( 'a - 99' );
  MemoData.Lines.Add( 'A - 9' );
  MemoData.Lines.Add( 'A - 10000' );
end;

procedure TFormNaturalOrderTest.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListViewSort.SortByColumn( ListView1, Column.Index, True, FAsc );
  FAsc := not FAsc;
end;

end.
