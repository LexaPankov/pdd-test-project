unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient, Data.SqlExpr;

type
  TFMainMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Button6: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button7: TButton;
    Memo1: TMemo;
    ADOConnection1: TADOConnection;
    SQLConnection1: TSQLConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainMenu: TFMainMenu;
  number_bil:integer;
  rejim,kol_bilets:Integer;
  flag_ex:boolean;


implementation

uses UTrainer;

{$R *.dfm}

procedure TFMainMenu.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Хотите выйти из программы ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    Application.Terminate;
end;

procedure TFMainMenu.Button2Click(Sender: TObject);
begin
  ComboBox1.Clear;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets';
    Open;
    First;
    WHile not(eof) do
    begin
      ComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
  GroupBox1.Visible:=True;
end;

procedure TFMainMenu.Button3Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT COUNT(*) FROM bilets';
    Open;
    if(Fields[0].AsString <> '')then
    begin
      kol_bilets:=Fields[0].AsInteger;
      rejim:=2;
      flag_ex:=True;
      FTrainer := TFTrainer.Create(Self);
      FTrainer.Show();
      FMainMenu.Hide;
    end;
  end;
end;

procedure TFMainMenu.Button4Click(Sender: TObject);
begin
  Panel1.Visible := True;
end;

procedure TFMainMenu.Button5Click(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

procedure TFMainMenu.Button6Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;

procedure TFMainMenu.Button7Click(Sender: TObject);
begin
  if(ComboBox1.ItemIndex <> -1)then
  begin
    number_bil:=StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
    FMainMenu.Hide;
    FTrainer:=TFTrainer.Create(Self);
    rejim:=Ord(Education);
    flag_ex:=False;
    FTrainer.Show();
  end else
    ShowMessage('Вы не выбрали билет!');
end;

procedure TFMainMenu.FormCreate(Sender: TObject);
begin
  var PASSWORD_TO_DB := EmptyStr;

  try
    ADOConnection1.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;'+
        'User ID=Admin;'+
        'Data Source='+Config.PathDataBase+';'+
        'Mode=Share Deny None;'+
        'Extended Properties="";'+
        'Jet OLEDB:System database="";'+
        'Jet OLEDB:Registry Path="";'+
        'Jet OLEDB:Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Engine Type=5;'+
        'Jet OLEDB:Database Locking Mode=1;'+
        'Jet OLEDB:Global Partial Bulk Ops=2;'+
        'Jet OLEDB:Global Bulk Transactions=1;'+
        'Jet OLEDB:New Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Create System Database=False;'+
        'Jet OLEDB:Encrypt Database=False;'+
        'Jet OLEDB:Don'+'''t Copy Locale on Compact=False;'+
        'Jet OLEDB:Compact Without Replica Repair=False;'+
        'Jet OLEDB:SFP=False';

    ADOConnection1.Connected := true;
  except on E : Exception do
    begin
      ShowMessage(Format('Ошибка при подключении к БД. %s', [E.Message]));
      Application.Terminate;
    end;
  end;
end;

end.
