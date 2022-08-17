unit Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, frxClass, frxDBSet;

type
  Tdm = class(TDataModule)
    fd: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    tb_Cargos: TFDTable;
    query_cargos: TFDQuery;
    query_cargosid: TFDAutoIncField;
    query_cargoscargo: TStringField;
    DSCargos: TDataSource;
    tb_func: TFDTable;
    query_func: TFDQuery;
    DSFunc: TDataSource;
    query_funcid: TFDAutoIncField;
    query_funcnome: TStringField;
    query_funccpf: TStringField;
    query_functelefone: TStringField;
    query_funcendereco: TStringField;
    query_funccargo: TStringField;
    query_funcdata: TDateField;
    tb_usuarios: TFDTable;
    query_usuarios: TFDQuery;
    query_usuariosid: TFDAutoIncField;
    query_usuariosnome: TStringField;
    query_usuariosusuario: TStringField;
    query_usuariossenha: TStringField;
    query_usuarioscargo: TStringField;
    query_usuariosid_funcionario: TIntegerField;
    DSUsuarios: TDataSource;
    tb_forn: TFDTable;
    query_forn: TFDQuery;
    DSForn: TDataSource;
    query_fornid: TFDAutoIncField;
    query_fornnome: TStringField;
    query_fornproduto: TStringField;
    query_fornendereco: TStringField;
    query_forntelefone: TStringField;
    query_forndata: TDateField;
    tb_produtos: TFDTable;
    query_produtos: TFDQuery;
    DSProdutos: TDataSource;
    query_produtosid: TFDAutoIncField;
    query_produtoscodigo: TStringField;
    query_produtosnome: TStringField;
    query_produtosdescricao: TStringField;
    query_produtosvalor: TBCDField;
    query_produtosestoque: TIntegerField;
    query_produtosdata: TDateField;
    query_produtosimagem: TBlobField;
    query_coringa: TFDQuery;
    tb_entrada_pro: TFDTable;
    query_entrada_pro: TFDQuery;
    DSEntradaProdutos: TDataSource;
    query_entrada_proid: TFDAutoIncField;
    query_entrada_proproduto: TStringField;
    query_entrada_proquantidade: TIntegerField;
    query_entrada_profornecedor: TIntegerField;
    query_entrada_provalor: TBCDField;
    query_entrada_prototal: TBCDField;
    query_entrada_prodata: TDateField;
    query_entrada_proid_produto: TIntegerField;
    query_entrada_pronome: TStringField;
    query_entrada_protelefone: TStringField;
    query_produtosultima_compra: TDateField;
    tb_saida_pro: TFDTable;
    query_saida_pro: TFDQuery;
    query_saida_proid: TFDAutoIncField;
    query_saida_proproduto: TStringField;
    query_saida_proquantidade: TIntegerField;
    query_saida_promotivo: TStringField;
    query_saida_prodata: TDateField;
    DSSaidaProdutos: TDataSource;
    query_saida_proid_produto: TIntegerField;
    tb_vendas: TFDTable;
    query_vendas: TFDQuery;
    query_vendasid: TFDAutoIncField;
    query_vendasvalor: TBCDField;
    query_vendasfuncionario: TStringField;
    DSVendas: TDataSource;
    tb_detalhes_vendas: TFDTable;
    query_det_vendas: TFDQuery;
    query_det_vendasid: TFDAutoIncField;
    query_det_vendasid_venda: TIntegerField;
    query_det_vendasproduto: TStringField;
    query_det_vendasvalor: TBCDField;
    query_det_vendasquantidade: TIntegerField;
    query_det_vendastotal: TBCDField;
    query_det_vendasid_produto: TIntegerField;
    query_det_vendasfuncionario: TStringField;
    DSDetVendas: TDataSource;
    tb_mov: TFDTable;
    query_mov: TFDQuery;
    DSMovimentacoes: TDataSource;
    tb_gastos: TFDTable;
    query_gastos: TFDQuery;
    query_gastosid: TFDAutoIncField;
    query_gastosmotivo: TStringField;
    query_gastosvalor: TBCDField;
    query_gastosfuncionario: TStringField;
    query_gastosdata: TDateField;
    DSGastos: TDataSource;
    query_vendasdesconto: TBCDField;
    query_vendasvalor_recebido: TBCDField;
    query_vendastroco: TBCDField;
    query_vendasstatus: TStringField;
    query_vendashora: TTimeField;
    query_vendasdata: TDateField;
    rel_comprovante: TfrxReport;
    rel_DS_Vendas: TfrxDBDataset;
    rel_DS_DetVendas: TfrxDBDataset;
    tb_caixa: TFDTable;
    query_caixa: TFDQuery;
    DSCaixa: TDataSource;
    query_caixaid: TFDAutoIncField;
    query_caixadata_abertura: TDateField;
    query_caixahora_abertura: TTimeField;
    query_caixavalor_abertura: TBCDField;
    query_caixafuncionario_abertura: TStringField;
    query_caixadata_fechamento: TDateField;
    query_caixahora_fechamento: TTimeField;
    query_caixavalor_fechamento: TBCDField;
    query_caixavalor_vendido: TBCDField;
    query_caixavalor_quebra: TBCDField;
    query_caixafuncionario_fechamento: TStringField;
    query_caixanum_caixa: TIntegerField;
    query_caixaoperador: TStringField;
    query_caixastatus: TStringField;
    rel_caixa: TfrxReport;
    rel_DS_Caixa: TfrxDBDataset;
    rel_movimentacoes: TfrxReport;
    rel_DS_Mov: TfrxDBDataset;
    rel_Mov_Entradas: TFDQuery;
    rel_Mov_Saidas: TFDQuery;
    rel_produtos: TfrxReport;
    rel_DS_Prod: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
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


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
fd.Connected := True;
end;

end.
