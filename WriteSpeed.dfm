object Form9: TForm9
  Left = 690
  Top = 383
  Caption = 'Form9'
  ClientHeight = 96
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 55
    Height = 15
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
  end
  object Button1: TButton
    Left = 117
    Top = 58
    Width = 75
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 28
    Top = 58
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 99
    Top = 21
    Width = 93
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    OnChange = ComboBox1Change
    Items.Strings = (
      '360'
      '180'
      '11,2'
      '2,8'
      '5,6'
      '0,7'
      '0,35'
      '0,18')
  end
end
