unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmClientes = class(TForm)
    GridClientes: TDBGrid;
    Label1: TLabel;
    EdtNome: TEdit;
    edtMatricula: TEdit;
    Label2: TLabel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    edtBuscar: TEdit;
    Label3: TLabel;
    procedure edtBuscarChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure GridClientesCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure habilitarCampos;
    procedure buscarNome;
    procedure limpar;
    procedure desabilitarCampos;
    procedure associarCampos;
    procedure listar;
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;
  usuarioAntigo: string;
  id: string;


implementation

{$R *.dfm}
uses Modulo;

procedure TFrmClientes.edtBuscarChange(Sender: TObject);
begin
  buscarNome;
end;

procedure TFrmClientes.GridClientesCellClick(Column: TColumn);
begin
  habilitarCampos;
  btnEditar.Enabled := true;
  btnExcluir.Enabled := true;

  dm.tb_clientes.Edit;


  edtNome.Text := dm.query_usuarios.FieldByName('NOME').Value;

  edtMatricula.Text := dm.query_usuarios.FieldByName('MATRICULA').Value;



  id := dm.query_clientes.FieldByName('id').Value;

  usuarioAntigo := dm.query_usuarios.FieldByName('usuario').Value;

end;

procedure TFrmClientes.habilitarCampos;
begin
  EdtNome.Enabled := true;
  edtMatricula.Enabled := true;
end;
procedure TFrmClientes.associarCampos;
begin
  dm.tb_usuarios.FieldByName('nome').Value := edtNome.Text;
  // dm.tb_usuarios.FieldByName('usuario').Value := edtUsuario.Text;
   //dm.tb_usuarios.FieldByName('senha').Value := edtSenha.Text;
    dm.tb_usuarios.FieldByName('cargo').Value := cargoFunc;
     dm.tb_usuarios.FieldByName('id_funcionario').Value := idFunc;
end;

procedure TFrmClientes.limpar;
begin
      edtNome.Text := '';
      edtMatricula.Text := '';
      edtBuscar.Text := '';
end;

procedure TFrmClientes.listar;
begin
       dm.query_clientes.Close;
       dm.query_clientes.SQL.Clear;
       dm.query_clientes.SQL.Add('SELECT * from clientes where order by nome asc');
       dm.query_clientes.Open;
end;

procedure TFrmClientes.btnNovoClick(Sender: TObject);
begin
  habilitarCampos;
  dm.tb_usuarios.Insert;
  btnSalvar.Enabled := true;
end;

procedure TFrmClientes.buscarNome;
begin
       dm.query_clientes.Close;
       dm.query_clientes.SQL.Clear;
       dm.query_clientes.SQL.Add('SELECT * from clientes where nome LIKE :nome order by nome asc');
       dm.query_clientes.ParamByName('nome').Value := edtBuscar.Text + '%';
       dm.query_clientes.Open;
end;

procedure TFrmClientes.desabilitarCampos;
begin

end;

end.
