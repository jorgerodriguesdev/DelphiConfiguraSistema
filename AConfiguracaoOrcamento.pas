unit AConfiguracaoOrcamento;
{          Autor: Sergio Luiz Censi
    Data Criação: 01/04/1999;
          Função: configurações das variáveis do sistema
  Data Alteração: 01/04/1999;
Motivo alteração: - Adicionado os comentários e o blocos nas rotinas, e realizado
                    um teste - 01/04/199 / Rafael Budag
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, formularios,
  BotaoCadastro, Buttons, Componentes1, constantes,
  Registry, PainelGradiente, Tabela, DBCtrls, Db, DBTables, Mask,
  Localizacao;


type
  TFConfiguracoesOrcamento = class(TFormularioPermissao)
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
    CFGI_REL_PED: TIntegerField;
    CFGC_INA_CLI: TStringField;
    CFGC_MOS_DES: TStringField;
    CFGN_PER_DES: TFloatField;
    Cotacao: TTabSheet;
    CFGC_CAB_ORC: TStringField;
    CFGI_ALT_CAB: TIntegerField;
    CFGI_ALT_ROD: TIntegerField;
    CMostraTituloEmpresa: TDBCheckBox;
    Label3: TLabel;
    DBEditNumerico2: TDBEditNumerico;
    Label4: TLabel;
    DBEditNumerico3: TDBEditNumerico;
    CFGL_TEX_ORC: TMemoField;
    CFGC_DES_PED: TStringField;
    CFGC_DES_ORC: TStringField;
    DBMemoColor2: TDBMemoColor;
    Label6: TLabel;
    DescOrcamento: TDBCheckBox;
    TrancaVendedor: TDBCheckBox;
    CFGC_VEN_ORC: TStringField;
    DBRadioGroup3: TDBRadioGroup;
    Label1: TLabel;
    DBEditColor1: TDBEditColor;
    CFGI_PAG_PED: TIntegerField;
    CFGI_PAG_ORC: TIntegerField;
    CFGI_IMP_ORC: TIntegerField;
    Label2: TLabel;
    DBEditLocaliza3: TEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label16: TLabel;
    ProKit: TDBCheckBox;
    CFGC_KIT_ORC: TStringField;
    CFGI_SIT_ORC: TIntegerField;
    Label5: TLabel;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    CFGC_ADI_OBS: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    CFGC_VAL_ORC: TStringField;
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
  FConfiguracoesOrcamento: TFConfiguracoesOrcamento;

implementation

uses APrincipal, funobjeto;

{$R *.DFM}

{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesOrcamento.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   IniciallizaCheckBox([CMostraTituloEmpresa, DescOrcamento, TrancaVendedor,
                        ProKit, DBCheckBox1, DBCheckBox2],'T','F');
   DBEditLocaliza3.Text := IntTostr(varia.TipoImpressoraOrcamento);
   DBEditLocaliza3.atualiza;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesOrcamento.FecharClick(Sender: TObject);
begin
close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesOrcamento.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
end;

procedure TFConfiguracoesOrcamento.DBEditLocaliza3Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAORCAMENTO',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraOrcamento := StrtoInt(retorno1);
  end;

end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesOrcamento]);
end.
