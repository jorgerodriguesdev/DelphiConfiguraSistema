unit AConfiguracaoInternet;
{          Autor: Sergio Luiz Censi
    Data Criação: 01/04/1999;
          Função: configurações das variáveis do sistema
  Data Alteração: 01/04/1999;
Motivo alteração: - Adicionado os comentários e o blocos nas rotinas, e realizado
                    um teste - 01/04/199 /
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, formularios, constMsg, DBCtrls, Tabela,
  Mask, Db, DBTables, BotaoCadastro, Buttons, Componentes1, constantes,
  ColorGrd, LabelCorMove, Grids, DBGrids, Registry, PainelGradiente,
  FileCtrl,printers, Localizacao, numericos;

type
  TFConfiguracaoInternet = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    localiza: TConsultaPadrao;
    kk0y: TPageControl;
    BBAjuda: TBitBtn;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FecharClick(Sender: TObject);
  private
      ini : TRegIniFile;
  public
    { Public declarations }
  end;

var
  FConfiguracaoInternet: TFConfiguracaoInternet;

implementation

uses APrincipal, FunValida, FunSql, funobjeto;

{$R *.DFM}

{ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                            Modulo Básico
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracaoInternet.FormCreate(Sender: TObject);
begin
   ini := TRegIniFile.Create('Software\Systec\Sistema');
   CFG.open;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracaoInternet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CFG.close;
  ini.free;
  Action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracaoInternet.FecharClick(Sender: TObject);
begin
  Close;
end;


Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracaoInternet]);
end.
