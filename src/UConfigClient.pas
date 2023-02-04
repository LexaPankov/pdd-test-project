unit UConfigClient;

interface

uses System.SysUtils, System.Classes, Generics.Collections, UConfigBase;//

type
  TAccessToFiles=class(TConfigBase)
    private
      procedure InitPaths(); override;
    public
      property PathDataBase: string Index 0 read GetFullPath;
      property PathTickets: string Index 1 read GetFullPath;
end;

var
  Config: TAccessToFiles;

implementation

procedure TAccessToFiles.InitPaths();
{$IfDeF RELEASE}
CONST PathToDataBase = 'data\pdd_db.mdb';
      PathToTickets = 'data\tickets\';
{$EndIf}
{$IfDeF DEBUG}
CONST PathToDataBase = '..\..\..\data\pdd_db.mdb';
      PathToTickets = '..\..\..\data\tickets\';
{$EndIf}
begin
  Paths := TList<string>.Create;
  Paths.Add(GetPath(PathToDataBase));
  Paths.Add(GetPath(PathToTickets));;
end;

end.

