unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    imgFundo: TImage;
    pnlLogin: TPanel;
    imgLogin: TImage;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btnLogin: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure centralizarPainel;
    procedure login;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Menu, Modulo, Caixa, UnCaixa;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
     if Trim(EdtUsuario.Text) = '' then
     begin
         MessageDlg('Preencha o Usuário!', mtInformation, mbOKCancel, 0);
         EdtUsuario.SetFocus;
         exit;
     end;

      if Trim(EdtSenha.Text) = '' then
     begin
         MessageDlg('Preencha a Senha!', mtInformation, mbOKCancel, 0);
         EdtSenha.SetFocus;
         exit;
     end;


     login;
end;

procedure TFrmLogin.centralizarPainel;
begin
    pnlLogin.Top := (self.Height div 2) - (pnlLogin.Height div 2);
    pnlLogin.Left := (self.Width div 2) - (pnlLogin.Width div 2);
end;

procedure TFrmLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     centralizarPainel;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 login;

end;

procedure TFrmLogin.imgLoginClick(Sender: TObject);
begin
      FrmTelaVenda := TFrmTelaVenda.Create(Application);
      FrmTelaVenda.Show;

end;

procedure TFrmLogin.login;
begin
//AQUI VIRA O CÓDIGO DE LOGIN

       dm.query_usuarios.Close;
       dm.query_usuarios.SQL.Clear;
       dm.query_usuarios.SQL.Add('SELECT * from usuarios where usuario = :usuario and senha = :senha');
        dm.query_usuarios.ParamByName('usuario').Value := edtUsuario.Text;
         dm.query_usuarios.ParamByName('senha').Value := edtSenha.Text;
       dm.query_usuarios.Open;

       if not dm.query_usuarios.isEmpty then
       begin
         nomeUsuario :=  dm.query_usuarios['nome'];
         cargoUsuario :=  dm.query_usuarios['cargo'];

         //VERIFICAR SE QUEM LOGOU FOI UM OPERADOR DE CAIXA
         if cargoUsuario = 'Operador de Caixa' then
         begin
           FrmCaixa := TFrmCaixa.Create(self);
           EdtSenha.Text := '';
           statusCaixa := 'Abertura';
           FrmCaixa.ShowModal;

           exit;
         end;


         FrmMenu := TFrmMenu.Create(FrmLogin);
         EdtSenha.Text := '';
         FrmMenu.ShowModal;

          end
          else
          begin
           MessageDlg('Os dados estão incorretos!!', mtInformation, mbOKCancel, 0);
           edtusuario.Text := '';
           EdtSenha.Text := '';
           edtUsuario.SetFocus;
       end;




end;

end.
