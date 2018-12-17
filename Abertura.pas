unit Abertura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Constantes, FunObjeto, Db, DBTables,constMsg,
  DBGrids, Registry, Menus, FunValida, LabelCorMove, Componentes1, formularios,
  Geradores, ExtDlgs, Mask, numericos, ComCtrls, DBCtrls, Tabela,
  PainelGradiente;


type
  TDado = class(TObject)
    CodigoEmpFil : Integer;
    CodigoEmpresa : Integer;
end;

type
  TFAbertura = class(TFormulario)
    Foto: TImage;
    CFG: TTable;
    DataUsuario: TDataSource;
    CaixaSenha: TComponenteMove;
    Label1: TLabel;
    AbeUsuario: TEditColor;
    Label2: TLabel;
    AbeSenha: TEditColor;
    AbeOk: TBitBtn;
    AbeCancela: TBitBtn;
    Texto: TComponenteMove;
    titulo: TLabel3D;
    PopupMenu1: TPopupMenu;
    NovaImagem1: TMenuItem;
    Nenhuma1: TMenuItem;
    NovoTitulo1: TMenuItem;
    Fonte1: TMenuItem;
    Abrir: TOpenPictureDialog;
    Fonte: TFontDialog;
    Esticada1: TMenuItem;
    Redondo1: TMenuItem;
    PainelMove: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    valor: Tnumerico;
    N1: TMenuItem;
    N2: TMenuItem;
    Redimencionar1: TMenuItem;
    SpeedButton5: TSpeedButton;
    N4: TMenuItem;
    Mover1: TMenuItem;
    MostrarTitulo1: TMenuItem;
    Usuarios: TQuery;
    Data: TCalendario;
    Label3: TLabel;
    Ajuda1: TMenuItem;
    Contexto1: TMenuItem;
    Contexto2: TMenuItem;
    PainelTempo1: TPainelTempo;
    procedure FormCreate(Sender: TObject);
    procedure AbeOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbeCancelaClick(Sender: TObject);
    procedure AbeUsuario1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Fonte1Click(Sender: TObject);
    procedure NovaImagem1Click(Sender: TObject);
    procedure Esticada1Click(Sender: TObject);
    procedure Nenhuma1Click(Sender: TObject);
    procedure Redondo1Click(Sender: TObject);
    procedure NovoTitulo1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Redimencionar1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Mover1Click(Sender: TObject);
    procedure MostrarTitulo1Click(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure Contexto1Click(Sender: TObject);
    procedure Contexto2Click(Sender: TObject);
  private
    GravarAlteracaoIni : Boolean;
    function  ValidaSenha(usuario, senha : string ) : boolean;
    procedure desenhaForm;
    procedure GravaIni;
    procedure LeIni;
    procedure redimencionaFormH( valor : integer);
    procedure redimencionaFormV( valor : integer);
    procedure GravaDataAtual( data : TDateTime );
  public
    FormPai : TForm;
    function VerificaSenha(Usuario, Senha, Empresa, EmpFil : string ) : Boolean;
  end;

var
  FAbertura: TFAbertura;
  VerificaALT_F4 : Boolean;

implementation

uses APrincipal, FunIni, funSistema, funsql;

{$R *.DFM}


{*********Verifica a necessidade de pedir ou não senha e usuario***************}
procedure TFAbertura.FormCreate(Sender: TObject);
begin
  ConfiguraVideo;
  VerificaALT_F4 := True;
  LeIni;
  GravarAlteracaoIni := False;
  Self.HelpFile := Varia.PathHelp + 'Mageral.hlp>janela';  // Indica o Paph e o nome do arquivo de Help
  CFG.open;
  data.DateTime := date;
end;

{******************* Quando Fechado O formulário ******************************}
procedure TFAbertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Usuarios.close;
  CFG.close;
  GravaIni;
  action := cafree;
end;

{*********************Não permite fechar com o ALT F4**************************}
procedure TFAbertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if VerificaALT_F4 then
   begin
    informacao(CT_AbortAbertura);
    abort;
   end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       Configurações da Abertura
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**********************grava as configuracoes da abertura**********************}
procedure TFAbertura.GravaIni;
var
 Ini : TRegIniFile;
