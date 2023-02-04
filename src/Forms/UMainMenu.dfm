object FMainMenu: TFMainMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
  ClientHeight = 493
  ClientWidth = 539
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 192
    Top = 340
    Width = 153
    Height = 47
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 88
    Width = 185
    Height = 49
    Caption = #1054#1073#1091#1095#1077#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 159
    Width = 185
    Height = 49
    Caption = #1069#1082#1079#1072#1084#1077#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 176
    Top = 232
    Width = 185
    Height = 49
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 31
    Top = 68
    Width = 473
    Height = 377
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object Button5: TButton
      Left = 152
      Top = 337
      Width = 185
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button5Click
    end
    object Memo1: TMemo
      Left = 8
      Top = 8
      Width = 457
      Height = 323
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        #1044#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1103' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '
        #1091#1089#1087#1077#1096#1085#1086' '#1089#1076#1072#1090#1100
        #1090#1077#1086#1088#1077#1090#1080#1095#1077#1089#1082#1080#1081' '#1080' '#1087#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1101#1082#1079#1072#1084#1077#1085#1099'.'
        ''
        #1069#1090#1086' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1087#1086#1084#1086#1078#1077#1090' '#1073#1099#1089#1090#1088#1086' '#1087#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100#1089#1103' '#1082' '
        #1090#1077#1086#1088#1077#1090#1080#1095#1077#1089#1082#1086#1084#1091' '#1101#1082#1079#1072#1084#1077#1085#1091'.'
        ''
        #1062#1077#1083#1100' - '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1080#1090#1100' '#1085#1072' 20 '#1074#1086#1087#1088#1086#1089#1086#1074' '#1086#1076#1085#1086#1075#1086' '#1073#1080#1083#1077#1090#1072','
        #1089#1083#1091#1095#1072#1081#1085#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1080#1079' 40, '#1085#1077' '#1073#1086#1083#1077#1077', '#1095#1077#1084' '#1079#1072' 20 '#1084#1080#1085#1091#1090'.'
        #1055#1088#1080' '#1101#1090#1086#1084' '#1084#1086#1078#1085#1086' '#1076#1086#1087#1091#1089#1090#1080#1090#1100' '#1085#1077' '#1073#1086#1083#1077#1077' '#1076#1074#1091#1093' '#1086#1096#1080#1073#1086#1082'.'
        ''
        #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1073#1080#1083#1077#1090#1086#1074' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090
        #1086#1092#1080#1094#1080#1072#1083#1100#1085#1099#1084' '#1073#1080#1083#1077#1090#1072#1084' '#1043#1048#1041#1044#1044' 2012 '#1075#1086#1076#1072'.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 39
    Top = 76
    Width = 432
    Height = 249
    Caption = #1041#1080#1083#1077#1090#1099
    Color = clGradientInactiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 25
      Top = 66
      Width = 229
      Height = 25
      Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1073#1080#1083#1077#1090' ('#8470')'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Georgia'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button6: TButton
      Left = 3
      Top = 210
      Width = 118
      Height = 36
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button6Click
    end
    object ComboBox1: TComboBox
      Left = 260
      Top = 66
      Width = 149
      Height = 30
      Style = csDropDownList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Button7: TButton
      Left = 260
      Top = 107
      Width = 149
      Height = 43
      Caption = #1053#1072#1095#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button7Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    Left = 176
    Top = 8
  end
end
