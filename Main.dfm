object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Zoo'
  ClientHeight = 576
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 561
    Height = 561
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
  end
  object BitBtn1: TBitBtn
    Left = 591
    Top = 541
    Width = 75
    Height = 25
    Caption = 'Erase'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 690
    Top = 541
    Width = 75
    Height = 25
    Caption = #1051#1091#1075
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 792
    Top = 541
    Width = 75
    Height = 25
    Caption = #1044#1083#1103' '#1080#1075#1088#1099
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 883
    Top = 542
    Width = 75
    Height = 25
    Caption = #1044#1083#1103' '#1089#1085#1072
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object GroupBox1: TGroupBox
    Left = 575
    Top = 8
    Width = 389
    Height = 176
    Caption = #1058#1088#1072#1074#1086#1103#1076#1085#1099#1077
    TabOrder = 4
    object SpeedButton1: TSpeedButton
      Left = 357
      Top = 15
      Width = 25
      Height = 25
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = SpeedButton1Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 15
      Width = 344
      Height = 153
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 575
    Top = 184
    Width = 389
    Height = 176
    Caption = #1042#1089#1077#1103#1076#1085#1099#1077
    TabOrder = 5
    object SpeedButton2: TSpeedButton
      Left = 357
      Top = 15
      Width = 25
      Height = 25
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = SpeedButton2Click
    end
    object ListBox2: TListBox
      Left = 8
      Top = 14
      Width = 347
      Height = 153
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 574
    Top = 359
    Width = 389
    Height = 176
    Caption = #1061#1080#1097#1085#1080#1082#1080
    TabOrder = 6
    object SpeedButton3: TSpeedButton
      Left = 357
      Top = 15
      Width = 25
      Height = 25
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
        0000CC660000CC660000CC66000099330000FF00FF00FF00FF00FF00FF00FF00
        FF009933000099330000993300009933000099330000CC660000CC6600009933
        000099330000993300009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000CC660000CC6600009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009933000099330000993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = SpeedButton3Click
    end
    object ListBox3: TListBox
      Left = 8
      Top = 13
      Width = 346
      Height = 153
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
