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
    TabSheetListView: TTabSheet;
    MemoData: TMemo;
    MemoStringList: TMemo;
    ButtonSort: TButton;
    RadioGroupSortType: TRadioGroup;
    ListView1: TListView;
    TabSheetListViewGroup: TTabSheet;
    ListView2: TListView;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInitializeClick(Sender: TObject);
    procedure ButtonSortClick(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    { Private declarations }
    FColumnToSort: Integer;
    FIsDesc: Boolean;

    procedure InitData;
    procedure DoTestStringList;
    procedure DoTestListView;
    procedure DoTestListViewGroup;
  public
    { Public declarations }
  end;

var
  FormStringSortTest: TFormStringSortTest;

implementation

uses
  CommCtrl, Sort.StringCompare;

{$R *.dfm}

procedure TFormStringSortTest.ButtonInitializeClick(Sender: TObject);
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
    3:
    begin
      ListView2.Clear;
      ListView2.Items.BeginUpdate;
      for I := 0 to MemoData.Lines.Count - 1 do
      begin
        ListGroup := ListView2.Groups.Add;
        ListGroup.Header := MemoData.Lines.Strings[I];
        ListGroup.Footer := '';

        ListItem := ListView2.Items.Add;
        ListItem.Caption := MemoData.Lines.Strings[I];
        ListItem.GroupID := ListGroup.ID;
      end;
      ListView2.Items.EndUpdate;
    end;
  end;
end;

procedure TFormStringSortTest.ButtonSortClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    0:
    begin
    end;
    1: DoTestStringList;
    2: DoTestListView;
    3: DoTestListViewGroup;
  end;
end;

procedure TFormStringSortTest.DoTestListView;
begin
  FColumnToSort := 0;
  ListView1.AlphaSort;
  FIsDesc := not FIsDesc;
end;

function ListView_GroupSort(Group1_ID: Integer; Group2_ID: Integer; pvData: Pointer): Integer; stdcall;
var
  GroupSortData: PGroupSortData;
  Str1, Str2: string;
  CompareResult: Integer;
begin
  Result := 0;
  GroupSortData := PGroupSortData(pvData);

  Str1 := GroupSortData.ListView.Groups.Items[Group1_ID].Header;
  Str2 := GroupSortData.ListView.Groups.Items[Group2_ID].Header;

  case FormStringSortTest.RadioGroupSortType.ItemIndex of
    0: Result := NaturalOrderCompareString( Str1, Str2, True );
    1: Result := CompareStr( Str1, Str2 );
    2:
    begin
      CompareResult := CompareString( LOCALE_USER_DEFAULT, 0, PWideChar(Str1), Length(Str1), PWideChar(Str2), Length(Str2) );

      case CompareResult of
        CSTR_LESS_THAN:     Result := -1;
        CSTR_GREATER_THAN:  Result := 1;
        CSTR_EQUAL:         Result := 0;
      end;
    end;
    3: Result := StrCmpLogicalW( PWideChar(Str1), PWideChar(Str2) );
  end;

  if GroupSortData.Ascend then
    Result := -Result;
end;

procedure TFormStringSortTest.DoTestListViewGroup;
var
  GroupSortData: TGroupSortData;
begin
  GroupSortData.ListView := ListView2;
  GroupSortData.Ascend := FIsDesc;

  ListView_SortGroups( ListView2.Handle, ListView_GroupSort, @GroupSortData );

  FIsDesc := not FIsDesc;
end;

procedure TFormStringSortTest.DoTestStringList;
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    StringList.Assign( MemoData.Lines );

    if FIsDesc then
    begin
      case RadioGroupSortType.ItemIndex of
        0: StringList.CustomSort( TStringListSortCompareDesc.DoNatural );
        1: StringList.CustomSort( TStringListSortCompareDesc.DoCompareStr );
        2: StringList.CustomSort( TStringListSortCompareDesc.DoWinAPI );
        3: StringList.CustomSort( TStringListSortCompareDesc.DoStrCmpLogicalW );
      end;
    end
    else
    begin
      case RadioGroupSortType.ItemIndex of
        0: StringList.CustomSort( TStringListSortCompare.DoNatural );
        1: StringList.CustomSort( TStringListSortCompare.DoCompareStr );
        2: StringList.CustomSort( TStringListSortCompare.DoWinAPI );
        3: StringList.CustomSort( TStringListSortCompare.DoStrCmpLogicalW );
      end;
    end;

    FIsDesc := not FIsDesc;

    MemoStringList.Lines.Assign( StringList );
  finally
    StringList.Free;
  end;
end;

procedure TFormStringSortTest.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
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

procedure TFormStringSortTest.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  FColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
  FIsDesc := not FIsDesc;
end;

procedure TFormStringSortTest.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  S1, S2: string;
  CompareResult: Integer;
  Index: Integer;
begin
  if FColumnToSort = 0 then
  begin
    S1 := Item1.Caption;
    S2 := Item2.Caption;
  end
  else
  begin
    Index := FColumnToSort - 1;

    S1 := Item1.SubItems.Strings[Index];
    S2 := Item2.SubItems.Strings[Index];
  end;

  case RadioGroupSortType.ItemIndex of
    0: Compare := NaturalOrderCompareString( S1, S2, True );
    1: Compare := CompareStr( S1, S2 );
    2:
    begin
      CompareResult := CompareString( LOCALE_USER_DEFAULT, 0, PWideChar(S1), Length(S1), PWideChar(S2), Length(S2) );

      case CompareResult of
        CSTR_LESS_THAN:     Compare := -1;
        CSTR_GREATER_THAN:  Compare := 1;
        CSTR_EQUAL:         Compare := 0;
      end;
    end;
    3: Compare := StrCmpLogicalW( PWideChar(S1), PWideChar(S2) );
  end;

  if FIsDesc then
    Compare := -Compare;
end;

end.
