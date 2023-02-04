unit UResults;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, System.ImageList, Vcl.ImgList;
type
  TFResults = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Image1: TImage;
    ImageList1: TImageList;
    Memo2: TMemo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FResults: TFResults;
  im_valid:array[1..20]of TImage;
  kol_error:integer;
  zanovo:boolean;
implementation
uses UTrainer, UMainMenu;
{$R *.dfm}
procedure TFResults.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Желаете выйти в главное меню ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
  begin
    FResults.close;
    FMainMenu.Show;
    FMainMenu.GroupBox1.Visible:=False;
  end;
end;
procedure TFResults.Button2Click(Sender: TObject);
begin
  if(flag_ex)then
    rejim:=Ord(Exam);
  if(rejim = Ord(Exam))then
  begin
    if(application.MessageBox(PChar('Хотите пройти заново экзамен ?'),'Внимание!.',mb_YesNo or mb_iconquestion)=mrYes)then
    begin
      FTrainer := TFTrainer.Create(nil);
      rejim:=Ord(Exam);
      FTrainer.Show();
      FResults.Close;
      zanovo:=true;
    end;
  end else
  begin
    if(application.MessageBox(PChar('Хотите пройти заново билет№'+IntToStr(number_bil)+' ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    begin
      FTrainer := TFTrainer.Create(nil);
      rejim:=Ord(Education);
      FTrainer.Show();
      FResults.Close;
    end;
  end;
end;
procedure TFResults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= cafree;
  FResults:=nil;
end;
procedure TFResults.FormShow(Sender: TObject);
var
  i:Integer;
  min_,sec_:String;
begin
  kol_error:=0;
  for i:=1 to 20 do
    Listbox1.Items.Add('Вопрос№'+IntToStr(i));
  i:=0;
  for i:=1 to 20 do
  begin
    im_valid[i]:=Timage.Create(FResults);
    im_valid[i].Parent:=FResults;
    im_valid[i].Visible:=True;
    im_valid[i].Height:=19;
    im_valid[i].Width:=19;
    im_valid[i].Top:=30+(i*22);
    im_valid[i].Left:=201;
    im_valid[i].Picture.Bitmap := nil;
    if(res_[i] = 1)then
      ImageList1.GetBitmap(0, im_valid[i].Picture.Bitmap);
    if(res_[i] = 0)then
    begin
      ImageList1.GetBitmap(1, im_valid[i].Picture.Bitmap);
      inc(kol_error);
    end;
    im_valid[i].Center:=True;
    im_valid[i].Stretch:=True;
    im_valid[i].Refresh;
  end;
  if(rejim = Ord(Exam))or(flag_ex)then
  begin
    if(kol_error > 2)then
    begin
      Memo1.Visible := true;
      Memo2.Visible := false;
    end;
    if(kol_error <= 2)then
    begin
      Memo1.Visible := false;
      Memo2.Visible := true;
    end;
  end;
    if (rejim = Ord(Education)) then
    begin
      if (StrToInt(secc)<10) then
        secc:='0'+secc;
      if (min<10) then
        minn:='0'+minn;
    //StaticText2.Caption := '    '+ minn + ':'+  secc;
    end;
end;
procedure TFResults.ListBox1DblClick(Sender: TObject);
begin
  if(ListBox1.ItemIndex <> -1)then
  begin
    FResults.Close;
    FTrainer := TFTrainer.Create(nil);
    rejim:=Ord(Result);
    FTrainer.Show();
    index_vopr:=Listbox1.ItemIndex+1;
    FTrainer.load_tets();
    FTrainer.Timer1.Enabled:=false;
  end;
end;
end.
