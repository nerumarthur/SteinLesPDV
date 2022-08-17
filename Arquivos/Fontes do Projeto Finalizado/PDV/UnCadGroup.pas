unit UnCadGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TFrmCadGroup = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGroup: TFrmCadGroup;

implementation

{$R *.dfm}


end.
