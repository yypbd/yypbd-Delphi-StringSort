object FormStringSortTest: TFormStringSortTest
  Left = 0
  Top = 0
  Caption = 'FormStringSortTest'
  ClientHeight = 409
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 647
    Height = 352
    ActivePage = TabSheetListViewGroup
    Align = alClient
    TabOrder = 0
    object TabSheetData: TTabSheet
      Caption = 'Data'
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitHeight = 340
      object MemoData: TMemo
        Left = 0
        Top = 0
        Width = 639
        Height = 324
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 340
      end
    end
    object TabSheetStringList: TTabSheet
      Caption = 'StringList'
      ImageIndex = 1
      ExplicitHeight = 340
      object MemoStringList: TMemo
        Left = 0
        Top = 0
        Width = 639
        Height = 324
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 285
      end
    end
    object TabSheetListView: TTabSheet
      Caption = 'ListView'
      ImageIndex = 2
      ExplicitHeight = 340
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 639
        Height = 324
        Align = alClient
        Columns = <
          item
            Caption = 'Caption'
            Width = 200
          end
          item
            Caption = 'SubItem_0'
            Width = 200
          end
          item
            Caption = 'SubItem_1'
            Width = 200
          end>
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = ListView1ColumnClick
        OnCompare = ListView1Compare
        ExplicitLeft = 196
        ExplicitTop = 88
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
    object TabSheetListViewGroup: TTabSheet
      Caption = 'ListViewGroup'
      ImageIndex = 3
      object ListView2: TListView
        Left = 0
        Top = 0
        Width = 639
        Height = 324
        Align = alClient
        Columns = <
          item
            Caption = 'Caption'
            Width = 200
          end
          item
            Caption = 'SubItem_0'
            Width = 200
          end
          item
            Caption = 'SubItem_1'
            Width = 200
          end>
        GroupView = True
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = ListView1ColumnClick
        OnCompare = ListView1Compare
        ExplicitLeft = 196
        ExplicitTop = 88
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 352
    Width = 647
    Height = 57
    Align = alBottom
    TabOrder = 1
    object ButtonInitialize: TButton
      Left = 436
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Initialize'
      TabOrder = 0
      OnClick = ButtonInitializeClick
    end
    object ButtonSort: TButton
      Left = 517
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Sort'
      TabOrder = 1
      OnClick = ButtonSortClick
    end
    object RadioGroupSortType: TRadioGroup
      Left = 4
      Top = 6
      Width = 377
      Height = 43
      Caption = 'SortType'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Natural'
        'CompareStr'
        'WinAPI'
        'StrLogical')
      TabOrder = 2
    end
  end
end
