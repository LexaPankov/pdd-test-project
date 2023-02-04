program PDD_Trainer;

uses
  Forms,
  UConfigBase in 'UConfigBase.pas',
  UConfigClient in 'UConfigClient.pas',
  UMainMenu in 'Forms\UMainMenu.pas' {FMainMenu},
  UResults in 'Forms\UResults.pas' {FResults},
  UTrainer in 'Forms\UTrainer.pas' {FTrainer},
  UDBModule in 'UDBModule.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ПДД Тренажёр';

  Config := TAccessToFiles.Create();

  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFResults, FResults);
  Application.CreateForm(TFTrainer, FTrainer);
  Application.Run;
end.