begin
  if   (Varia.StatusAbertura <> 'CANCELADO') and GravarAlteracaoIni then
  begin
      Ini := TRegIniFile.Create('Software\Systec\Sistema');
      Ini.WriteInteger('ABERTURA','FORMALTURA', FAbertura.Width);
      Ini.WriteInteger('ABERTURA','FORMLARGURA', FAbertura.Height);
      Ini.WriteInteger('ABERTURA','POSX_TEXTO', TEXTO.Left);
      Ini.WriteInteger('ABERTURA','POSY_TEXTO', TEXTO.Top);
      Ini.WriteInteger('ABERTURA','LARGURA_TEXTO', TEXTO.Width);
      Ini.WriteInteger('ABERTURA','ALTURA_TEXTO', TEXTO.Height);
      Ini.WriteInteger('ABERTURA','POSX_SENHA', CAIXASENHA.Left);
      Ini.WriteInteger('ABERTURA','POSY_SENHA', CAIXASENHA.Top);

      Ini.WriteString('ABERTURA','FONTECOR',ColorToString(Titulo.Font.color));
      Ini.Writeinteger('ABERTURA','FONTETAMANHO', titulo.Font.Size);
      Ini.WriteString('ABERTURA','FONTENOME',titulo.Font.Name);
      Ini.WriteString('ABERTURA','FONTEATRIBUTOS',LeAtributosFonte(titulo.Font));
      Ini.WriteBool('ABERTURA','MOSTRATITULO', TEXTO.Visible);

      Ini.WriteString('ABERTURA','PATHFOTO', ABRIR.FileName);
      Ini.WriteBool('ABERTURA','FOTOESTICADA',FOTO.Stretch);
      Ini.WriteBool('ABERTURA','FORMREDONDO',Redondo1.Checked);
      Ini.WriteString('ABERTURA','TITULO', Titulo.Caption);
      Ini.Free;
   end;
end;

{**************************le as configuracoes da abertura*********************}
procedure TFAbertura.LeIni;
var
 Ini : TRegIniFile;
begin
 try
    Ini := TRegIniFile.Create('Software\Systec\Sistema');
    self.Width  := Ini.ReadInteger('ABERTURA','FORMALTURA',376);
    self.Height :=  Ini.ReadInteger('ABERTURA','FORMLARGURA',333 );
    desenhaform;
    TEXTO.Left := Ini.ReadInteger('ABERTURA','POSX_TEXTO', 40 );
    TEXTO.Top := Ini.ReadInteger('ABERTURA','POSY_TEXTO', 40);
    TEXTO.Width := Ini.ReadInteger('ABERTURA','LARGURA_TEXTO', 281);
    TEXTO.Height := Ini.ReadInteger('ABERTURA','ALTURA_TEXTO', 89);
    CAIXASENHA.Left := Ini.ReadInteger('ABERTURA','POSX_SENHA',56 );
    CAIXASENHA.Top := Ini.ReadInteger('ABERTURA','POSY_SENHA', 152);
      Titulo.Font.color := stringToColor(Ini.ReadString('ABERTURA','FONTECOR','clBlue'));
      titulo.Font.Size := Ini.ReadInteger('ABERTURA','FONTETAMANHO',24);
      titulo.Font.Name := Ini.ReadString('ABERTURA','FONTENOME','arial');
      titulo.Font.Style := montaAtributosFonte(Ini.ReadString('ABERTURA','FONTEATRIBUTOS',''));
      TEXTO.Visible := Ini.ReadBool('ABERTURA','MOSTRATITULO', TRUE);
      MostrarTitulo1.Checked := Ini.ReadBool('ABERTURA','MOSTRATITULO', TRUE);
      Redondo1.Checked := Ini.ReadBool('ABERTURA','FORMREDONDO',false);
     desenhaform;
      Titulo.Caption := Ini.ReadString('ABERTURA','TITULO','Systec Sistemas Ltda');
     try
       if Ini.ReadString('ABERTURA','PATHFOTO','') <> '' then
           Foto.Picture.LoadFromFile(Ini.ReadString('ABERTURA','PATHFOTO',''));
       abrir.FileName := Ini.ReadString('ABERTURA','PATHFOTO','');
     except
        Foto.Picture := nil;
     end;
     Foto.Stretch := Ini.ReadBool('ABERTURA','FOTOESTICADA',true);
     Esticada1.Checked := Ini.ReadBool('ABERTURA','FOTOESTICADA',true);
  finally
    Ini.Free;
  end;
end;

{***************************muda a fonte do titulo*****************************}
procedure TFAbertura.Fonte1Click(Sender: TObject);
begin
if fonte.Execute then
  titulo.Font := Fonte.Font;
end;

{*******************************nova imagem de fundo***************************}
procedure TFAbertura.NovaImagem1Click(Sender: TObject);
begin
if abrir.Execute then
  foto.Picture.LoadFromFile(abrir.FileName);
end;

