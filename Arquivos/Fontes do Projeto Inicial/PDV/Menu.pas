unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ACBrUtil;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Ca1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedores1: TMenuItem;
    Estoque1: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    Funcionrios1: TMenuItem;
    Cargos1: TMenuItem;
    Sair2: TMenuItem;
    EntradasdeProdutos1: TMenuItem;
    SadasdeProdutos1: TMenuItem;
    Nvel1: TMenuItem;
    Vendas1: TMenuItem;
    Movimentaes2: TMenuItem;
    Gastos1: TMenuItem;
    Pagamentos1: TMenuItem;
    ConsultarVendas1: TMenuItem;
    CertificadoDigital1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    FluxodeCaixa2: TMenuItem;
    Movimentaes3: TMenuItem;
    Produtos2: TMenuItem;
    procedure Usurios1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EntradasdeProdutos1Click(Sender: TObject);
    procedure SadasdeProdutos1Click(Sender: TObject);
    procedure Nvel1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Movimentaes2Click(Sender: TObject);
    procedure Gastos1Click(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
    procedure Pagamentos1Click(Sender: TObject);
    procedure CertificadoDigital1Click(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
    procedure FluxodeCaixa2Click(Sender: TObject);
    procedure Movimentaes3Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;


implementation

{$R *.dfm}

uses Usuarios, Funcionarios, Cargos, Modulo, Fornecedores, Produtos,
  EntradasProdutos, SaidasProdutos, EstoqueBaixo, Vendas, Movimentacoes, Gastos,
  ListaVendas, CertificadoDigital, FluxoCaixa, RelatoriosPorDatas;

procedure TFrmMenu.Cargos1Click(Sender: TObject);
begin
FrmCargos := TFrmCargos.Create(self);
FrmCargos.ShowModal;
end;

procedure TFrmMenu.CertificadoDigital1Click(Sender: TObject);
var
addLinha: boolean;
i: integer;
serie: string;

caminhoNFCE: string;
begin

FrmCertificado := TFrmCertificado.Create(self);

try

  //APONTANDO PARA A PASTA ONDE ESTAO OS COMPONENTES NFCE
  caminhoNFCE := ExtractFilePath(Application.ExeName) + 'nfe\';
  FrmVendas.nfce.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;

  FrmVendas.nfce.SSL.LerCertificadosStore;


  addLinha := true;

  with FrmCertificado.StringGrid1 do
  begin
     ColWidths[0] := 220;
     ColWidths[1] := 250;
     ColWidths[2] := 120;
     ColWidths[3] := 80;
     ColWidths[4] := 150;

     Cells[0,0] := 'Num S�rie';
     Cells[1,0] := 'Raz�o Social';
     Cells[2,0] := 'CNPJ';
     Cells[3,0] := 'Validade';
     Cells[4,0] := 'Certificadora';

  end;

  for i := 0 to FrmVendas.nfce.SSL.ListaCertificados.Count -1 do
  begin

  with FrmVendas.nfce.SSL.ListaCertificados[i] do
  begin
  serie := NumeroSerie;


  with FrmCertificado.StringGrid1 do
  begin

  if addLinha then
  begin

     RowCount := RowCount + 1;


     Cells[0, RowCount - 1] := NumeroSerie;
     Cells[1, RowCount - 1] := RazaoSocial;
     Cells[2, RowCount - 1] := CNPJ;
     Cells[3, RowCount - 1] := FormatDateBr(DataVenc);
     Cells[4, RowCount - 1] := Certificadora;
     addLinha := true;

  end;




  end;


  end;
end;

FrmCertificado.ShowModal;
if FrmCertificado.ModalResult = mrOk then
begin
  certificadoDig := FrmCertificado.StringGrid1.Cells[0, FrmCertificado.StringGrid1.Row];

end;

 FrmVendas.nfce.Configuracoes.Certificados.NumeroSerie := certificadoDig;

  FrmVendas.nfce.WebServices.StatusServico.Executar;
  ShowMessage(certificadoDig);
  ShowMessage(FrmVendas.nfce.WebServices.StatusServico.Msg);




finally
FrmCertificado.Free;
end;

end;

procedure TFrmMenu.ConsultarVendas1Click(Sender: TObject);
begin
FrmListaVendas := TFrmListaVendas.Create(self);
FrmListaVendas.ShowModal;
end;

procedure TFrmMenu.EntradasdeProdutos1Click(Sender: TObject);
begin
FrmEntradaProdutos := TFrmEntradaProdutos.Create(self);
FrmEntradaProdutos.ShowModal;
end;

procedure TFrmMenu.FluxodeCaixa1Click(Sender: TObject);
begin
FrmFluxoCaixa := TFrmFluxoCaixa.Create(self);
FrmFluxoCaixa.ShowModal;
end;

procedure TFrmMenu.FluxodeCaixa2Click(Sender: TObject);
begin
rel := 'Caixa';
FrmRelDatas := TFrmRelDatas.Create(self);
FrmRelDatas.ShowModal;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
if (cargoUsuario = 'admin') or (cargoUsuario = 'Gerente') then
begin
      Usurios1.Enabled := true;
end;

end;

procedure TFrmMenu.Fornecedores1Click(Sender: TObject);
begin
FrmFornecedores := TFrmFornecedores.Create(self);
FrmFornecedores.ShowModal;
end;

procedure TFrmMenu.Funcionrios1Click(Sender: TObject);
begin
FrmFuncionarios := TFrmFuncionarios.Create(self);
FrmFuncionarios.ShowModal;
end;

procedure TFrmMenu.Gastos1Click(Sender: TObject);
begin
FrmGastos := TFrmGastos.Create(self);
FrmGastos.ShowModal;
end;

procedure TFrmMenu.Movimentaes2Click(Sender: TObject);
begin
FrmMovimentacoes := TFrmMovimentacoes.Create(self);
FrmMovimentacoes.ShowModal;
end;

procedure TFrmMenu.Movimentaes3Click(Sender: TObject);
begin
rel := 'Movimentacoes';
FrmRelDatas := TFrmRelDatas.Create(self);
FrmRelDatas.ShowModal;
end;

procedure TFrmMenu.Nvel1Click(Sender: TObject);
begin
FrmEstoqueBaixo := TFrmEstoqueBaixo.Create(self);
FrmEstoqueBaixo.ShowModal;
end;

procedure TFrmMenu.Pagamentos1Click(Sender: TObject);
begin
MessageDlg('Crie a tela de pagamentos conforme mostrado a de gastos!!', mtInformation, mbOKCancel, 0);
end;

procedure TFrmMenu.Produtos1Click(Sender: TObject);
begin
FrmProdutos := TFrmProdutos.Create(self);
FrmProdutos.ShowModal;
end;

procedure TFrmMenu.Produtos2Click(Sender: TObject);
begin

       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('SELECT * from produtos order by nome asc');
       dm.query_produtos.Open;


 dm.rel_produtos.LoadFromFile(GetCurrentDir + '\rel\produtos.fr3');
 dm.rel_produtos.ShowReport();
end;

procedure TFrmMenu.SadasdeProdutos1Click(Sender: TObject);
begin
FrmSaidaProdutos := TFrmSaidaProdutos.Create(self);
FrmSaidaProdutos.ShowModal;
end;

procedure TFrmMenu.Sair2Click(Sender: TObject);
begin
close;
end;

procedure TFrmMenu.Usurios1Click(Sender: TObject);
begin
FrmUsuarios := TFrmUsuarios.Create(self);
FrmUsuarios.ShowModal;
end;

procedure TFrmMenu.Vendas1Click(Sender: TObject);
begin
FrmVendas := TFrmVendas.Create(self);
FrmVendas.ShowModal;
end;

end.
