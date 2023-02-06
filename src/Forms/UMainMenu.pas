unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient, Data.SqlExpr, System.Hash, UStatistics;

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
    GroupBox2: TGroupBox;
    Button8: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function InsertNewUser(firstName:string;lastName:string;email:string;pass:string):boolean;
    function InsertUserResults(user_id: Integer; ticketNum: Integer; stats:TStatistics):boolean;
    function ShowResults(user_id:integer):TDataSet;
    procedure Button8Click(Sender: TObject);
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

procedure TFMainMenu.Button8Click(Sender: TObject);
begin
GroupBox2.Visible:=False;
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

function TFMainMenu.InsertNewUser(firstName:string;lastName:string;email:string;pass:string):boolean;
begin
  if ((firstName<>'') and (lastName<>'') and (email<>'') and (pass<>''))  then
  begin
    with FMainMenu.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT * FROM users WHERE email=:p1';
      Parameters.ParamByName('p1').Value := email;
      Open;
      if eof then
        begin
          Close;
          SQL.Clear;
          try
          SQL.Add('INSERT INTO users (first_name,second_name,email,passw,bday_date)');
          SQL.Add('VALUES (:p1,:p2,:p3,:p4,:p5);');
          Parameters.ParamByName('p1').Value := firstName;
          Parameters.ParamByName('p2').Value :=lastName;
          Parameters.ParamByName('p3').Value := email;
          Parameters.ParamByName('p4').Value :=System.Hash.THashMD5.GetHashString(pass);
          ExecSQL;
          Close;
          Result:=TRUE;
          except
          ShowMessage('Что-то пошло не так');
          Result:=FALSE;
          end;
        end
        else
        ShowMessage('Пользователь с таким e-mail уже существует');
    end;
  end
  else
  ShowMessage('Введены не все данные');
end;

function TFMainMenu.InsertUserResults(user_id: Integer; ticketNum: Integer; stats:TStatistics): Boolean;
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Add('INSERT INTO results (id_users,SpentTimeInSeconds,ticketNum,TotalInvalidAnswers,TotalTrueAnswers,rejim,Timespan)');
    SQL.Add('VALUES (:p1,:p2,:p3,:p4,:p5,:p6,Date())');
    Parameters.ParamByName('p1').Value := user_id;
    Parameters.ParamByName('p2').Value :=IntToStr(stats.TotalTimeInSeconds);
    Parameters.ParamByName('p3').Value := ticketNum;
    Parameters.ParamByName('p4').Value :=IntToStr(stats.TotalInvalidAnswers);
    Parameters.ParamByName('p5').Value := IntToStr(stats.TotalTrueAnswers);
    Parameters.ParamByName('p6').Value := stats.rejim;
    ExecSQL;
    Close;
    Result:=True;
    except
    begin
      ShowMessage('Что-то пошло не так');
      Result:=False;
    end;
    end;
  end;
end;

function TFMainMenu.ShowResults(user_id:integer):TDataSet;
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Text:='SELECT SpentTimeInSeconds,ticketNum,TotalInvalidAnswers,TotalTrueAnswers,rejim,Timespan FROM results WHERE id_users=:i';
    Parameters.ParamByName('i').Value:=user_id;
    Open;
    Result:=ADOQuery1;
    except
     ShowMessage('Что-то пошло не так');
    end;
  end;
end;

end.