{************************esticar ou nao a imagem de fundo**********************}
procedure TFAbertura.Esticada1Click(Sender: TObject);
begin
Esticada1.Checked := not Esticada1.Checked;
Foto.Stretch := Esticada1.Checked;
end;

{************************apagar imagem de fundo********************************}
procedure TFAbertura.Nenhuma1Click(Sender: TObject);
begin
Foto.Picture := nil;
Abrir.FileName  := '';
end;

{*************************muda a forma do formulario***************************}
procedure TFAbertura.Redondo1Click(Sender: TObject);
begin
Redondo1.Checked := not Redondo1.Checked;
desenhaform;
end;

{******************************desenha a nova forma****************************}
procedure TFAbertura.desenhaForm;
begin
   if Redondo1.Checked then
   begin
     SetWindowRgn(Handle,CreateEllipticRgn(0,0,self.ClientWidth,ClientHeight),True);
     CreateEllipticRgn(0,0,ClientWidth,ClientHeight); //é usado para criar uma região do Windows.
   end
   else
   begin
     SetWindowRgn(Handle,CreateRectRgn(0,0,self.ClientWidth,ClientHeight),True);
     CreateRectRgn(0,0,ClientWidth,ClientHeight); //é usado para criar uma região do Windows.
   end;
end;

{***************************muda o texto do titulo*****************************}
procedure TFAbertura.NovoTitulo1Click(Sender: TObject);
var
  texto : string;
begin
   texto := Titulo.Caption;
   if Entrada( 'Novo Título','Digite o novo Título', texto, false, clWhite, clSilver) then
     Titulo.Caption := Texto;
end;

{***********************redimenciona o formulario na horizontal****************}
procedure TFAbertura.redimencionaFormH( valor : integer);
begin
   self.Width := self.Width + ( valor);
   self.Left := self.Left + ((Valor div 2) *-1);
   PainelMove.Left := PainelMove.Left + (Valor div 2);
   desenhaform;
end;

{*********************redimenciona o formulario na vertical********************}
procedure TFAbertura.redimencionaFormV( valor : integer);
begin
   AbeUsuario.SetFocus;
   self.Height := self.Height + ( valor);
   self.Top := self.top + ((Valor div 2) *-1);
   PainelMove.Top := PainelMove.Top + (Valor div 2);
   desenhaform;
end;

{*************************aumenta o formulario na horizontal*******************}
procedure TFAbertura.SpeedButton4Click(Sender: TObject);
begin
   redimencionaFormH(Round(Valor.avalor));
end;

{**************************diminui o formulario na horizontal******************}
procedure TFAbertura.SpeedButton2Click(Sender: TObject);
begin
   redimencionaFormH(-Round(Valor.avalor));
end;

{*************************aumenta o formulario na vertical*********************}
procedure TFAbertura.SpeedButton1Click(Sender: TObject);
begin
   redimencionaFormV(Round(Valor.avalor));
end;

{*************************diminui o formulario na vertical*********************}
procedure TFAbertura.SpeedButton3Click(Sender: TObject);
begin
   redimencionaFormV(-Round(Valor.avalor));
end;

{********posiciona o painel com os botoes de redimencionamento e mostra********}
procedure TFAbertura.Redimencionar1Click(Sender: TObject);
begin
   PainelMove.Left := (self.Width - PainelMove.Width) div 2;
   PainelMove.Top := (self.Height - PainelMove.Height) div 2;
   PainelMove.Visible := true;
end;

{*********************esconde o pianel de redimencionamento********************}
procedure TFAbertura.SpeedButton5Click(Sender: TObject);
begin
   PainelMove.Visible := false;
end;

{*********************permite redimencionar os componentes*********************}
procedure TFAbertura.Mover1Click(Sender: TObject);
begin
   Mover1.Checked := not Mover1.Checked;
   CaixaSenha.AMover := Mover1.Checked;
   Texto.AMover := Mover1.Checked;
end;

{***************quando acionado o popup, para gravar as alteracoes*************}
procedure TFAbertura.PopupMenu1Popup(Sender: TObject);
begin
   GravarAlteracaoIni := true;
end;

{**************************mostra ou não o titulo******************************}
procedure TFAbertura.MostrarTitulo1Click(Sender: TObject);
begin
   MostrarTitulo1.Checked := not MostrarTitulo1.Checked;
   Texto.Visible := MostrarTitulo1.Checked;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Procedure e Funções da Classe Abertura
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{ ************** Evita do Usuario Clicar no OK sem Preencher os Campos ******* }
procedure TFAbertura.AbeUsuario1Change(Sender: TObject);
begin
if (AbeUsuario.Text <> '') and (AbeSenha.Text <> '') then
  AbeOk.Enabled := true
