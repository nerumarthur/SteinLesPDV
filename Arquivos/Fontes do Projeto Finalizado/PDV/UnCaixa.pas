unit UnCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ButtonGroup;

type
  TFrmTelaVenda = class(TForm)
    Panel1: TPanel;
    pnlCaixa: TPanel;
    pnlConfig: TPanel;
    pnlComanda: TPanel;
    pnlMesa: TPanel;
    pnlVenda: TPanel;
    pnlOperacao: TPanel;
    scrBoxGroup: TScrollBox;
    ScrollBox2: TScrollBox;
    Image1: TImage;
    btCancelar: TPanel;
    btReceb: TPanel;
    pnlValorTotal: TPanel;
    edtValor: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    //procedure Image2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaVenda: TFrmTelaVenda;
  button1 : TButton;

implementation

{$R *.dfm}

//uses
  //UnCaixaTela;


procedure TFrmTelaVenda.FormCreate(Sender: TObject);
begin
  button1 := TButton.Create(self);
  button1.Parent:= scrBoxGroup;
  button1.Left:= 10 ;
  button1.Top:= 10;

end;

{procedure TForm1.Image2Click(Sender: TObject);
begin
     FrmCaixaTela := TFrmCaixaTela.Create(Application);

end;    }

end.
