unit AConfiguracaoInternet;
{          Autor: Sergio Luiz Censi
    Data Cria��o: 01/04/1999;
          Fun��o: configura��es das vari�veis do sistema
  Data Altera��o: 01/04/1999;
Motivo altera��o: - Adicionado os coment�rios e o blocos nas rotinas, e realizado
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
                            Modulo B�sico
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracaoInternet.FormCreate(Sender: TObject);
begin
   ini := TRegIniFile.Create('Software\Systec\Sistema');
   CFG.open;
end;

{ ******************* No fechamento do formul�rio **************************** }
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
