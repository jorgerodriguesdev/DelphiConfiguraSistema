unit AConfiguracaoPedido;
{      
    Data Criação: 01/04/1999;
          Função: configurações das variáveis do sistema
  Data Alteração: 01/04/1999;
Motivo alteração: - Adicionado os comentários e o blocos nas rotinas, e realizado
                   
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, formularios,
  BotaoCadastro, Buttons, Componentes1, constantes,
  Registry, PainelGradiente, Tabela, DBCtrls, Db, DBTables, Mask,
  Localizacao;


type
  TFConfiguracoesPedido = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    kk0y: TPageControl;
    BBAjuda: TBitBtn;
    CFGC_USA_TER: TStringField;
    CFGI_QTD_ORS: TIntegerField;
    CFGL_TEX_ORS: TMemoField;
    CFGI_TIP_REL: TIntegerField;
    localiza: TConsultaPadrao;
    TabSheet1: TTabSheet;
    DBRadioGroup3: TDBRadioGroup;
    CFGI_REL_PED: TIntegerField;
    CFGC_INA_CLI: TStringField;
    MostraCliIna: TDBCheckBox;
    CFGC_MOS_DES: TStringField;
    CFGN_PER_DES: TFloatField;
    DBEditNumerico1: TDBEditNumerico;
    Label2: TLabel;
    CFGC_CAB_ORC: TStringField;
    CFGI_ALT_CAB: TIntegerField;
    CFGI_ALT_ROD: TIntegerField;
    CFGL_TEX_ORC: TMemoField;
    CFGC_DES_PED: TStringField;
    CFGC_DES_ORC: TStringField;
    Label1: TLabel;
    DBEditLocaliza3: TEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label16: TLabel;
    DBMemoColor1: TDBMemoColor;
    Label6: TLabel;
    CFGL_TEX_PED: TMemoField;
    CFGC_VEN_PED: TStringField;
    DBEditColor1: TDBEditColor;
    Label3: TLabel;
    CFGI_PAG_PED: TIntegerField;
    CFGC_TRA_INA: TStringField;
    TraInadip: TDBCheckBox;
    TrancaVendedor: TDBCheckBox;
    DescPedido: TDBCheckBox;
    CalculaDesCli: TDBCheckBox;
    CFGC_HIS_PED: TStringField;
    HisAut: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure FecharClick(Sender: TObject);
    procedure DBEditLocaliza3Retorno(Retorno1, Retorno2: String);
  private
  public
    { Public declarations }
  end;

var
  FConfiguracoesPedido: TFConfiguracoesPedido;

implementation

uses APrincipal, funobjeto;

{$R *.DFM}

{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesPedido.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   IniciallizaCheckBox([ MostraCliIna, CalculaDesCli, DescPedido, TrancaVendedor, TraInadip,HisAut],'T','F');
   DBEditLocaliza3.Text := IntTostr(varia.TipoImpressoraPedido);
   DBEditLocaliza3.atualiza;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesPedido.FecharClick(Sender: TObject);
begin
close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesPedido.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
end;

procedure TFConfiguracoesPedido.DBEditLocaliza3Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAPEDIDO',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraPedido := StrtoInt(retorno1);
  end;
end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesPedido]);
end.
