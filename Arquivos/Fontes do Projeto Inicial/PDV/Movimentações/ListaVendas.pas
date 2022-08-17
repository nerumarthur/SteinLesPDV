unit ListaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmListaVendas = class(TForm)
    Label3: TLabel;
    cbEntradaSaida: TComboBox;
    Label1: TLabel;
    dataInicial: TDateTimePicker;
    Label2: TLabel;
    dataFinal: TDateTimePicker;
    grid: TDBGrid;
    BtnCancelar: TSpeedButton;
    btnComprovante: TSpeedButton;
    btnNota: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure cbEntradaSaidaChange(Sender: TObject);
    procedure dataInicialChange(Sender: TObject);
    procedure dataFinalChange(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnComprovanteClick(Sender: TObject);
    procedure btnNotaClick(Sender: TObject);
  private
    { Private declarations }


    procedure buscarData;
  public
    { Public declarations }
  end;

var
  FrmListaVendas: TFrmListaVendas;
  idVenda : string;
  quantItem: Integer;
  id_produto: integer;
  estoque : integer;
  estoqueP : integer;

implementation

{$R *.dfm}

uses Modulo;

{ TFrmListaVendas }

procedure TFrmListaVendas.BtnCancelarClick(Sender: TObject);
begin
if MessageDlg('Deseja Cancelar a venda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 dm.query_vendas.Close;
  dm.query_vendas.SQL.Clear;
  dm.query_vendas.SQL.Add('UPDATE vendas set status = :status where id = :id') ;

  dm.query_vendas.ParamByName('status').Value :=  'Cancelada';
  dm.query_vendas.ParamByName('id').Value :=  idVenda;
  dm.query_vendas.ExecSql;


  //DELETAR TAMB�M NA TABELA DE MOVIMENTA��ES
     dm.query_mov.Close;
      dm.query_mov.SQL.Clear;
      dm.query_mov.SQL.Add('DELETE FROM movimentacoes where id_movimento = :id');
      dm.query_mov.ParamByName('id').Value := idVenda;
      dm.query_mov.ExecSQL;


      //DEVOLVER OS ITENS DA VENDA AO ESTOQUE
       dm.query_det_vendas.Close;
      dm.query_det_vendas.SQL.Clear;
      dm.query_det_vendas.SQL.Add('SELECT * from detalhes_vendas where id_venda = :id');
      dm.query_det_vendas.ParamByName('id').Value := idVenda;
      dm.query_det_vendas.Open;

      if not dm.query_det_vendas.isEmpty then
        begin
          while not dm.query_det_vendas.Eof do
          begin


             id_produto :=  dm.query_det_vendas['id_produto'];
             quantItem :=  dm.query_det_vendas['quantidade'];

    //ATUALIZAR O ESTOQUE

   //RECUPERAR O ESTOQUE ATUAL
       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('select * from produtos where id = :id');

       dm.query_produtos.ParamByName('id').Value := id_produto;
       dm.query_produtos.Open;

         if not dm.query_produtos.isEmpty then
       begin
         estoqueP :=  dm.query_produtos['estoque'];

       end;


      estoque := estoqueP + quantItem;

       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('UPDATE produtos set estoque = :estoque where id = :id');
       dm.query_produtos.ParamByName('estoque').Value := estoque;
       dm.query_produtos.ParamByName('id').Value := id_produto;
       dm.query_produtos.ExecSQL;


       dm.query_det_vendas.Next;



          end;
      end;



    MessageDlg('Deletado com Sucesso!!', mtInformation, mbOKCancel, 0);


end;

BtnCancelar.Enabled := false;
btnNota.Enabled := false;
btnComprovante.Enabled := false;
buscarData;
end;

procedure TFrmListaVendas.btnComprovanteClick(Sender: TObject);
begin
     dm.query_vendas.Close;
      dm.query_vendas.SQL.Clear;
      dm.query_vendas.SQL.Add('SELECT * from vendas where id = :id');
      dm.query_vendas.ParamByName('id').Value := idVenda;
      dm.query_vendas.Open;

       dm.query_det_vendas.Close;
      dm.query_det_vendas.SQL.Clear;
      dm.query_det_vendas.SQL.Add('SELECT * from detalhes_vendas where id_venda = :id');
      dm.query_det_vendas.ParamByName('id').Value := idVenda;
      dm.query_det_vendas.Open;

      //Chamar o Relat�rio
      dm.rel_comprovante.LoadFromFile(GetCurrentDir + '\rel\comprovante.fr3');
      dm.rel_comprovante.ShowReport();
      //dm.rel_comprovante.Print;


        btnComprovante.Enabled := false;
      btnNota.Enabled := false;
      buscarData;

end;

procedure TFrmListaVendas.btnNotaClick(Sender: TObject);
begin
MessageDlg('Configurar a chamada como na tela de vendas!', mtInformation, mbOKCancel, 0);
btnComprovante.Enabled := false;
btnNota.Enabled := false;
end;

procedure TFrmListaVendas.buscarData;
begin

 dm.query_vendas.Close;
  dm.query_vendas.SQL.Clear;
  dm.query_vendas.SQL.Add('select * from vendas where data >= :dataInicial and data <= :dataFinal and status = :status order by id desc');
  dm.query_vendas.ParamByName('dataInicial').Value :=  FormatDateTime('yyyy/mm/dd', dataInicial.Date);
  dm.query_vendas.ParamByName('dataFinal').Value :=  FormatDateTime('yyyy/mm/dd', dataFinal.Date);
  dm.query_vendas.ParamByName('status').Value :=  cbEntradaSaida.Text;
  dm.query_vendas.Open;

end;


procedure TFrmListaVendas.cbEntradaSaidaChange(Sender: TObject);
begin
buscarData;
end;

procedure TFrmListaVendas.dataFinalChange(Sender: TObject);
begin
buscarData;
end;

procedure TFrmListaVendas.dataInicialChange(Sender: TObject);
begin
buscarData;
end;

procedure TFrmListaVendas.FormShow(Sender: TObject);
begin

cbEntradaSaida.ItemIndex := 0;
dm.tb_vendas.Active := True;
dataInicial.Date := Date;
dataFinal.Date := Date;
buscarData;
end;

procedure TFrmListaVendas.gridCellClick(Column: TColumn);
begin
BtnCancelar.Enabled := true;
btnNota.Enabled := true;
btnComprovante.Enabled := true;
idVenda := dm.query_vendas.FieldByName('id').Value;

end;

end.
