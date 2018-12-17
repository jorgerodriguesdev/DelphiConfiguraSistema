unit ACodigoBarraOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Mask, numericos, Componentes1, ExtCtrls, PainelGradiente,
  Buttons, Grids, DBGrids, Tabela, Db, DBTables, UnImpressao;

type
  TFCodigoBarraOs = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    numerico1: Tnumerico;
    numerico2: Tnumerico;
    Label1: TLabel;
    Label2: TLabel;
    BFechar: TBitBtn;
    BExemplo: TBitBtn;
    DBGridColor1: TDBGridColor;
    CAD_DOC: TSQL;
    CAD_DOCN_ALT_ETI: TFloatField;
    CAD_DOCN_ESP_VER: TFloatField;
    CAD_DOCN_ESP_HOR: TFloatField;
    CAD_DOCN_MAR_SUP: TFloatField;
    CAD_DOCN_MAR_INF: TFloatField;
    CAD_DOCN_LIN_ETI: TFloatField;
    CAD_DOCI_TAM_BAR: TFloatField;
    CAD_DOCI_NRO_DOC: TIntegerField;
    CAD_DOCC_NOM_DOC: TStringField;
    CAD_DOCC_TIP_DOC: TStringField;
    CAD_DOCD_DAT_DOC: TDateField;
    CAD_DOCN_COM_ETI: TFloatField;
    CAD_DOCN_COL_ETI: TFloatField;
    CAD_DOCN_MAR_ESQ: TFloatField;
    CAD_DOCI_ALT_BAR: TIntegerField;
    CAD_DOCI_COD_BAR: TIntegerField;
    CAD_DOCN_MAR_DIR: TFloatField;
    CAD_DOCC_IMP_COD: TStringField;
    CAD_DOCN_DIV_CUS: TFloatField;
    CAD_DOCC_CRI_DAT: TStringField;
    CAD_DOCC_FLA_COP: TStringField;
    DATA_CAD_DOC: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure BExemploClick(Sender: TObject);
  private
    imp : TFuncoesImpressao;
  public
    { Public declarations }
  end;

var
  FCodigoBarraOs: TFCodigoBarraOs;

implementation

uses APrincipal, AImprimeEtiquetaBarraOS, Constantes, ConstMsg;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFCodigoBarraOs.FormCreate(Sender: TObject);
begin
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  IMP.LocalizaTipoDocumento(CAD_DOC, 'BOS');
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFCodigoBarraOs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 imp.free;
 cad_doc.close;
 Action := CaFree;
end;


{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFCodigoBarraOs.BFecharClick(Sender: TObject);
begin
  self.close;
end;

procedure TFCodigoBarraOs.BExemploClick(Sender: TObject);
begin
  if numerico2.AValor <> 0 then
  begin
    FImprimeEtiquetaBarraOS := TFImprimeEtiquetaBarraOS.CriarSDI(application, '', true);
    FImprimeEtiquetaBarraOS.ImprimeBarra(CAD_DOCI_NRO_DOC.AsInteger,trunc(numerico1.AValor),trunc(numerico2.AValor));
    FImprimeEtiquetaBarraOS.close;
  end
  else
    Aviso('Valor Inválido');

end;

Initialization
 RegisterClasses([TFCodigoBarraOs]);
end.
