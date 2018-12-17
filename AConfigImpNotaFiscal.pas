unit AConfigImpNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, ComCtrls, StdCtrls, Buttons, Componentes1,
  Mask, numericos, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation,
  DBCtrls, BotaoCadastro, UnImpressao, ConfigImpressora, Geradores,
  Localizacao;

type
  TFConfigImpNotaFiscal = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    DocPage: TPageControl;
    CAD_DOC: TSQL;
    DATA_CAD_DOC: TDataSource;
    CAD_DOCI_NRO_DOC: TIntegerField;
    CAD_DOCC_NOM_DOC: TStringField;
    CAD_DOCC_TIP_DOC: TStringField;
    CAD_DOCD_DAT_DOC: TDateField;
    CAD_DOCN_ROD_DOC: TFloatField;
    MOV_DOC: TQuery;
    DATA_MOV_DOC: TDataSource;
    MOV_DOCI_NRO_DOC: TIntegerField;
    MOV_DOCI_MOV_SEQ: TIntegerField;
    MOV_DOCN_POS_HOR: TFloatField;
    MOV_DOCN_POS_VER: TFloatField;
    MOV_DOCC_FLA_IMP: TStringField;
    MOV_DOCC_DES_CAM: TStringField;
    MOV_DOCC_DIR_ESQ: TStringField;
    CAD_DOCC_CHR_DIR: TStringField;
    CAD_DOCC_CHR_ESQ: TStringField;
    CAD_DOCN_CAB_PAG: TFloatField;
    CAD_DOCI_QTD_PAG: TIntegerField;
    MOV_DOCI_TAM_CAM: TIntegerField;
    CAD_DOCI_SEQ_IMP: TIntegerField;
    ProximoCodigoDocumento: TProximoCodigo;
    CAD_DOCC_FLA_EXT: TStringField;
    MOV_DOCC_FLA_NEG: TStringField;
    MOV_DOCC_FLA_ITA: TStringField;
    MOV_DOCC_FLA_CND: TStringField;
    MOV_DOCC_FLA_RED: TStringField;
    CAD_DOCC_FLA_LIN: TStringField;
    CAD_DOCC_FLA_PAP: TStringField;
    CAD_DOCC_FLA_COP: TStringField;
    Label35: TLabel;
    PanelColor4: TPanelColor;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    GMov: TGridIndice;
    ERodDoc: TDBEditColor;
    ECabPag: TDBEditColor;
    GDoc: TGridIndice;
    PanelColor2: TPanelColor;
    BFechar: TBitBtn;
    BCadastrar: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BExemplo: TBitBtn;
    BBAjuda: TBitBtn;
    BitBtn5: TBitBtn;
    CPadrao: TDBLookupComboBoxColor;
    DBRadioGroup1: TDBRadioGroup;
    CAD_DRIVER_AUX: TQuery;
    DATACAD_DRIVER_AUX: TDataSource;
    CAD_DOCI_QTD_LIN: TIntegerField;
    CAD_DOCI_QTD_FAT: TIntegerField;
    Label5: TLabel;
    DBEditColor2: TDBEditColor;
    Label7: TLabel;
    DBEditColor3: TDBEditColor;
    BitBtn2: TBitBtn;
    AUX: TQuery;
    CAD_DOCC_FLA_MAT: TStringField;
    CAD_DOCN_MRG_ESQ: TFloatField;
    PTempo: TPainelTempo;
    Label4: TLabel;
    DBEditColor4: TDBEditColor;
    CAD_DOCI_QTD_COL: TIntegerField;
    RNota: TRadioButton;
    RServ: TRadioButton;
    Label6: TLabel;
    DBEditColor1: TDBEditColor;
    Label8: TLabel;
    DBEditColor5: TDBEditColor;
    CAD_DOCI_QTD_ADI: TIntegerField;
    CAD_DOCI_QTD_SER: TIntegerField;
    ETeste: TEditColor;
    Label9: TLabel;
    ComboBoxColor1: TComboBoxColor;
    Label10: TLabel;
    CAD_DOCI_TAM_BAR: TFloatField;
    BitBtn6: TBitBtn;
    MOV_DOCD_ULT_ALT: TDateField;
    CheckBox1: TDBCheckBox;
    CheckBox2: TDBCheckBox;
    CheckBox3: TDBCheckBox;
    CAD_DOCN_MAR_ESQ: TFloatField;
    CAD_DOCN_MAR_SUP: TFloatField;
    CAD_DOCN_MAR_INF: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure CAD_DOCAfterInsert(DataSet: TDataSet);
    procedure CAD_DOCBeforePost(DataSet: TDataSet);
    procedure CAD_DOCAfterPost(DataSet: TDataSet);
    procedure CAD_DOCAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BCadastrarClick(Sender: TObject);
    procedure CAD_DOCBeforeEdit(DataSet: TDataSet);
    procedure SetText_SN(Sender: TField; const Text: String);
    procedure MOV_DOCBeforeInsert(DataSet: TDataSet);
    procedure MOV_DOCBeforeDelete(DataSet: TDataSet);
    procedure BExemploClick(Sender: TObject);
    procedure SetText_DE(Sender: TField; const Text: String);
    procedure Negativo_keyPress(Sender: TObject; var Key: Char);
    procedure MOV_DOCBeforePost(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RNotaClick(Sender: TObject);
    procedure DBEditColor2Exit(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure ComboBoxColor1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    IMP : TFuncoesImpressao;
    procedure InicializaItens(NroDoc: Integer; atualizar : Boolean);
    procedure MudaEstado( acao : Boolean );
  public
    { Public declarations }
  end;

var
  FConfigImpNotaFiscal: TFConfigImpNotaFiscal;

implementation

uses APrincipal, Constantes, FunSql, ConstMsg, FunString, UnClassesImprimir, funobjeto;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConfigImpNotaFiscal.FormCreate(Sender: TObject);
begin
  IniciallizaCheckBox( [CheckBox1,CheckBox2,CheckBox3],'1','0');
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  IMP.LocalizaTipoDocumento(CAD_DOC, 'NFP');
  AdicionaSQLAbreTabela(CAD_DRIVER_AUX, ' SELECT * FROM CAD_DRIVER ' + ' WHERE I_COD_DRV IS NULL '); // Somente Impresoras.
  CPadrao.KeyValue := CAD_DRIVER_AUX.FieldByName('I_SEQ_IMP').AsInteger;
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  RServ.Enabled := ConfigModulos.Servico;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfigImpNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FPrincipal.BaseDados.InTransaction then
  begin
    if Confirmacao('Deseja gravar as alterações efetuadas ?') then
      FPrincipal.BaseDados.Commit
    else
      FPrincipal.BaseDados.Rollback;
  end;
  IMP.free;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                            Codigo de Barra
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

procedure TFConfigImpNotaFiscal.BFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFConfigImpNotaFiscal.CAD_DOCAfterInsert(DataSet: TDataSet);
begin
  ProximoCodigoDocumento.Execute('CAD_DOC') ;
  CAD_DOCC_CHR_ESQ.AsString := '('; // Caracter Direita.
  CAD_DOCC_CHR_DIR.AsString := ')'; // Caracter Esquerda.
  CAD_DOCC_FLA_PAP.AsString := 'S'; // Detecção de papel ativada.
  CAD_DOCC_FLA_LIN.AsString := 'N'; // linha reduzida.
  CAD_DOCC_FLA_PAP.AsString := 'N'; // Normal.
  CAD_DOCC_FLA_EXT.AsString := 'N'; // Mês Extenso.
  CAD_DOCC_FLA_COP.AsString := 'N'; // Documento original.
  CAD_DOCD_DAT_DOC.AsDateTime := Date;
  CAD_DOCN_CAB_PAG.AsFloat := 0;
  CAD_DOCN_ROD_DOC.AsFloat := 0;
  CAD_DOCI_QTD_PAG.AsInteger := 1;
  CAD_DOCI_QTD_LIN.AsInteger := 15;
  CAD_DOCI_QTD_COL.AsInteger := 2;
  CAD_DOCI_QTD_FAT.AsInteger := 3;
  CAD_DOCI_QTD_ADI.AsInteger := 5;
  CAD_DOCI_QTD_SER.AsInteger := 3;
  ComboBoxColor1.ItemIndex := 0;
end;

procedure TFConfigImpNotaFiscal.InicializaItens(NroDoc: Integer; atualizar : Boolean);
var
  diminui : Integer;
begin
   if RServ.Checked then
     diminui := 0
   else
    diminui :=  7;
            //             N col   lin   tam
  IMP.InsereMovDoc(NroDoc, 01, 75,  002,  08, 'S', 'Número da Nota Fiscal', 'E', 'N', 'S', atualizar );
  IMP.InsereMovDoc(NroDoc, 02, 62,  002,  01, 'S', 'X do Campo de Entrada', 'E', 'N', 'N' , atualizar);
  IMP.InsereMovDoc(NroDoc, 03, 54,  002,  01, 'S', 'X do Campo de Saída', 'E', 'N', 'N' , atualizar);
  IMP.InsereMovDoc(NroDoc, 04, 05,  009,  40, 'S', 'Natureza da Operação', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 05, 54,  009,  05, 'S', 'CFOP', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 06, 70,  009,  20, 'N', 'Inscrição Estadual do Subst. Tributário', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 07, 05,  013,  60, 'S', 'Nome / Razão Social', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 08, 107, 013,  20, 'S', 'CGC / CPF', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 09, 147, 013,  10, 'S', 'Data de Emissão da Nota Fiscal', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 10, 05,  015,  50, 'S', 'Endereço', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 11, 85,  015,  30, 'S', 'Bairro / Distrito', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 12, 125, 015,  10, 'S', 'CEP', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 13, 147, 015,  10, 'S', 'Data da Saída / Entrada', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 14, 05,  018,  30, 'S', 'Município', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 15, 75,  018,  22, 'S', 'Fone / FAX', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 16, 101, 018,  02, 'S', 'UF', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 17, 115, 018,  15, 'S', 'Inscrição Estadual', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 18, 149, 018,  05, 'S', 'Hora de Saída', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 19, 35,  061 - diminui ,  15, 'S', 'Base de Cálculo do ICMS', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 20, 62,  061 - diminui ,  15, 'S', 'Valor do ICMS', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 21, 70,  061 - diminui ,  15, 'N', 'Base de Cálculo do ICMS Substituição', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 22, 120, 061 - diminui ,  15, 'N', 'Valor ICMS Substituição', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 23, 155, 061 - diminui ,  15, 'S', 'Valor Total dos Produtos', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 24, 35,  063 - diminui ,  15, 'S', 'Valor do Frete', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 25, 62,  063 - diminui ,  15, 'S', 'Valor do Seguro', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 26, 90,  063 - diminui ,  15, 'S', 'Outras Despesas Acessórias', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 27, 87,  058 - diminui ,  15, 'N', 'Valor Total do IPI', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 28, 158, 063 - diminui ,  15, 'S', 'Valor Total da Nota Fiscal', 'D', 'S', 'S', atualizar);

  If RServ.Checked then
  begin
    IMP.InsereMovDoc(NroDoc, 29, 150, 055, 15, 'S', 'Nota com Serviços - Valor do ISSQN', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 30, 155, 057, 15, 'S', 'Nota com Serviços - Valor Total dos Serviços', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 75, 020, 054, 60, 'S', 'Serviços - Descrição dos serviços da Nota Fiscal.', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 77, 005, 054, 15, 'S', 'Código do Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 78, 060, 054, 02, 'S', 'Unidade do Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 79, 090, 054, 15, 'S', 'Quantidade Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 80, 115, 054, 15, 'S', 'Valor do Serviço', 'D', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 81, 130, 054, 15, 'S', 'Valor Total do Serviço', 'D', 'S', 'S', atualizar);
  end
  else
  begin
    IMP.InsereMovDoc(NroDoc, 29, 00, 100, 00, 'N', 'Valor do ISSQN', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 30, 00, 100, 00, 'N', 'Valor Total dos Serviços', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 75, 00, 100, 00, 'N', 'Serviços - Descrição dos serviços da Nota Fiscal.', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 77, 00, 100, 15, 'N', 'Código do Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 78, 00, 100, 02, 'N', 'Unidade do Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 79, 00, 100, 15, 'N', 'Quantidade Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 80, 115,100, 15, 'N', 'Valor do Serviço', 'E', 'S', 'S', atualizar);
    IMP.InsereMovDoc(NroDoc, 81, 130, 100, 15, 'N', 'Valor Total do Serviço', 'E', 'S', 'S', atualizar);
 end;

  IMP.InsereMovDoc(NroDoc, 31, 05,  067 - diminui ,  50, 'S', 'Nome da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 32, 98,  067 - diminui ,  01, 'S', 'Frete por Conta 1/2', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 33, 103, 067 - diminui ,  10, 'S', 'Placa do Veículo da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 34, 122, 067 - diminui ,  02, 'S', 'UF da Trasportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 35, 130, 067 - diminui ,  15, 'S', 'CGC/ CPF da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 36, 05,  070 - diminui ,  30, 'S', 'Endereço da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 37, 85,  070 - diminui ,  30, 'S', 'Município da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 38, 122, 070 - diminui ,  02, 'S', 'UF do Endereço da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 39, 130, 070 - diminui ,  15, 'S', 'Inscrição Estadual da Transportadora', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 40, 05,  073 - diminui ,  15, 'S', 'Quantidade de Produtos', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 41, 30,  073 - diminui ,  15, 'S', 'Espécie', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 42, 60,  073 - diminui ,  15, 'S', 'Marca', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 43, 85,  073 - diminui ,  15, 'S', 'Número', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 44, 125, 073 - diminui ,  15, 'S', 'Peso Bruto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 45, 145, 073 - diminui ,  15, 'S', 'Peso Líquido', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 46, 10,  076 - diminui ,  30, 'S', 'Condição de Pagamento', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 47, 10,  077 - diminui ,  30, 'S', 'Nome do Vendedor', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 48, 10,  077 - diminui ,  30, 'S', 'Classificação Fiscal', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 49, 04,  029,  10, 'S', 'Coluna - Código', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 50, 17,  029,  50, 'S', 'Coluna - Descrição do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 51, 93,  029,  03, 'S', 'Coluna - Classificação Fiscal do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 52, 64,  029,  03, 'S', 'Coluna - Situação Tributaria do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 53, 100, 029,  03, 'S', 'Coluna - Unidade de Medida do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 54, 111, 029,  10, 'S', 'Coluna - Quantidade do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 55, 138, 029,  15, 'S', 'Coluna - Valor Unitário do Produto', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 56, 156, 029,  15, 'S', 'Coluna - Valor Total do Produto', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 57, 160, 029,  02, 'S', 'Coluna - Perdentual de ICMS do Produto', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 58, 128, 029,  02, 'S', 'Coluna - Percentual de IPI do Produto', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 59, 138, 029,  10, 'S', 'Coluna - Produto_Valor_IPI', 'D', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 60, 05,  078 - diminui ,  50, 'S', 'Coluna - Dados_Adicionais', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 61, 05,  022,  15, 'S', 'Fatura 1 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 62, 30,  022,  10, 'S', 'Fatura 1 - Vencimento da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 63, 55,  022,  20, 'S', 'Fatura 1 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 64, 85,  022,  15, 'S', 'Fatura 2 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 65, 110, 022,  10, 'S', 'Fatura 2 - Vencimento da Fatura,', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 66, 133, 022,  20, 'S', 'Fatura 2 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 67, 97,  024,  15, 'S', 'Fatura 3 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 68, 109, 024,  10, 'S', 'Fatura 3 - Vencimento da Fatura,', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 69, 125, 024,  20, 'S', 'Fatura 3 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 70, 140, 024,  15, 'N', 'Fatura 4 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 71, 150, 024,  10, 'N', 'Fatura 4 - Vencimento da Fatura,', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 72, 160, 024,  20, 'N', 'Fatura 4 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 82, 140, 024,  15, 'N', 'Fatura 5 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 83, 150, 024,  10, 'N', 'Fatura 5 - Vencimento da Fatura,', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 84, 160, 024,  20, 'N', 'Fatura 5 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 85, 140, 024,  15, 'N', 'Fatura 6 - Número da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 86, 150, 024,  10, 'N', 'Fatura 6 - Vencimento da Fatura,', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 87, 160, 024,  20, 'N', 'Fatura 6 - Valor da Fatura', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 73, 142, 089 - diminui ,  08, 'S', 'Número do Rodapé da Nota Fiscal', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 74, 005, 048, 150, 'S', 'Observações dos Itens da Nota Fiscal.', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 76, 005, 049, 150, 'S', 'Praça de Pagamento.', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 88, 005, 050, 150, 'S', 'Endereço para cobrança.', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 89, 005, 051, 150, 'S', 'Nro Pedido.', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 90, 050, 02, 25, 'S', 'CGC Empresa', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 91, 050, 03, 25, 'S', 'Inscrição Estadual Empresa', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 92, 020, 01, 150, 'S', 'Cabeçalho da Nota', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 93, 085, 73, 150, 'S', 'Nome e valor do rodape', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 94, 085, 73, 145, 'S', 'Pagina de 1 a N', 'E', 'S', 'S', atualizar);
  IMP.InsereMovDoc(NroDoc, 95, 085, 73, 145, 'S', 'Percentual de ISSQN', 'E', 'S', 'S', atualizar);
  AtualizaSQLTabela(MOV_DOC);
end;

procedure TFConfigImpNotaFiscal.CAD_DOCBeforePost(DataSet: TDataSet);
begin
  if CAD_DOC.State = dsInsert then
    ProximoCodigoDocumento.VerificaCodigo;
  if (CPadrao.Text = '') then
  begin
    Aviso('Informe a Impressora Padrão.');
    CPadrao.SetFocus;
    Abort;
  end;
end;

procedure TFConfigImpNotaFiscal.CAD_DOCAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CAD_DOC);
  CAD_DOC.Last;
  IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

procedure TFConfigImpNotaFiscal.CAD_DOCAfterScroll(DataSet: TDataSet);
begin
  BExemplo.Enabled := not CAD_DOC.EOF;
  if CAD_DOC.EOF then
    FechaTabela(MOV_DOC)
  else
  begin
    IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
    ComboBoxColor1.ItemIndex := CAD_DOCI_TAM_BAR.AsInteger;
  end;
end;

procedure TFConfigImpNotaFiscal.BitBtn1Click(Sender: TObject);
begin
  try
    if MOV_DOC.State in [dsInsert, dsEdit] then
      MOV_DOC.Post;
    if CAD_DOC.State in [dsInsert, dsEdit] then
      CAD_DOC.Post;
  except
   if FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.Rollback;
  end;
  if FPrincipal.BaseDados.InTransaction then
  begin
    FPrincipal.BaseDados.Commit;
    AtualizaSQLTabela(CAD_DOC);
  end;
  MudaEstado(true);
  DATA_CAD_DOC.AutoEdit := false;
  DATA_MOV_DOC.AutoEdit := false;
end;

procedure TFConfigImpNotaFiscal.BitBtn3Click(Sender: TObject);
begin
   if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Cancel;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.cancel;
  if FPrincipal.BaseDados.InTransaction then
  begin
    FPrincipal.BaseDados.Rollback;
    AtualizaSQLTabela(CAD_DOC);
  end;
  MudaEstado(true);
  DATA_CAD_DOC.AutoEdit := false;
  DATA_MOV_DOC.AutoEdit := false;
end;

procedure TFConfigImpNotaFiscal.BitBtn4Click(Sender: TObject);
begin
  if Confirmacao('EXCLUSÃO DOCUMENTO - Deseja realmente excluir o registo "' +
    CAD_DOCC_NOM_DOC.AsString + '" ?') then
  begin
    if not FPrincipal.BaseDados.InTransaction then
      FPrincipal.BaseDados.StartTransaction;
    IMP.DeletaCabItems(CAD_DOCI_NRO_DOC.AsInteger);
    AtualizaSQLTabela(CAD_DOC);
  end;
end;

procedure TFConfigImpNotaFiscal.BCadastrarClick(Sender: TObject);
var
  VpfNomeModelo: string;
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  MudaEstado(false);
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;
  if Entrada( 'Novo Documento',
             'Digite o nome do novo modelo de Nota Fiscal a incluir: ',
             VpfNomeModelo, False, clWhite, clBtnFace) then
  begin
    if (VpfNomeModelo <> '') then
    begin
      if not FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.StartTransaction;
      CAD_DOC.Insert;
      CAD_DOCC_NOM_DOC.AsString := VpfNomeModelo;
      if RNota.Checked then
        CAD_DOCC_TIP_DOC.AsString := 'NFP'
      else
      if RServ.Checked then
        CAD_DOCC_TIP_DOC.AsString := 'NFS';
      CAD_DOCI_SEQ_IMP.ASInteger := CAD_DRIVER_AUX.FieldByName('I_SEQ_IMP').AsInteger;
      CAD_DOC.Post;
      InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, false);
      ECabPag.SetFocus;
    end;
  end
  else
  begin
    if FPrincipal.BaseDados.InTransaction  then
     FPrincipal.BaseDados.Rollback;
     MudaEstado(true);
     DATA_CAD_DOC.AutoEdit := false;
     DATA_MOV_DOC.AutoEdit := false;
  end;
  if FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.Commit;
end;

procedure TFConfigImpNotaFiscal.CAD_DOCBeforeEdit(DataSet: TDataSet);
begin
  if not FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.StartTransaction;
end;

procedure TFConfigImpNotaFiscal.SetText_SN(Sender: TField;
  const Text: String);
begin
  if (text = 's') or (text =  'S' ) then
    sender.Value := 'S';
  if (text = 'n') or (text =  'N' ) then
    sender.Value := 'N';
end;

procedure TFConfigImpNotaFiscal.MOV_DOCBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFConfigImpNotaFiscal.MOV_DOCBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFConfigImpNotaFiscal.SetText_DE(Sender: TField;
  const Text: String);
begin
  if (text = 'd') or (text =  'D' ) then
    sender.Value := 'D';
  if (text = 'e') or (text =  'E' ) then
    sender.Value := 'E';
end;

procedure TFConfigImpNotaFiscal.Negativo_keyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
   Key := '#';
end;

procedure TFConfigImpNotaFiscal.MOV_DOCBeforePost(DataSet: TDataSet);
begin
  // Se for condensado não pode ser negrito.
  if ((MOV_DOCC_FLA_CND.AsString = 'S') and (MOV_DOCC_FLA_NEG.AsString = 'S')) then
  begin
    MOV_DOCC_FLA_NEG.AsString := 'N';
    Aviso('O Campo não pode ser NEGRITO  e CONDENSADO ao mesmo tempo.');
  end;
end;

//////////////// Impressão de Comandos. //////////////////////

procedure TFConfigImpNotaFiscal.BitBtn5Click(Sender: TObject);
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  DATA_CAD_DOC.AutoEdit := true;
  DATA_MOV_DOC.AutoEdit := true;
  MudaEstado(false);
end;

{ ****************** Muda os estados dos Botoes **************************** }
procedure TFConfigImpNotaFiscal.MudaEstado( acao : Boolean );
begin
  BCadastrar.Enabled := acao;
  BitBtn5.Enabled := acao;
  BitBtn4.Enabled := acao;
  BitBtn1.Enabled := not acao;
  BitBtn3.Enabled := not  acao;
  BExemplo.Enabled := acao;
  BFechar.Enabled := acao;
  ComboBoxColor1.Enabled := not acao;
end;

procedure TFConfigImpNotaFiscal.BExemploClick(Sender: TObject);
var
  DadosFiscal: TDadosFiscal;
  Preeenche : string;
  laco : Integer;
begin
  Preeenche :='';
  if ETeste.Text <> '' then
    Preeenche := AdicionaCharD(ETeste.Text[1], Preeenche, 200);
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;
  IMP.InicializaImpressao(CAD_DOCI_NRO_DOC.AsInteger, CAD_DOCI_SEQ_IMP.AsInteger);
  DadosFiscal := TDadosFiscal.Create;
  with DadosFiscal do
  begin
    // COLUNAS //
    Produto_Codigo := TStringList.Create;
    Produto_Descricao := TStringList.Create;
    Produto_CL_Fisc := TStringList.Create;
    Produto_Sit_Tributaria := TStringList.Create;
    Produto_Unidade := TStringList.Create;
    Produto_Quantidade := TStringList.Create;
    Produto_Valor_Unitario := TStringList.Create;
    Produto_Valor_Total := TStringList.Create;
    Produto_ICMS := TStringList.Create;
    Produto_IPI := TStringList.Create;
    Produto_Valor_IPI := TStringList.Create;

    for laco := 1 to CAD_DOCI_QTD_LIN.AsInteger - 3 do
    begin
      Produto_Codigo.Add('0000' + IntTostr(laco) + Preeenche);
      Produto_Descricao.Add('PRODUTO NRO. - ' + IntTostr(laco)+ '.' + Preeenche);
      Produto_CL_Fisc.Add('CLF' + Preeenche);
      Produto_Sit_Tributaria.Add('STR'+ Preeenche);
      Produto_Unidade.Add('Kg' + Preeenche);
      Produto_Quantidade.Add(FormatFloat(varia.MascaraValor,laco) + Preeenche);
      Produto_Valor_Unitario.Add(Preeenche + FormatFloat(varia.MascaraMoeda,laco+100));
      Produto_Valor_Total.Add(Preeenche + FormatFloat(varia.MascaraMoeda,(laco+100)*laco));
      Produto_ICMS.Add(Preeenche + '17,00');
      Produto_IPI.Add('12,00' + Preeenche);
      Produto_Valor_IPI.Add(Preeenche + '100,00');
    end;

    Fatura_Numero1 := TStringList.Create;
    Fatura_Vencimento1 := TStringList.Create;
    Fatura_Valor1 := TStringList.Create;
    Fatura_Numero2 := TStringList.Create;
    Fatura_Vencimento2 := TStringList.Create;
    Fatura_Valor2 := TStringList.Create;
    Fatura_Numero3 := TStringList.Create;
    Fatura_Vencimento3 := TStringList.Create;
    Fatura_Valor3 := TStringList.Create;
    Fatura_Numero4 := TStringList.Create;
    Fatura_Vencimento4 := TStringList.Create;
    Fatura_Valor4 := TStringList.Create;

    Fatura_Numero5 := TStringList.Create;
    Fatura_Vencimento5 := TStringList.Create;
    Fatura_Valor5 := TStringList.Create;
    Fatura_Numero6 := TStringList.Create;
    Fatura_Vencimento6 := TStringList.Create;
    Fatura_Valor6 := TStringList.Create;

    Fatura_Numero1.Add('1111111' + Preeenche);
    Fatura_Vencimento1.Add('05/05/2000' + Preeenche);
    Fatura_Valor1.Add(Preeenche + 'R$ 111,11');
    Fatura_Numero2.Add('2222222' + Preeenche);
    Fatura_Vencimento2.Add('005/06/2000' + Preeenche);
    Fatura_Valor2.Add(Preeenche + 'R$ 222,22');
    Fatura_Numero3.Add('3333333' + Preeenche);
    Fatura_Vencimento3.Add('05/07/2000' + Preeenche);
    Fatura_Valor3.Add(Preeenche + 'R$ 333,33');
    Fatura_Numero4.Add('4444444' + Preeenche);
    Fatura_Vencimento4.Add('05/08/2000' + Preeenche);
    Fatura_Valor4.Add(Preeenche + 'R$ 444,44');
    Fatura_Numero5.Add('5555555' + Preeenche);
    Fatura_Vencimento5.Add('05/09/2000' + Preeenche);
    Fatura_Valor5.Add(Preeenche + 'R$ 555,55');
    Fatura_Numero6.Add('6666666' + Preeenche);
    Fatura_Vencimento6.Add('05/10/2000' + Preeenche);
    Fatura_Valor6.Add(Preeenche + 'R$ 666,66');

    Dados_Adicionais := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_ADI.AsInteger do
      Dados_Adicionais.Add('DADOS ADICIONAIS DA NOTA FISCAL' + Preeenche);

    Obs_Itens := TStringList.Create;
    Obs_Itens.Add('Observação: Itens da Nota.' + Preeenche);
    Obs_Itens.Add('Este campo é reservado para' + Preeenche);
    Obs_Itens.Add('observações dos itens da nota fiscal.' + Preeenche);

    Codigo_Servico := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Codigo_Servico.Add('00' + Inttostr(laco) + Preeenche);

    Servicos_Descricao := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Servicos_Descricao.Add('Descricao Servico ' + Preeenche);

    Unidade_servico := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Unidade_servico.Add('un' + Preeenche);

    Quantidade_Servico := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Quantidade_Servico.Add(Inttostr(laco) +',00' + Preeenche);

    Valor_Servico := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Valor_Servico.Add('R$ ' + Inttostr(laco*10) + ',00' + Preeenche);

    Valor_Total_servico := TStringList.Create;
    for laco := 1 to CAD_DOCI_QTD_SER.AsInteger do
      Valor_Total_servico.Add('R$ ' + Inttostr(laco*10*laco) +  ',00' + Preeenche);

    // DADOS //
    Numero_Nota := '12345' + Preeenche;
    Numero_Nota_Rodape := '12345' + Preeenche;
    XEntrada:= 'X';
    XSaida:= 'X';
    Natureza_Operacao := 'NATUREZA' + Preeenche;
    CFOP  := 'CFOP' + Preeenche;
    IE_Tributaria  := 'IE-888888' + Preeenche;
    Razao_Social  := 'RAZAO SOCIAL' + Preeenche;
    CGC_CPF := 'CGC-2323232323' + Preeenche;
    Data_Emissao := Date;
    Endereco := 'ENDERECO' + Preeenche;
    Bairro := 'BAIRRO' + Preeenche;
    CEP := '89800-123' + Preeenche;
    Data_Saida_Entrada := Date;
    Municipio := 'BLUMENAU' + Preeenche;
    Fone_FAX := '33303330333' + Preeenche;
    UF := 'SC' + Preeenche;
    IE := '1234567890' + Preeenche;
    Hora_Saida := '12:30';
    Base_Calculo_ICMS := '12,00';
    Valor_ICMS := '22,00';
    Base_Calculo_ICMS_Sub := '33,00';
    Valor_ICMS_Sub := '44,00';
    Valor_Total_Produtos := '55,00';
    Valor_Frete := '66,00';
    Valor_Seguro := '77,00';
    Outras_Despesas := '88,00';
    Valor_Total_IPI := '9999';
    Valor_Total_Nota := '12345,89';
    Valor_ISSQN := '111,00';
    Valor_Total_servicos := '112,00';
    Nome_Transportadora := 'TRANSPORTADORA' + Preeenche;
    Frete_Por_Conta := '1' + Preeenche;
    Placa_Veiculo := 'HHH-4554' + Preeenche;
    UF_Trasportadora := 'UF' + Preeenche;
    CGCCPF_Transportadora := 'CGC-CPF-45678' + Preeenche;
    Endereco_Transportadora := 'ENDERECO DA TRANSPOTADORA' + Preeenche;
    Municipio_Transportadora := 'CIDADE DE INDAIAL' + Preeenche;
    UF_Endereco_Transportadora := 'SC' + Preeenche;
    IE_Transportadora := '1234567890' + Preeenche;
    Quantidade := '5' + Preeenche;
    Especie := 'MADEIRA' + Preeenche;
    Marca := 'BOX' + Preeenche;
    Numero := '15' + Preeenche;
    Peso_Bruto := '500,50' + Preeenche;
    Peso_Liquido := '600,70' + Preeenche;
    Condicao_Pagamento := '30 DIAS. DE PRAZO.' + Preeenche;
    Vendedor := 'MARIA DA SILVA' + Preeenche;
    Classif_Fiscal := 'FORA DO ESTADO.' + Preeenche;
    PracaPagamento := 'PRACA DE PAGAMENTO.'+ Preeenche;
    Endereco_Pagamento := 'ENDERECO PARA COBRANCA';
    NroPedido := 'Pedido nro 123';
    CGC_Empresa := 'CGc Empresa';
    Insc_est_Empresa := 'Ins. Est. Empresa';
    Nome_Valor_rodape := 'Nome Rodape da Nota Fiscal';
    PaginaDE  := 'Pagina de 1 a N';
    ISSQN := '%ISSQN';

    Cabecalho_Nota := TStringList.Create;
    Cabecalho_Nota.add('Rua Joao Pessoa, 740 - Vellha');
    Cabecalho_Nota.add('Blumenau - SC');
    Cabecalho_Nota.add('Telefone : 021** 329-2288');

    IMP.ImprimeNotaFiscal(DadosFiscal);
    IMP.FechaImpressao(Config.ImpPorta, 'C:\IMP.TXT');
  end;
end;

procedure TFConfigImpNotaFiscal.BitBtn2Click(Sender: TObject);
var
  Proximo,
  I: Integer;
  VpfNomeModelo: string;
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;
  VpfNomeModelo := 'MODELO - ' + CAD_DOCC_NOM_DOC.AsString;
  if Entrada( 'Novo Documento',
             'Digite o nome da nova cópia de modelo da Nota Fiscal selecionada : ',
             VpfNomeModelo, False, clWhite, clBtnFace) then
  begin
    if (VpfNomeModelo <> '') then
    begin
      PTempo.Execute('Criando Modelo ...');
      if not FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.StartTransaction;
      AdicionaSQLAbreTabela(AUX, ' SELECT * FROM CAD_DOC ');
      Proximo := ProximoCodigo('CAD_DOC', 'I_NRO_DOC', FPrincipal.BaseDados);
      AUX.Insert;
      // Tabela pai.
      for I:=0 to (CAD_DOC.FieldCount - 1) do
        AUX.FieldByName(CAD_DOC.Fields[I].FieldName).Value := CAD_DOC.Fields[I].Value;
      AUX.FieldByName('I_NRO_DOC').AsInteger := Proximo;
      AUX.FieldByName('C_NOM_DOC').AsString := VpfNomeModelo;
      AUX.Post;
      // Tabela Filha;
      AdicionaSQLAbreTabela(AUX, ' SELECT * FROM MOV_DOC ');
      MOV_DOC.DisableControls;
      MOV_DOC.First;
      while not MOV_DOC.EOF do
      begin
        AUX.Insert;
        // Tabela pai.
        for I:=0 to (MOV_DOC.FieldCount - 1) do
          AUX.FieldByName(MOV_DOC.Fields[I].FieldName).Value := MOV_DOC.Fields[I].Value;
        AUX.FieldByName('I_NRO_DOC').AsInteger := Proximo;
        AUX.Post;
        MOV_DOC.Next;
      end;
      MOV_DOC.EnableControls;
      AtualizaSQLTabela(CAD_DOC);
      PTempo.Fecha;
    end;
  end
  else
  begin
    if FPrincipal.BaseDados.InTransaction  then
     FPrincipal.BaseDados.Rollback;
  end;
  if FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.Commit;
end;

procedure TFConfigImpNotaFiscal.RNotaClick(Sender: TObject);
begin
  if not (CAD_DOC.State in [dsInsert, dsEdit]) then
  begin
    if RNota.Checked then
     IMP.LocalizaTipoDocumento(CAD_DOC, 'NFP')
    else
    if RServ.Checked then
     IMP.LocalizaTipoDocumento(CAD_DOC, 'NFS');
  end;
end;

procedure TFConfigImpNotaFiscal.DBEditColor2Exit(Sender: TObject);
begin
  if (sender is TDBEditColor) then
  begin
    if (sender as TDBEditColor).Text <> '' then
    begin
      if StrToInt((sender as TDBEditColor).Text) = 0 then
        (sender as TDBEditColor).SetFocus;
    end
    else
      (sender as TDBEditColor).SetFocus;
  end;
end;


procedure TFConfigImpNotaFiscal.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfigImpNotaFiscal.HelpContext);
end;

procedure TFConfigImpNotaFiscal.ComboBoxColor1Change(Sender: TObject);
begin
  if not (CAD_DOC.State in [ dsinsert, dsEdit ]) then
    CAD_DOC.Edit;
  CAD_DOCI_TAM_BAR.AsInteger := ComboBoxColor1.ItemIndex;
end;

procedure TFConfigImpNotaFiscal.BitBtn6Click(Sender: TObject);
begin
  InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, true);
  AtualizaSQLTabela(MOV_DOC);
end;

Initialization
  RegisterClasses([TFConfigImpNotaFiscal]);
end.


