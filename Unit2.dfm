object FControls: TFControls
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 219
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 81
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1085#1086#1075#1086' '#1073#1083#1086#1082#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 30
      Width = 69
      Height = 19
      Caption = 'COM-'#1087#1086#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 112
      Top = 30
      Width = 113
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
  object Button1: TButton
    Left = 174
    Top = 159
    Width = 75
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 159
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 2
    OnClick = Button2Click
  end
end
