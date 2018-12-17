unit AConfiguracaoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  formularios,  BotaoCadastro, Buttons, Componentes1, constantes,
  LabelCorMove, PainelGradiente,
  Localizacao, Db, DBTables, Mask, Tabela, DBCtrls, StdCtrls, ComCtrls,
  ExtCtrls, Grids, DBGrids, numericos;

type
  TFConfiguracoesFinanceiro = class(TFormularioPermissao)
    CFG: TTabela;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    localiza: TConsultaPadrao;
    kk0y: TPageControl;
    TabSheet7: TTabSheet;
    Label29: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEditLocaliza4: TDBEditLocaliza;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBEditLocaliza5: TDBEditLocaliza;
    DBEditNumerico7: TDBEditNumerico;
    Label52: TLabel;
    TabSheet1: TTabSheet;
    FaltaIndice: TDBCheckBox;
    DataInvalida: TDBCheckBox;
    BaixaMovbancario: TDBCheckBox;
    BaixaContasapagar: TDBCheckBox;
    BaixaParcela: TDBCheckBox;
    DataVencimento: TDBCheckBox;
    DataBaixa: TDBCheckBox;
    MultaJuro: TDBCheckBox;
    ComissaoDireta: TDBCheckBox;
    NumeroDuplicata: TDBCheckBox;
    DataComissao: TDBCheckBox;
    CapaLote: TDBCheckBox;
    PermitirParcial: TDBCheckBox;
    DespesasFixas: TDBCheckBox;
    DataCFG: TDataSource;
    CadEmpresa: TTabela;
    DataEmpresa: TDataSource;
    Aux: TQuery;
    AtualizarDespesas: TDBCheckBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    ECondPagamento: TDBEditLocaliza;
    Label3: TLabel;
    CLancaCaixa: TDBCheckBox;
    CConfirmaBancaria: TDBCheckBox;
    BBAjuda: TBitBtn;
    Label4: TLabel;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    BaixaContasAReceber: TDBCheckBox;
    NumeroDocumento: TDBCheckBox;
    EOpeBancos: TDBEditLocaliza;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    TabSheet2: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    DBEditNumerico4: TDBEditNumerico;
    DBEditNumerico5: TDBEditNumerico;
    DBEditNumerico6: TDBEditNumerico;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBGridColor1: TDBGridColor;
    DBEditColor1: TDBEditColor;
    BotaoAlterar2: TBotaoAlterar;
    BotaoGravar2: TBotaoGravar;
    BotaoCancelar2: TBotaoCancelar;
    Label20: TLabel;
    EformaPgto: TDBEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label28: TLabel;
    Label12: TLabel;
    EClienteFornecedor: TDBEditLocaliza;
    SpeedButton7: TSpeedButton;
    Label16: TLabel;
    Label8: TLabel;
    SpeedButton8: TSpeedButton;
    Label9: TLabel;
    EFormaPagamentoCarteira: TDBEditLocaliza;
    Label10: TLabel;
    DBEditLocaliza2: TDBEditLocaliza;
    SpeedButton9: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    DBEditLocaliza3: TEditLocaliza;
    SpeedButton10: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    numerico1: Tnumerico;
    PlanoAberto: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label17: TLabel;
    DBEditLocaliza6: TDBEditLocaliza;
    SpeedButton11: TSpeedButton;
    Label18: TLabel;
    DBEditNumerico1: TDBEditNumerico;
    Label19: TLabel;
    Label23: TLabel;
    DBEditLocaliza7: TDBEditLocaliza;
    SpeedButton12: TSpeedButton;
    Label24: TLabel;
    CFGN_PER_MUL: TFloatField;
    CFGN_PER_JUR: TFloatField;
    CFGN_PER_MOR: TFloatField;
    CFGC_CON_BAN: TStringField;
    CFGC_CAP_LOT: TStringField;
    CFGC_BAI_CHE: TStringField;
    CFGC_BAI_COP: TStringField;
    CFGI_CHE_PRE: TIntegerField;
    CFGC_DAT_INV: TStringField;
    CFGC_IND_MOE: TStringField;
    CFGC_PAR_ANT: TStringField;
    CFGC_DAT_BAI: TStringField;
    CFGC_DAT_VEN: TStringField;
    CFGC_JUR_ATU: TStringField;
    CFGC_COM_DIR: TStringField;
    CFGC_COM_PAR: TIntegerField;
    CFGC_NRO_DUP: TStringField;
    CFGC_PER_PAR: TStringField;
    CFGC_DAT_COM: TStringField;
    CFGC_DES_FIX: TStringField;
    CFGI_DIA_PTS: TIntegerField;
    CFGFLA_VARIOS_GERAIS: TStringField;
    CFGFLA_LOG_DIRETO: TStringField;
    CFGVAL_TOLERANCIA: TFloatField;
    CFGCOD_OPERACAO_PADRAO_RECEBER: TIntegerField;
    CFGCOD_OPERACAO_PADRAO_PAGAR: TIntegerField;
    CFGD_ATU_DES: TDateTimeField;
    CFGC_FLA_ATD: TStringField;
    CFGI_COD_PAG: TIntegerField;
    CFGC_FLA_BAN: TStringField;
    CFGC_FLA_CAX: TStringField;
    CFGI_SIT_FIN: TIntegerField;
    CFGC_BAI_COR: TStringField;
    CFGC_NRO_DOC: TStringField;
    CFGC_OPE_BAN: TStringField;
    CFGC_CON_GER: TStringField;
    CFGI_FRM_PAD: TIntegerField;
    CFGi_ser_tes: TIntegerField;
    CFGI_CLI_BAN: TIntegerField;
    CFGC_SEN_CAI: TStringField;
    CFGC_SEN_ALT: TStringField;
    CFGC_SEN_EST: TStringField;
    CFGC_PAR_DAT: TStringField;
    CFGC_ITE_DAT: TStringField;
    CFGI_FRM_CAR: TIntegerField;
    CFGC_OPE_HOM: TStringField;
    CFGC_SEN_TRA: TStringField;
    CFGC_PLA_ABE: TStringField;
    CFGC_RET_MES: TStringField;
    CFGI_PAG_COM: TIntegerField;
    CFGI_COM_PRO: TIntegerField;
    CFGI_COM_SER: TIntegerField;
    CFGI_COM_PAD: TIntegerField;
    CFGI_TIP_CAL: TIntegerField;
    CFGI_TIP_MET: TIntegerField;
    CFGN_DES_PAR: TFloatField;
    CFGI_MET_ATU: TIntegerField;
    CFGC_OPE_COB: TStringField;
    CFGC_ALT_DAT: TStringField;
    CFGC_MAI_VEN: TStringField;
    CFGI_CAI_COP: TIntegerField;
    CFGI_CAI_COR: TIntegerField;
    CFGI_IMP_AUT: TIntegerField;
    CFGI_MOD_AUT: TIntegerField;
    CFGC_FON_NEG: TStringField;
    CFGC_FON_ITA: TStringField;
    CFGC_FON_SUB: TStringField;
    CFGC_FON_EXP: TStringField;
    CFGI_NUM_AUT: TIntegerField;
    CFGI_FLA_COM: TIntegerField;
    CFGC_CAI_COP: TStringField;
    CFGC_CAI_COR: TStringField;
    CFGI_FRM_BAN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure FecharClick(Sender: TObject);
    procedure CFGAfterScroll(DataSet: TDataSet);
    procedure DBEditColor1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditColor1Exit(Sender: TObject);
    procedure CadEmpresaAfterEdit(DataSet: TDataSet);
    procedure CadEmpresaAfterCancel(DataSet: TDataSet);
    procedure ECondPagamentoSelect(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure DBEditNumerico5Exit(Sender: TObject);
    procedure DBEditNumerico6Exit(Sender: TObject);
    procedure DBEditLocaliza3Retorno(Retorno1, Retorno2: String);
    procedure numerico1Exit(Sender: TObject);
  
  private
      procedure AtualizaLocalizas;
  public
    { Public declarations }
  end;

var
  FConfiguracoesFinanceiro: TFConfiguracoesFinanceiro;

implementation

uses APrincipal, funObjeto, funsql, constmsg, FUNDATA, Registry;

{$R *.DFM}

{ ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesFinanceiro.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Path e o nome do arquivo de Help
   CFG.open;
   CadEmpresa.open;
   IniciallizaCheckBox([faltaIndice, dataInvalida,
                        BaixaPArcela, DataVencimento, DataBaixa,
                        capaLote, BaixaMovbancario, BaixaContasapagar, MultaJuro,
                        ComissaoDireta, NumeroDuplicata, PermitirParcial,
                        DataComissao, DespesasFixas, AtualizarDespesas,
                        CLancaCaixa, CConfirmaBancaria, BaixaContasAReceber, NumeroDocumento,
                        PlanoAberto,DBCheckBox1], 'T', 'F');
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FechaTabela(CFG);
    FechaTabela(cadempresa);
    Action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesFinanceiro.FecharClick(Sender: TObject);
begin
  Close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesFinanceiro.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
   FPrincipal.AlteraNomeEmpresa;
end;


{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Financeiro
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************************Atualiza os localizas*******************************}
procedure TFConfiguracoesFinanceiro.AtualizaLocalizas;
begin
   DBEditLocaliza4.Atualiza;
   DBEditLocaliza5.Atualiza;
   DBEditLocaliza1.Atualiza;
   ECondPagamento.Atualiza;
   EOpeBancos.Atualiza;
   EformaPgto.Atualiza;
   EClienteFornecedor.atualiza;
   EFormaPagamentoCarteira.Atualiza;
   DBEditLocaliza2.Atualiza;
   DBEditLocaliza3.Text := inttostr(varia.TipoImpressoraFicha);
   DBEditLocaliza3.Atualiza;
   numerico1.avalor := varia.LinhasBrancoFicha;
   DBEditLocaliza6.Atualiza;
   DBEditLocaliza7.Atualiza;
end;

{*****************Chama a rotina para atualizar os localizas*******************}
procedure TFConfiguracoesFinanceiro.CFGAfterScroll(DataSet: TDataSet);
begin
   AtualizaLocalizas;
end;


procedure TFConfiguracoesFinanceiro.DBEditColor1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key in [ #46, #57, #8]) then
   begin
      if ((sender as TDBEditColor).Text <> '') then
      begin
         if ((sender as TDBEditColor).Text[Length((sender as TDBEditColor).Text)] = '.') and (Key = '.') then
           key := #;
      end
      else
        if ((sender as TDBEditColor).Text = '') and (Key = '.') then
          key := #;
   end
   else
       key := #;
end;

procedure TFConfiguracoesFinanceiro.DBEditColor1Exit(Sender: TObject);
begin
   if (sender as TDBEditColor).Text <> '' then
   if ((sender as TDBEditColor).Text[Length((sender as TDBEditColor).Text)] = '.') then
     (sender as TDBEditColor).Field.Value := copy((sender as TDBEditColor).Text,0, Length((sender as TDBEditColor).Text)-1);
end;

procedure TFConfiguracoesFinanceiro.CadEmpresaAfterEdit(DataSet: TDataSet);
begin
   Aux.close;
   Aux.SQL.Clear;
   Aux.SQL.Add('Select * from Cad_Plano_Conta where i_cod_emp = ' + cadempresa.fieldByName('I_COD_EMP').AsString);
   Aux.open;
   if aux.EOF then
   begin
      AlterarVisible([BotaoAlterar1,BotaoGravar1,BotaoCancelar1, Fechar]);
      DBEditColor1.SetFocus;
   end
   else
   begin
    Aviso(CT_ClassificacaoDados);
    CadEmpresa.cancel;
  end;
end;

procedure TFConfiguracoesFinanceiro.CadEmpresaAfterCancel(
  DataSet: TDataSet);
begin
if not BotaoAlterar1.Visible then
  AlterarVisible([BotaoAlterar1,BotaoGravar1,BotaoCancelar1, Fechar]);
end;

procedure TFConfiguracoesFinanceiro.ECondPagamentoSelect(Sender: TObject);
begin
  ECondPagamento.ASelectValida.Clear;
  ECondPagamento.ASelectValida.Add(' select I_Cod_Pag, C_Nom_Pag, I_Qtd_Par From CadCondicoesPagto ' +
                                   ' where I_Cod_Pag = @ and D_VAL_CON > ''' + DataToStrFormato(AAAAMMDD,date,'/') + '''' );
  ECondPagamento.ASelectLocaliza.Clear;
  ECondPagamento.ASelectLocaliza.add(' select I_Cod_Pag, C_Nom_Pag, I_Qtd_Par From CadCondicoesPagto ' +
                                     ' where c_Nom_Pag like ''@%'' and D_VAL_CON > ''' + DataToStrFormato(AAAAMMDD,date,'/') + '''' +
                                     ' order by c_Nom_Pag asc');
end;

procedure TFConfiguracoesFinanceiro.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguracoesFinanceiro.HelpContext);
end;

procedure TFConfiguracoesFinanceiro.DBEditNumerico5Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
    if CFGN_PER_MOr.AsCurrency <> 0 then
      CFGN_PER_JUR.AsCurrency := 0;
end;

procedure TFConfiguracoesFinanceiro.DBEditNumerico6Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
    if CFGN_PER_JUR.AsCurrency <> 0 then
      CFGN_PER_MOR.AsCurrency := 0;
end;

procedure TFConfiguracoesFinanceiro.DBEditLocaliza3Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAFICHA',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraFicha := StrtoInt(retorno1);
  end;
end;

procedure TFConfiguracoesFinanceiro.numerico1Exit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteInteger('IMPRESSORA','LINHASBRACOFICHA',trunc(numerico1.avalor));
  ini.free;
  varia.LinhasBrancoFicha := trunc(numerico1.avalor);
end;



Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesFinanceiro]);
end.
