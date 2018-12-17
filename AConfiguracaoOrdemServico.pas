unit AConfiguracaoOrdemServico;
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
  TFConfiguracoesOrdemServico = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    kk0y: TPageControl;
    TabSheet2: TTabSheet;
    BBAjuda: TBitBtn;
    CFGC_USA_TER: TStringField;
    CFGI_QTD_ORS: TIntegerField;
    DBRadioGroup1: TDBRadioGroup;
    CFGL_TEX_ORS: TMemoField;
    CFGI_TIP_REL: TIntegerField;
    DBMemoColor1: TDBMemoColor;
    Label1: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBEditLocaliza3: TEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label16: TLabel;
    localiza: TConsultaPadrao;
    CFGI_REL_PED: TIntegerField;
    CFGC_INA_CLI: TStringField;
    CFGC_MOS_DES: TStringField;
    CFGN_PER_DES: TFloatField;
    CFGC_CAB_ORC: TStringField;
    CFGI_ALT_CAB: TIntegerField;
    CFGI_ALT_ROD: TIntegerField;
    CFGL_TEX_ORC: TMemoField;
    CFGC_DES_PED: TStringField;
    CFGC_DES_ORC: TStringField;
    Label5: TLabel;
    CFGI_SIT_PAD: TIntegerField;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    CFGC_INA_SER: TStringField;
    CFGC_RES_PRO: TStringField;
    CFGC_BAI_RES: TStringField;
    CFGC_NRO_EQU: TStringField;
    TabSheet1: TTabSheet;
    UsaTereceiro: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    DBCheckBox3: TDBCheckBox;
    CFGC_OBR_AVI: TStringField;
    DBCheckBox4: TDBCheckBox;
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
  FConfiguracoesOrdemServico: TFConfiguracoesOrdemServico;

implementation

uses APrincipal, funobjeto;

{$R *.DFM}

{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesOrdemServico.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   IniciallizaCheckBox([UsaTereceiro,DBCheckBox1,DBCheckBox2,DBCheckBox4,DBCheckBox3],'T','F');
   DBEditLocaliza3.Text := IntTostr(varia.TipoImpressoraOS);
   DBEditLocaliza3.atualiza;
   DBEditLocaliza1.atualiza;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesOrdemServico.FecharClick(Sender: TObject);
begin
  close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesOrdemServico.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
end;

procedure TFConfiguracoesOrdemServico.DBEditLocaliza3Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAOS',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraOS := StrtoInt(retorno1);
  end;
end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesOrdemServico]);
end.
