object FormNaturalOrderTest: TFormNaturalOrderTest
  Left = 0
  Top = 0
  Caption = 'FormNaturalOrderTest'
  ClientHeight = 337
  ClientWidth = 635
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
    Width = 635
    Height = 280
    ActivePage = TabSheetListView
    Align = alClient
    TabOrder = 0
    object TabSheetData: TTabSheet
      Caption = 'Data'
      object MemoData: TMemo
        Left = 0
        Top = 0
        Width = 627
        Height = 252
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheetStringList: TTabSheet
      Caption = 'StringList'
      ImageIndex = 1
      object MemoStringList: TMemo
        Left = 0
        Top = 0
        Width = 627
        Height = 252
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheetListView: TTabSheet
      Caption = 'ListView'
      ImageIndex = 2
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 627
        Height = 252
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
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 280
    Width = 635
    Height = 57
    Align = alBottom
    TabOrder = 1
    object ButtonInitialize: TButton
      Left = 376
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Initialize'
      TabOrder = 0
      OnClick = ButtonInitializeClick
    end
    object ButtonSort: TButton
      Left = 457
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Sort'
      TabOrder = 1
      OnClick = ButtonSortClick
    end
    object ButtonCaseSort: TButton
      Left = 538
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Case Sort'
      TabOrder = 2
      OnClick = ButtonCaseSortClick
    end
  end
end
