unit AConfiguracaoComissoes;
{          Autor: Enezilda Guesser
    Data Criação: 15/08/2001;
          Função: configurações das variáveis da comissao
  Data Alteração:
    Alterado por:
Motivo alteração: -
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  formularios,  BotaoCadastro, Buttons, Componentes1, constantes,
  LabelCorMove, PainelGradiente,
  Localizacao, Db, DBTables, Mask, Tabela, DBCtrls, StdCtrls, ComCtrls,
  ExtCtrls, Grids, DBGrids, numericos;

type
  TFConfiguracaoComissoes = class(TFormularioPermissao)
    CFG: TTabela;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    localiza: TConsultaPadrao;
    DataCFG: TDataSource;
    CadEmpresa: TTabela;
    DataEmpresa: TDataSource;
    Aux: TQuery;
    BBAjuda: TBitBtn;
    kk0y: TPageControl;
    TabSheet7: TTabSheet;
    Tipos: TDBRadioGroup;
    RComPro: TDBRadioGroup;
    RComSer: TDBRadioGroup;
    TabSheet3: TTabSheet;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    CFGC_COM_PAR: TIntegerField;
    CFGI_PAG_COM: TIntegerField;
    CFGI_COM_PRO: TIntegerField;
    CFGI_COM_SER: TIntegerField;
    CFGI_COM_PAD: TIntegerField;
    PainelMeta: TPanel;
    Label29: TLabel;
    SpeedButton4: TSpeedButton;
    Label38: TLabel;
    CadFiliais: TTabela;
    DataCadFiliais: TDataSource;
    DBRadioGroup2: TDBRadioGroup;
    CFGI_TIP_CAL: TIntegerField;
    emeta: TEditLocaliza;
    TipoMeta: TDBRadioGroup;
    CFGI_TIP_MET: TIntegerField;
    metaatual: TDBRadioGroup;
    CFGI_MET_ATU: TIntegerField;
    maisvendedores: TDBCheckBox;
    alteravencimento: TDBCheckBox;
    CFGC_ALT_DAT: TStringField;
    CFGC_MAI_VEN: TStringField;
    DBRadioGroup4: TDBRadioGroup;
    CFGI_FLA_COM: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure FecharClick(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure RComProChange(Sender: TObject);
    procedure emetaRetorno(Retorno1, Retorno2: String);
    procedure CFGAfterCancel(DataSet: TDataSet);
    procedure TipoMetaClick(Sender: TObject);
    procedure CFGBeforePost(DataSet: TDataSet);
    procedure TipoMetaChange(Sender: TObject);
    
 
  private

  public
    { Public declarations }

  end;

var
  FConfiguracaoComissoes: TFConfiguracaoComissoes;

implementation

uses APrincipal, funObjeto, funsql, constmsg, FUNDATA, Registry;

{$R *.DFM}

{ ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracaoComissoes.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Path e o nome do arquivo de Help
   CFG.open;
   CadEmpresa.open;
   CadFiliais.open;

   IniciallizaCheckBox([maisvendedores, alteravencimento], 'T', 'F');
   
   if tipoMeta.ItemIndex = 0 then
    begin
      metaatual.Enabled := true;
      painelmeta.enabled := true;
      if not cadfiliais.fieldbyname('i_cod_met').isnull then
       begin
         emeta.Text := inttostr(cadfiliais.fieldbyname('i_cod_met').asinteger);
         emeta.Atualiza;
       end;
    end
   else
     begin
       metaatual.Enabled := true; 
       painelmeta.enabled := false;
       label29.Enabled := false;
     end;
end;


{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracaoComissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FechaTabela(CFG);
    FechaTabela(cadempresa);
    FechaTabela(cadfiliais);
    Action := cafree;
end;

{ ******************** fecha o formulario ************************************ }
procedure TFConfiguracaoComissoes.FecharClick(Sender: TObject);
begin
  Close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracaoComissoes.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
   FPrincipal.AlteraNomeEmpresa;
end;


{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Comissoes
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


procedure TFConfiguracaoComissoes.BBAjudaClick(Sender: TObject);
begin
 // Application.HelpCommand(HELP_CONTEXT,FConfiguracoesFinanceiro.HelpContext);
end;

{******************* selecionar a comissao do produto *************************}
procedure TFConfiguracaoComissoes.RComProChange(Sender: TObject);
begin
  if RComPro.ItemIndex in [ 0, 1, 2, 3 ] then
  begin
    RComSer.ItemIndex := 2;
    RComSer.Enabled := false;
  end
  else
    RComSer.Enabled := true;
end;

{*********************** Retorno da meta *************************************}
procedure TFConfiguracaoComissoes.emetaRetorno(Retorno1, Retorno2: String);
begin
  if emeta.text <> '' then
     executaComandoSQL(Aux,' update cadfiliais' +
                            ' set i_cod_met = ' + emeta.text +
                            ' where i_emp_fil = ' + inttostr(varia.codigoempfil))
  else
     executaComandoSQL(Aux,' update cadfiliais' +
                           ' set i_cod_met = null' +
                           ' where i_emp_fil = ' + inttostr(varia.codigoempfil));
end;

{********************** Apos Cancelar *****************************************}
procedure TFConfiguracaoComissoes.CFGAfterCancel(DataSet: TDataSet);
begin
  if not BotaoAlterar1.Visible then
   AlterarVisible([BotaoAlterar1,BotaoGravar1,BotaoCancelar1, Fechar]);
end;

{********************* Escolher o tipo de meta padrao ************************}
procedure TFConfiguracaoComissoes.TipoMetaClick(Sender: TObject);
begin
   if tipoMeta.ItemIndex = 0 then
    begin
      painelmeta.enabled := true;
      label29.Enabled := true;
      metaatual.Enabled := true;
    end
   else
     begin
      metaatual.Enabled := true;
      emeta.text := '';
      label38.Caption := '';
      painelmeta.enabled := false;
      label29.enabled := false;
      executacomandosql(Aux, ' update cadfiliais'+
                             ' set i_cod_met = null '+
                             ' where i_emp_fil = ' + inttostr(varia.codigoempfil));
     end;
end;


procedure TFConfiguracaoComissoes.CFGBeforePost(DataSet: TDataSet);
begin
  if (tipometa.itemindex = 0) and (emeta.text = '') then
    begin
      aviso('Deve ser informada a Meta Ativa');
      abort;
    end;
end;

procedure TFConfiguracaoComissoes.TipoMetaChange(Sender: TObject);
begin
  if tipometa.itemindex = 2 then
    metaatual.enabled := false
  else
    metaatual.enabled := true;  
end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracaoComissoes]);

end.
