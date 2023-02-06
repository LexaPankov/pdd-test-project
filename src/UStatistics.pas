unit UStatistics;

interface

uses System.SysUtils, System.Classes, Generics.Collections, WinApi.Windows, System.IOUtils;

type
TStatistics = class (TObject)
  TotalTimeInSeconds:integer;
  TotalTrueAnswers:integer;
  TotalInvalidAnswers:integer;
  rejim:string;
  constructor Create;
end;

implementation

constructor TStatistics.Create;
begin
  TotalTimeInSeconds:=0;
  TotalTrueAnswers:=0;
  TotalInvalidAnswers:=0;
  rejim:='';
end;

end.
