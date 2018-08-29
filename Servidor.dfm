object server: Tserver
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor Balan'#231'a'
  ClientHeight = 247
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 113
    Caption = 'Servidor DataSnap'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 55
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object ButtonOpenBrowser: TButton
      Left = 164
      Top = 74
      Width = 107
      Height = 23
      Caption = 'Iniciar Navegador'
      TabOrder = 0
      OnClick = ButtonOpenBrowserClick
    end
    object ButtonStart: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
      OnClick = ButtonStartClick
    end
    object ButtonStop: TButton
      Left = 97
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Parar'
      TabOrder = 2
      OnClick = ButtonStopClick
    end
    object EditPort: TEdit
      Left = 16
      Top = 74
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '8080'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 121
    Width = 289
    Height = 120
    Caption = 'Balan'#231'a'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 28
      Width = 23
      Height = 13
      Caption = 'Peso'
    end
    object txpeso: TEdit
      Left = 138
      Top = 24
      Width = 2
      Height = 21
      TabOrder = 0
      Text = '500'
      Visible = False
    end
    object Button1: TButton
      Left = 16
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 107
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Parar'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 196
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = Button3Click
    end
    object peso: TEdit
      Left = 45
      Top = 24
      Width = 92
      Height = 21
      TabOrder = 4
      Text = '0'
      OnChange = pesoChange
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 352
    Top = 8
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = COM1
    Parity.Bits = prNone
    Parity.Check = False
    Parity.Replace = False
    Parity.ReplaceChar = 0
    StopBits = sbOneStopBit
    DataBits = dbEight
    DiscardNull = False
    EventChar = 0
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    Buffer.InputSize = 1024
    Buffer.OutputSize = 1024
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    FlowControl.DSRSensitivity = False
    FlowControl.TxContinueOnXoff = False
    FlowControl.XonChar = 17
    FlowControl.XoffChar = 19
    Timeouts.ReadInterval = -1
    Timeouts.ReadTotalMultiplier = 0
    Timeouts.ReadTotalConstant = 0
    Timeouts.WriteTotalMultiplier = 100
    Timeouts.WriteTotalConstant = 1000
    SyncMethod = smThreadSync
    OnRxChar = ComPort1RxChar
    Left = 344
    Top = 64
  end
end
