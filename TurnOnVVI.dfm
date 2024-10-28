object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1042#1042#1048
  ClientHeight = 79
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 11
    Width = 102
    Height = 15
    Caption = #1053#1086#1084#1077#1088' '#1080#1089#1090#1086#1095#1085#1080#1082#1072':'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 32
    Width = 102
    Height = 23
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
  end
  object Button1: TButton
    Left = 152
    Top = 31
    Width = 75
    Height = 25
    Caption = #1042#1082#1083#1102#1095#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 238
    Top = 31
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
end
