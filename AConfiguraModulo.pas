unit AConfiguraModulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Buttons, ExtCtrls, Gauges, Componentes1, PainelGradiente, Db,
  DBTables, ComCtrls;

type
  TFConfiguraModulo = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    RBarra: TGauge;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LTexto: TLabel;
    CFG: TQuery;
    BBAjuda: TBitBtn;
    Barra: TProgressBar;
    Timer2: TTimer;
    Atualiza: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    Nro: TEditColor;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    Lista : TStringList;
    contaLista : integer;
    chamadaExterna : Boolean;
    esconde : Boolean;
    procedure AtualizaModulos;
    procedure AlteraCFG( texto : string );
    procedure LimpaCFG;
    procedure AtualizaTexto( texto : string);
    function TextoAtualizacao( modulo : string ) : string;
    procedure CriaCampoAtualiza( campo, Texto : string );
  public
    procedure ConfiguraOpcoesModulos( lista : TstringList );
  end;

var
  FConfiguraModulo: TFConfiguraModulo;

implementation

uses APrincipal, UnRegistro, FunString, constantes, constmsg, funhardware;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguraModulo.FormCreate(Sender: TObject);
begin
   chamadaExterna := false;
   if varia <> nil then
     Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   Lista := TStringList.Create;
   CFG.open;
   Label1.Caption := NumeroSerie('C:\');
   esconde := false;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguraModulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Lista.Free;
 cfg.close;
 if FPrincipal.BaseDados.InTransaction then
   FPrincipal.BaseDados.Rollback;
 Action := CaFree;
end;


{*********** inicia a atualizacao dos modulos ******************************* }
procedure TFConfiguraModulo.BitBtn1Click(Sender: TObject);
var
  reg : TRegistro;
  senha : string;
begin
  if nro.Text <> '' then
  begin
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    reg := TRegistro.create;
    lista.Clear;
//    Lista := reg.GeraListaModulos(Nro.Text);
//    if reg.ValidaDigitoVerificado(strtoint(lista.Strings[0]),strtoint(lista.Strings[1])) then
    begin
      if Entrada('Código da máquina','Digite código da máquina', senha, esconde, clwhite, clsilver) then
      begin
//        if (reg.ValidaGeraNroAtualizaModulos(UpperCase(senha),label1.Caption)) or (senha = 'INDATA2001') then
        begin
         LTexto.Caption := 'Iniciando atualização, aguarde...';
         AtualizaModulos;
        end;
      end;
    end
//    else
//      aviso('Código de Configuração de modulos inválido!');
//    BitBtn2.Enabled := true;
//    BitBtn1.Enabled := true;
//    reg.Free;
  end;
end;

{******************* configura os modulos chamada externa ******************** }
procedure TFConfiguraModulo.ConfiguraOpcoesModulos( lista : TstringList );
var
  reg : TRegistro;
begin
  BitBtn1.Enabled := false;
  BitBtn2.Enabled := false;
  self.lista := lista;
  reg := TRegistro.create;
  reg.DesCriptografaLista(lista);
  reg.Free;
  AtualizaModulos;
  chamadaExterna := true;
  PanelColor2.Visible := false;
  self.Height := self.Height - PanelColor2.Height;
  self.ShowModal;
end;


{************** atualiza o texto de status de importacao de atualizacao ****** }
procedure TFConfiguraModulo.AtualizaTexto( texto : string);
begin
    LTexto.Caption := texto;
    LTexto.Refresh;
end;

{************** Texto do status de atualizacao  ***************************** }
function TFConfiguraModulo.TextoAtualizacao( modulo : string ) : string;
begin
  if modulo = CT_BANCARIO then result := 'Modulo Báncario...' else
  if modulo = CT_COMISSAO then result := 'Modulo de Comissões...' else
  if modulo = CT_CAIXA then result := 'Modulo Caixa...' else
  if modulo = CT_CONTAPAGAR then result := 'Modulo de Contas a Pagar...' else
  if modulo = CT_CONTARECEBER then result := 'Modulo de Contas a Receber...' else
  if modulo = CT_FLUXO then result := 'Modulo de Fluxo de Caixa...' else
  if modulo = CT_FATURAMENTO then result := 'Modulo de Faturamento...' else
  if modulo = CT_PRODUTO then result := 'Modulo de Produtos...' else
  if modulo = CT_CUSTO then result := 'Modulo de Custo...' else
  if modulo = CT_ESTOQUE then result := 'Modulo de Estoque...' else
  if modulo = CT_SERVICO then result := 'Modulo de Serviços...' else
  if modulo = CT_NOTAFISCAL then result := 'Modulo de Notas Fiscais...' else
  if modulo = CT_TEF then result := 'Modulo de Transmisão Eletrônica de Fundos (TEF)...' else
  if modulo = CT_ECF then result := 'Modulo de Emissão de Cupom Fiscal (ECF)...' else
  if modulo = CT_CODIGOBARRA  then result := 'Modulo de Código de Barra...' else
  if modulo = CT_GAVETA  then result := 'Modulo de Gaveta ECF...' else
  if modulo = CT_IMPDOCUMENTOS then result := 'Modulo de Impressão de Documentos...' else
  if modulo = CT_ORCAMENTOVENDA then result := 'Modulo de Orçamento de Venda...' else
  if modulo = CT_IMPORTACAOEXPORTACAO then result := 'Modulo de Importação de Exportação...' else
  if modulo = CT_SENHAGRUPO then result := 'Modulo de Senhas para Grupos de Usuários...' else
  if modulo = CT_MALACLIENTE then result := 'Modulo de Mala direta de cliente...' else
  if modulo = CT_AGENDACLIENTE then result := 'Modulo de Agenda e Histórico de Cliente...' else
  if modulo = CT_PEDIDOVENDA then result := 'Modulo de Pedido de Venda...' else
  if modulo = CT_ORDEMSERVICO then result := 'Modulo de Ordem de Serviço (OS)...' else
  if modulo = CT_INTERNET then result := 'Modulo Internet...' else
  if modulo = CT_PREVISAO then result := 'Modulo de Previsão a Pagar...' else
  if modulo = CT_INVENTARIO then result := 'Modulo de Inventário...' else
  if modulo = CT_ACADEMICO then result := 'Modulo de Academico...' else
     result := 'Verificando módulos Atuais...';
end;

{************** Inicia a atualizacao com o timer **************************** }
procedure TFConfiguraModulo.Timer1Timer(Sender: TObject);
begin
  if lista.Count > contaLista then
  begin
    AtualizaTexto('Atualizando : ' + TextoAtualizacao(Lista.Strings[contaLista]));
    AlteraCFG(Lista.Strings[contaLista]);
    RBarra.Progress := RBarra.Progress + 1;
    inc(contaLista);
    barra.Position := 0;
  end
  else
  begin
    Timer1.Interval := 0;
    Timer2.Interval := 0;
    Barra.Position := 0;
    AtualizaTexto('Atualização está completa!');
    RBarra.Progress := 0;
    cfg.Post;
    if FPrincipal.BaseDados.InTransaction then
      FPrincipal.BaseDados.Commit;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    if chamadaExterna then
      self.close;
  end;
end;

{*********** limpa a tabela do CFG Modulos *********************************** }
procedure TFConfiguraModulo.LimpaCFG;
var
  laco : integer;
begin
 CFG.edit;
  for laco :=0 to  cfg.fields.Count - 1 do
    CFG.Fields[laco].AsString := 'F';
 CFG.post;
end;


{********* altera o campos da tabela CFG Modulos *************************** }
procedure TFConfiguraModulo.AlteraCFG( texto : string );
var
  campo, dado : string;
begin
  dado := 'F';
  if texto = CT_BANCARIO then begin campo := 'FLA_BANCARIO'; dado := 'T'; end;
  if texto = CT_COMISSAO then begin campo := 'FLA_COMISSAO'; dado := 'T'; end;
  if texto = CT_CAIXA then begin campo := 'FLA_CAIXA'; dado := 'T'; end;
  if texto = CT_CONTAPAGAR then begin campo := 'FLA_CONTA_PAGAR'; dado := 'T'; end;
  if texto = CT_CONTARECEBER then begin campo := 'FLA_CONTA_RECEBER'; dado := 'T'; end;
  if texto = CT_FLUXO then begin campo := 'FLA_FLUXO'; dado := 'T'; end;
  if texto = CT_FATURAMENTO then begin campo := 'FLA_FATURAMENTO'; dado := 'T'; end;
  if texto = CT_CUSTO then begin campo := 'FLA_CUSTO'; dado := 'T'; end;
  if texto = CT_PRODUTO then begin campo := 'FLA_PRODUTO'; dado := 'T'; end;
  if texto = CT_ESTOQUE then begin campo := 'FLA_ESTOQUE'; dado := 'T'; end;
  if texto = CT_SERVICO then begin campo := 'FLA_SERVICO'; dado := 'T'; end;
  if texto = CT_NOTAFISCAL then begin campo := 'FLA_NOTA_FISCAL'; dado := 'T'; end;
  if texto = CT_TEF then begin campo := 'FLA_TEF'; dado := 'T'; end;
  if texto = CT_ECF then begin campo := 'FLA_ECF'; dado := 'T'; end;
  if texto = CT_CODIGOBARRA then begin campo := 'FLA_CODIGOBARRA'; dado := 'T'; end;
  if texto = CT_GAVETA then begin campo := 'FLA_GAVETA'; dado := 'T'; end;
  if texto = CT_IMPDOCUMENTOS then begin campo := 'FLA_IMPDOCUMENTOS'; dado := 'T'; end;
  if texto = CT_ORCAMENTOVENDA then begin campo := 'FLA_ORCAMENTOVENDA'; dado := 'T'; end;
  if texto = CT_IMPORTACAOEXPORTACAO then begin campo := 'FLA_IMP_EXP'; dado := 'T'; end;
  if texto = CT_SENHAGRUPO then begin campo := 'FLA_SENHAGRUPO'; dado := 'T'; end;
  if texto = CT_MALACLIENTE then begin campo := 'FLA_MALACLIENTE'; dado := 'T'; end;
  if texto = CT_AGENDACLIENTE then begin campo := 'FLA_AGENDACLIENTE'; dado := 'T'; end;
  if texto = CT_PEDIDOVENDA then begin campo := 'FLA_PEDIDO'; dado := 'T'; end;
  if texto = CT_ORDEMSERVICO then begin campo := 'FLA_ORDEMSERVICO'; dado := 'T'; end;
  if texto = CT_INTERNET then begin campo := 'FLA_INTERNET'; dado := 'T'; end;
  if texto = CT_PREVISAO then begin campo := 'FLA_PREVISAO'; dado := 'T'; end;
  if texto = CT_INVENTARIO then begin campo := 'FLA_INVENTARIO'; dado := 'T'; end;
  if texto = CT_PCP then begin campo := 'FLA_PCP'; dado := 'T'; end;
  if texto = CT_ACADEMICO then begin campo := 'FLA_ACADEMICO'; dado := 'T'; end;

  if dado = 'T' then
  begin
    if not (cfg.State in [ dsEdit ]) then
      cfg.Edit;
    try
      CFG.FieldByName(campo).AsString := dado;
    except
      CriaCampoAtualiza(campo,dado);
    end;
  end;
end;

{**************** altera os modulos e caso naum exista cria ****************** }
procedure TFConfiguraModulo.CriaCampoAtualiza( campo, Texto : string );
begin
  Timer1.Interval := 0;
  Atualiza.sql.clear;
  Atualiza.sql.Add(' alter table cfg_modulo ' +
                   ' add ' + campo + ' char(1) ');
  Atualiza.ExecSQL;

  cfg.post;
  cfg.close;
  FPrincipal.BaseDados.Connected := false;
  FPrincipal.BaseDados.Connected := true;
  cfg.open;
  if not (cfg.State in [ dsEdit ]) then
    cfg.Edit;
  if texto = 'T' then
    CFG.FieldByName(campo).AsString := texto
  else
    CFG.FieldByName(campo).AsString := 'F';

  Timer1.Interval := 1500;
end;

{************* atualiza os modulos do sistema ****************************** }
procedure TFConfiguraModulo.AtualizaModulos;
begin
  Contalista := 1;
  RBarra.Progress := 0;
  RBarra.MaxValue := Lista.Count - 1;
  FPrincipal.BaseDados.StartTransaction;
//  LimpaCFG;
  Timer2.Interval := 100;
  Timer1.Interval := 1500;
end;

{************* fecha o formulairo corrente ********************************** }
procedure TFConfiguraModulo.BitBtn2Click(Sender: TObject);
begin
  self.close;
end;


procedure TFConfiguraModulo.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FConfiguraModulo.HelpContext);
end;

procedure TFConfiguraModulo.Timer2Timer(Sender: TObject);
begin
  barra.Position := barra.Position + Timer2.Interval;
end;

procedure TFConfiguraModulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ ssCtrl ]) and ((key = 65) ) then
    esconde := true;
end;

procedure TFConfiguraModulo.BitBtn3Click(Sender: TObject);
begin
  if SenhaAdministrativo then
    if Confirmacao('Está operação irá desabilitar todos os modulos do sistema, deseja continuar ? ') then
       if Confirmacao('A T E N Ç Â O - após está operação o sistema só poderá ser usado com a nova liberação dos módulos, deseja continuar ' ) then
         LimpaCFG;
end;

Initialization
 RegisterClasses([TFConfiguraModulo]);
end.