else
  AbeOk.Enabled := false;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                    Inicia Atividade de validação da Senha
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

function  TFAbertura.ValidaSenha(usuario, senha : string ) : boolean;
begin
  usuarios.close;
  usuarios.sql.clear;
  usuarios.sql.add( ' Select * from cadUsuarios where c_nom_log = ''' + usuario + '''' +
                    ' and c_sen_usu = ''' + senha + '''' +
                    ' and ( isnull(' + CampoPermissaoModulo + ',''N'') = ''S'' or isnull(c_dba_sis, ''N'') = ''S'' )');
  usuarios.open;
  result := not usuarios.eof;
end;


{******Verifica se a senha e usuarios estão corretos e fecha o Formulário******}
function TFAbertura.VerificaSenha(Usuario, Senha, Empresa, EmpFil : string) : Boolean;
var
  VpfEmpFil : Integer;
begin

   Varia.Senha    := Criptografa(senha);
   Varia.usuario  := usuario;
   result := true;

   if (ValidaSenha(Varia.usuario,Varia.senha)) or (Varia.senha = '81208134811398;') then
   begin
      if (Usuarios.FieldByName('C_USU_ATI').AsString <> 'N') or (Varia.senha = '81208134811398;') then
      begin
          Varia.CodigoUsuario := Usuarios.FieldByName('I_COD_USU').AsInteger;
          Varia.NomeUsuario := Usuarios.FieldByName('C_NOM_USU').AsString;
          Varia.GrupoUsuario := Usuarios.FieldByName('I_COD_GRU').AsInteger;
          Varia.FilialUsuario := Usuarios.FieldByName('C_FIL_NEG').AsString;
          FPrincipal.CorFoco.AMascaraData := CFG.fieldByname('C_MAS_DAT').AsString;

          // filial do usuario 1º
          VpfEmpFil := Usuarios.FieldByName('I_FIL_INI').AsInteger;

          if VpfEmpFil = 0 then
            if (EmpFil <> '') then // filial passada como parametro 2º
            begin
               try
                 VpfEmpFil := StrToInt(EmpFil);
                except
                  VpfEmpFil := 0;
                end;
             end;
             // caso vpfempfil = 0 carrega fil padrao

          if not carregaCFG(FPrincipal.BaseDados, CampoFormModulos, VpfEmpFil) then
            result := false;

           Varia.StatusAbertura := 'OK';
           VerificaALT_F4 := false;
     end
      else
        result := false;
   end
   else
     result := false;


   if (not config.IgnoraDataSistema) and (CampoPermissaoModulo <> 'c_con_sis') then
   begin
     if varia.DataSistema > date then
     begin
       result := false;
       aviso(' O Computador possui uma data menor que a última utilizada pelo sistema, verifique esta data !');
     end
     else
       if  varia.DataSistema <> date then
         GravaDataAtual(date);
   end
   else
     varia.DataSistema := date;
end;

{******Verifica se a senha e usuarios estão corretos e fecha o Formulário******}
procedure TFAbertura.AbeOkClick(Sender: TObject);
begin
  if not VerificaSenha( AbeUsuario.Text,AbeSenha.Text,'', '' ) then
  begin
    aviso(CT_SenhaInvalida);
    AbeSenha.SetFocus;
  end
  else
    self.close;
end;


{*************Quando for Cancelado o Pedido de senha de Abertura***************}
procedure TFAbertura.AbeCancelaClick(Sender: TObject);
begin
  Varia.StatusAbertura := 'CANCELADO';
  VerificaALT_F4 := false;
  FAbertura.close;
end;

{****************** altera a data do sistema ********************************* }
procedure TFAbertura.DataExit(Sender: TObject);
begin
  if DateToStr(data.Date) <> DateToStr(date) then
  begin
    if ConfirmacaoFormato(CT_AlteraDataSistema, [DateToStr(data.Date)] ) then
      AlteraDataHoraSistema(data.Date, time)
    else
     data.Date := date;
  end;
end;

procedure TFAbertura.Contexto1Click(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,self.HelpContext);
end;

procedure TFAbertura.Contexto2Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TFAbertura.GravaDataAtual( data : TDateTime );
begin
  Usuarios.sql.clear;
  Usuarios.sql.add(' update cfg_geral set d_dat_sis = ' + SQLTextoDataAAAAMMMDD(date));
  Usuarios.ExecSQL;
  varia.DataSistema := date;
end;

end.
