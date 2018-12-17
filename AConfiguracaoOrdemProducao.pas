unit AConfiguracaoOrdemProducao;
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
  TFConfiguracoesOrdemProducao = class(TFormularioPermissao)
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
    Label16: TLabel;
    localiza: TConsultaPadrao;
    Label3: TLabel;
    CFGI_OPE_PCP: TIntegerField;
    Label2: TLabel;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
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
  FConfiguracoesOrdemProducao: TFConfiguracoesOrdemProducao;

implementation

uses APrincipal, funobjeto;

{$R *.DFM}

{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesOrdemProducao.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
//   IniciallizaCheckBox([UsaTereceiro],'T','F');
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesOrdemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesOrdemProducao.FecharClick(Sender: TObject);
begin
  close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesOrdemProducao.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
end;

procedure TFConfiguracoesOrdemProducao.DBEditLocaliza3Retorno(Retorno1,
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
   RegisterClasses([TFConfiguracoesOrdemProducao]);
end.
