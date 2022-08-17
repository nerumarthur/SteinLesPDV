unit Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, frxClass, frxDBSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, unConfigDB, Biblioteca,IniFiles, Vcl.Forms;

type
  Tdm = class(TDataModule)
    fd: TFDConnection;
    tb_Cargos: TFDTable;
    query_cargos: TFDQuery;
    DSCargos: TDataSource;
    tb_func: TFDTable;
    query_func: TFDQuery;
    DSFunc: TDataSource;
    tb_usuarios: TFDTable;
    query_usuarios: TFDQuery;
    DSUsuarios: TDataSource;
    tb_forn: TFDTable;
    query_forn: TFDQuery;
    DSForn: TDataSource;
    tb_produtos: TFDTable;
    query_produtos: TFDQuery;
    DSProdutos: TDataSource;
    query_coringa: TFDQuery;
    tb_entrada_pro: TFDTable;
    query_entrada_pro: TFDQuery;
    DSEntradaProdutos: TDataSource;
    tb_saida_pro: TFDTable;
    query_saida_pro: TFDQuery;
    DSSaidaProdutos: TDataSource;
    tb_vendas: TFDTable;
    query_vendas: TFDQuery;
    DSVendas: TDataSource;
    tb_detalhes_vendas: TFDTable;
    query_det_vendas: TFDQuery;
    DSDetVendas: TDataSource;
    tb_mov: TFDTable;
    query_mov: TFDQuery;
    DSMovimentacoes: TDataSource;
    tb_gastos: TFDTable;
    query_gastos: TFDQuery;
    DSGastos: TDataSource;
    rel_comprovante: TfrxReport;
    rel_DS_Vendas: TfrxDBDataset;
    rel_DS_DetVendas: TfrxDBDataset;
    tb_caixa: TFDTable;
    query_caixa: TFDQuery;
    DSCaixa: TDataSource;
    rel_caixa: TfrxReport;
    rel_DS_Caixa: TfrxDBDataset;
    rel_movimentacoes: TfrxReport;
    rel_DS_Mov: TfrxDBDataset;
    rel_Mov_Entradas: TFDQuery;
    rel_Mov_Saidas: TFDQuery;
    rel_produtos: TfrxReport;
    rel_DS_Prod: TfrxDBDataset;
    query_caixa_Coringa: TFDQuery;
    DSCaixaCoringa: TDataSource;
    rel_vendas: TfrxReport;
    query_coringa_mov: TFDQuery;
    query_coringa_caixa: TFDQuery;
    query_coringa_vendas: TFDQuery;
    query_coringa_produtos: TFDQuery;
    DSCoringaVendas: TDataSource;
    driver: TFDPhysFBDriverLink;
    query_usuariosID: TIntegerField;
    query_usuariosNOME: TWideStringField;
    query_usuariosUSUARIO: TWideStringField;
    query_usuariosSENHA: TWideStringField;
    query_usuariosCARGO: TWideStringField;
    query_usuariosID_FUNCIONARIO: TIntegerField;
    query_funcID: TIntegerField;
    query_funcNOME: TWideStringField;
    query_funcCPF: TWideStringField;
    query_funcTELEFONE: TWideStringField;
    query_funcENDERECO: TWideStringField;
    query_funcCARGO: TWideStringField;
    query_funcDATA: TDateField;
    query_cargosID: TIntegerField;
    query_cargosCARGO: TWideStringField;
    query_fornID: TIntegerField;
    query_fornNOME: TWideStringField;
    query_fornPRODUTO: TWideStringField;
    query_fornENDERECO: TWideStringField;
    query_fornTELEFONE: TWideStringField;
    query_fornDATA: TDateField;
    query_produtosID: TIntegerField;
    query_produtosCODIGO: TWideStringField;
    query_produtosNOME: TWideStringField;
    query_produtosDESCRICAO: TWideStringField;
    query_produtosVALOR: TFMTBCDField;
    query_produtosESTOQUE: TIntegerField;
    query_produtosDATA: TDateField;
    query_produtosIMAGEM: TBlobField;
    query_produtosULTIMA_COMPRA: TDateField;
    query_entrada_proID: TIntegerField;
    query_entrada_proPRODUTO: TWideStringField;
    query_entrada_proQUANTIDADE: TIntegerField;
    query_entrada_proFORNECEDOR: TIntegerField;
    query_entrada_proVALOR: TFMTBCDField;
    query_entrada_proTOTAL: TFMTBCDField;
    query_entrada_proDATA: TDateField;
    query_entrada_proID_PRODUTO: TIntegerField;
    query_saida_proID: TIntegerField;
    query_saida_proPRODUTO: TWideStringField;
    query_saida_proQUANTIDADE: TIntegerField;
    query_saida_proMOTIVO: TWideStringField;
    query_saida_proDATA: TDateField;
    query_saida_proID_PRODUTO: TIntegerField;
    query_vendasID: TIntegerField;
    query_vendasVALOR: TFMTBCDField;
    query_vendasDATA: TDateField;
    query_vendasHORA: TTimeField;
    query_vendasFUNCIONARIO: TWideStringField;
    query_vendasDESCONTO: TFMTBCDField;
    query_vendasVALOR_RECEBIDO: TFMTBCDField;
    query_vendasTROCO: TFMTBCDField;
    query_vendasSTATUS: TWideStringField;
    query_det_vendasID: TIntegerField;
    query_det_vendasID_VENDA: TIntegerField;
    query_det_vendasPRODUTO: TWideStringField;
    query_det_vendasVALOR: TFMTBCDField;
    query_det_vendasQUANTIDADE: TIntegerField;
    query_det_vendasTOTAL: TFMTBCDField;
    query_det_vendasID_PRODUTO: TIntegerField;
    query_det_vendasFUNCIONARIO: TWideStringField;
    query_det_vendasDATA: TDateField;
    query_movID: TIntegerField;
    query_movTIPO: TWideStringField;
    query_movMOVIMENTO: TWideStringField;
    query_movVALOR: TFMTBCDField;
    query_movFUNCIONARIO: TWideStringField;
    query_movDATA: TDateField;
    query_movID_MOVIMENTO: TIntegerField;
    query_gastosID: TIntegerField;
    query_gastosMOTIVO: TWideStringField;
    query_gastosVALOR: TFMTBCDField;
    query_gastosFUNCIONARIO: TWideStringField;
    query_gastosDATA: TDateField;
    query_caixaID: TIntegerField;
    query_caixaDATA_ABERTURA: TDateField;
    query_caixaHORA_ABERTURA: TTimeField;
    query_caixaVALOR_ABERTURA: TFMTBCDField;
    query_caixaFUNCIONARIO_ABERTURA: TWideStringField;
    query_caixaDATA_FECHAMENTO: TDateField;
    query_caixaHORA_FECHAMENTO: TTimeField;
    query_caixaVALOR_FECHAMENTO: TFMTBCDField;
    query_caixaVALOR_VENDIDO: TFMTBCDField;
    query_caixaVALOR_QUEBRA: TFMTBCDField;
    query_caixaFUNCIONARIO_FECHAMENTO: TWideStringField;
    query_caixaNUM_CAIXA: TIntegerField;
    query_caixaOPERADOR: TWideStringField;
    query_caixaSTATUS: TWideStringField;
    query_caixa_CoringaID: TIntegerField;
    query_caixa_CoringaDATA_ABERTURA: TDateField;
    query_caixa_CoringaHORA_ABERTURA: TTimeField;
    query_caixa_CoringaVALOR_ABERTURA: TFMTBCDField;
    query_caixa_CoringaFUNCIONARIO_ABERTURA: TWideStringField;
    query_caixa_CoringaDATA_FECHAMENTO: TDateField;
    query_caixa_CoringaHORA_FECHAMENTO: TTimeField;
    query_caixa_CoringaVALOR_FECHAMENTO: TFMTBCDField;
    query_caixa_CoringaVALOR_VENDIDO: TFMTBCDField;
    query_caixa_CoringaVALOR_QUEBRA: TFMTBCDField;
    query_caixa_CoringaFUNCIONARIO_FECHAMENTO: TWideStringField;
    query_caixa_CoringaNUM_CAIXA: TIntegerField;
    query_caixa_CoringaOPERADOR: TWideStringField;
    query_caixa_CoringaSTATUS: TWideStringField;
    tb_caixaID: TIntegerField;
    tb_caixaDATA_ABERTURA: TDateField;
    tb_caixaHORA_ABERTURA: TTimeField;
    tb_caixaVALOR_ABERTURA: TFMTBCDField;
    tb_caixaFUNCIONARIO_ABERTURA: TWideStringField;
    tb_caixaDATA_FECHAMENTO: TDateField;
    tb_caixaHORA_FECHAMENTO: TTimeField;
    tb_caixaVALOR_FECHAMENTO: TFMTBCDField;
    tb_caixaVALOR_VENDIDO: TFMTBCDField;
    tb_caixaVALOR_QUEBRA: TFMTBCDField;
    tb_caixaFUNCIONARIO_FECHAMENTO: TWideStringField;
    tb_caixaNUM_CAIXA: TIntegerField;
    tb_caixaOPERADOR: TWideStringField;
    tb_caixaSTATUS: TWideStringField;
    tb_fornID: TIntegerField;
    tb_fornNOME: TWideStringField;
    tb_fornPRODUTO: TWideStringField;
    tb_fornENDERECO: TWideStringField;
    tb_fornTELEFONE: TWideStringField;
    tb_fornDATA: TDateField;
    tb_usuariosID: TIntegerField;
    tb_usuariosNOME: TWideStringField;
    tb_usuariosUSUARIO: TWideStringField;
    tb_usuariosSENHA: TWideStringField;
    tb_usuariosCARGO: TWideStringField;
    tb_usuariosID_FUNCIONARIO: TIntegerField;
    tb_funcID: TIntegerField;
    tb_funcNOME: TWideStringField;
    tb_funcCPF: TWideStringField;
    tb_funcTELEFONE: TWideStringField;
    tb_funcENDERECO: TWideStringField;
    tb_funcCARGO: TWideStringField;
    tb_funcDATA: TDateField;
    tb_CargosID: TIntegerField;
    tb_CargosCARGO: TWideStringField;
    tb_saida_proID: TIntegerField;
    tb_saida_proPRODUTO: TWideStringField;
    tb_saida_proQUANTIDADE: TIntegerField;
    tb_saida_proMOTIVO: TWideStringField;
    tb_saida_proDATA: TDateField;
    tb_saida_proID_PRODUTO: TIntegerField;
    tb_entrada_proID: TIntegerField;
    tb_entrada_proPRODUTO: TWideStringField;
    tb_entrada_proQUANTIDADE: TIntegerField;
    tb_entrada_proFORNECEDOR: TIntegerField;
    tb_entrada_proVALOR: TFMTBCDField;
    tb_entrada_proTOTAL: TFMTBCDField;
    tb_entrada_proDATA: TDateField;
    tb_entrada_proID_PRODUTO: TIntegerField;
    tb_vendasID: TIntegerField;
    tb_vendasVALOR: TFMTBCDField;
    tb_vendasDATA: TDateField;
    tb_vendasHORA: TTimeField;
    tb_vendasFUNCIONARIO: TWideStringField;
    tb_vendasDESCONTO: TFMTBCDField;
    tb_vendasVALOR_RECEBIDO: TFMTBCDField;
    tb_vendasTROCO: TFMTBCDField;
    tb_vendasSTATUS: TWideStringField;
    tb_detalhes_vendasID: TIntegerField;
    tb_detalhes_vendasID_VENDA: TIntegerField;
    tb_detalhes_vendasPRODUTO: TWideStringField;
    tb_detalhes_vendasVALOR: TFMTBCDField;
    tb_detalhes_vendasQUANTIDADE: TIntegerField;
    tb_detalhes_vendasTOTAL: TFMTBCDField;
    tb_detalhes_vendasID_PRODUTO: TIntegerField;
    tb_detalhes_vendasFUNCIONARIO: TWideStringField;
    tb_detalhes_vendasDATA: TDateField;
    tb_movID: TIntegerField;
    tb_movTIPO: TWideStringField;
    tb_movMOVIMENTO: TWideStringField;
    tb_movVALOR: TFMTBCDField;
    tb_movFUNCIONARIO: TWideStringField;
    tb_movDATA: TDateField;
    tb_movID_MOVIMENTO: TIntegerField;
    tb_gastosID: TIntegerField;
    tb_gastosMOTIVO: TWideStringField;
    tb_gastosVALOR: TFMTBCDField;
    tb_gastosFUNCIONARIO: TWideStringField;
    tb_gastosDATA: TDateField;
    tb_produtosID: TIntegerField;
    tb_produtosCODIGO: TWideStringField;
    tb_produtosNOME: TWideStringField;
    tb_produtosDESCRICAO: TWideStringField;
    tb_produtosVALOR: TFMTBCDField;
    tb_produtosESTOQUE: TIntegerField;
    tb_produtosDATA: TDateField;
    tb_produtosIMAGEM: TBlobField;
    tb_produtosULTIMA_COMPRA: TDateField;
    tb_clientes: TFDTable;
    query_clientes: TFDQuery;
    dsClientes: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure driverDriverCreated(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure fdBeforeConnect(Sender: TObject);
  private
    procedure CarregaBanco;

    { Private declarations }
  public
    { Public declarations }
  end;


var
  dm: Tdm;

  //DECLARAÇÃO DAS VARIAVEIS GLOBAIS
  idFunc : string;
  nomeFunc : string;
  cargoFunc : string;

  chamada : string;


  nomeUsuario : string;
  cargoUsuario: string;


  codigoProduto : string;

  idFornecedor : string;
  nomeFornecedor: string;

  nomeProduto : string;
  estoqueProduto : double;
  idProduto : string;


  totalProdutos: double;

  certificadoDig: string;

  statusCaixa: string;
  numeroCaixa: string;

  rel: string;
  excluir: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

procedure Tdm.CarregaBanco;
begin
  try
    fd.Params.Database := GetValorIni(ExtractFilePath(Application.ExeName)+ 'config.ini', 'CONFIGURACAO', 'LOCAL_DB');
    fd.Connected := TRUE;
  except
    ConfigDB.ShowModal;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  CarregaBanco;
 { fd.Params.Database := 'DADOS';
  fd.Params.UserName := 'SYSDBA';
  fd.Params.Password := 'masterkey';
  Driver.VendorLib := GetCurrentDir + '\bd\fbclient.dll';
  fd.Connected := True;   }

end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
fd.Connected := False;
end;

procedure Tdm.driverDriverCreated(Sender: TObject);
var
caminho : string;
begin
caminho := GetCurrentDir + '\bd\fbclient.dll';
driver.VendorLib := caminho;

end;


procedure Tdm.fdBeforeConnect(Sender: TObject);
begin
tb_Cargos.TableName := 'cargos';
tb_func.TableName := 'funcionarios';
tb_forn.TableName := 'fornecedores';
tb_Vendas.TableName := 'vendas';
tb_Produtos.TableName := 'cargos';
tb_caixa.TableName := 'caixa';
tb_detalhes_vendas.TableName := 'detalhes_vendas';
tb_entrada_pro.TableName := 'entrada_produtos';
tb_gastos.TableName := 'gastos';
tb_saida_pro.TableName := 'saida_produtos';
tb_usuarios.TableName := 'usuarios';
tb_mov.TableName := 'movimentacoes';

end;

end.
