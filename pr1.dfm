object winMain: TwinMain
  Left = 0
  Top = 0
  Caption = 'AnalyzeCPM'
  ClientHeight = 584
  ClientWidth = 1274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 565
    Width = 1274
    Height = 19
    Panels = <>
    ExplicitTop = 564
    ExplicitWidth = 1270
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 8
    Width = 793
    Height = 513
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1050#1086#1084#1072#1085#1076#1099' '#1057#1056#1052
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 85
        Height = 15
        Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1084#1072#1085#1076
      end
      object ListBox1: TListBox
        Left = 16
        Top = 48
        Width = 313
        Height = 97
        ItemHeight = 15
        Items.Strings = (
          '3. '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074'/'#1074' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084#1080':'
          '3.1 '#1047#1072#1087#1080#1089#1100' U '#1074'/'#1074' '#1074' '#1082#1072#1078#1076#1086#1084' '#1080#1089#1090#1086#1095#1085#1080#1082#1077
          '3.2 '#1042#1099#1074#1086#1076' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' U '#1074'/'#1074' '#1074' '#1082#1072#1078#1076#1086#1084' '#1080#1089#1090#1086#1095#1085#1080#1082#1077
          '3.3 '#1042#1099#1074#1086#1076' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' T '#1101#1082#1089#1087', '#1043#1058'-'#1042#1050', '#1043#1058'-'#1057#1063', '#1057#1073#1088#1086#1089#1077
          '3.4 '#1042#1082#1083#1102#1095#1077#1085#1080#1077' '#1085#1091#1078#1085#1099#1093' '#1080#1089#1090#1086#1095#1085#1080#1082#1086#1074)
        TabOrder = 0
        OnClick = ListBox1Click
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 528
    object config: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    end
  end
end
