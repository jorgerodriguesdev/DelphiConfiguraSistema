unit AConfiguracaoImpressao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, ComCtrls, StdCtrls, Buttons, Componentes1,
  Mask, numericos, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation,
  DBCtrls, BotaoCadastro, UnImpressao, ConfigImpressora, Geradores,
  Localizacao;

type
  TFConfiguraImpressao = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    DocPage: TPageControl;
    DocTab: TTabSheet;
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
    PanelColor4: TPanelColor;
    GMov: TGridIndice;
    EQtdDoc: TDBEditColor;
    Label5: TLabel;
    ERodDoc: TDBEditColor;
    Label3: TLabel;
    Label2: TLabel;
    ECabPag: TDBEditColor;
    GDoc: TGridIndice;
    MOV_DOCC_DIR_ESQ: TStringField;
    CAD_DOCC_CHR_DIR: TStringField;
    CAD_DOCC_CHR_ESQ: TStringField;
    CAD_DOCN_CAB_PAG: TFloatField;
    CAD_DOCI_QTD_PAG: TIntegerField;
    MOV_DOCI_TAM_CAM: TIntegerField;
    Label7: TLabel;
    DBEditColor3: TDBEditColor;
    DBEditColor4: TDBEditColor;
    Label8: TLabel;
    RTipoDocumento: TRadioGroup;
    Label1: TLabel;
    PanelColor2: TPanelColor;
    BFechar: TBitBtn;
    BCadastrar: TBitBtn;
    BExcluir: TBitBtn;
    BGravar: TBitBtn;
    BCancelar: TBitBtn;
    BExemplo: TBitBtn;
    CAD_DOCI_SEQ_IMP: TIntegerField;
    ProximoCodigoDocumento: TProximoCodigo;
    CAD_DOCC_FLA_EXT: TStringField;
    CAD_DRIVER_AUX: TQuery;
    DATACAD_DRIVER_AUX: TDataSource;
    CPadrao: TDBLookupComboBoxColor;
    MOV_DOCC_FLA_NEG: TStringField;
    MOV_DOCC_FLA_ITA: TStringField;
    MOV_DOCC_FLA_CND: TStringField;
    MOV_DOCC_FLA_RED: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    CAD_DOCC_FLA_LIN: TStringField;
    CAD_DOCC_FLA_PAP: TStringField;
    DBRadioGroup2: TDBRadioGroup;
    DMes: TDBRadioGroup;
    BBAjuda: TBitBtn;
    ETeste: TEditColor;
    Label4: TLabel;
    CAD_DOCC_FLA_COP: TStringField;
    Copia: TDBRadioGroup;
    Label35: TLabel;
    BAlterar: TBitBtn;
    AUX: TQuery;
    PTempo: TPainelTempo;
    BModelo: TBitBtn;
    BitBtn6: TBitBtn;
    DBRadioGroup3: TDBRadioGroup;
    CAD_DOCC_MAT_PER: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure DocPageChange(Sender: TObject);
    procedure CAD_DOCAfterInsert(DataSet: TDataSet);
    procedure CAD_DOCBeforePost(DataSet: TDataSet);
    procedure CAD_DOCAfterPost(DataSet: TDataSet);
    procedure CAD_DOCAfterScroll(DataSet: TDataSet);
    procedure BGravarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BCadastrarClick(Sender: TObject);
    procedure CAD_DOCBeforeEdit(DataSet: TDataSet);
    procedure SetText_SN(Sender: TField; const Text: String);
    procedure MOV_DOCBeforeInsert(DataSet: TDataSet);
    procedure MOV_DOCBeforeDelete(DataSet: TDataSet);
    procedure BExemploClick(Sender: TObject);
    procedure SetText_DE(Sender: TField; const Text: String);
    procedure Negativo_keyPress(Sender: TObject; var Key: Char);
    procedure RTipoDocumentoClick(Sender: TObject);
    procedure MOV_DOCBeforePost(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure BAlterarClick(Sender: TObject);
    procedure BModeloClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    IMP : TFuncoesImpressao;
    TestoImp, Nome : string;
    procedure InicializaItens(NroDoc: Integer; Atualizar : Boolean);
    procedure MudaEstado( acao : Boolean );
  public
    { Public declarations }
  end;

var
  FConfiguraImpressao: TFConfiguraImpressao;

implementation

uses APrincipal, Constantes, FunSql, ConstMsg, FunString, UnClassesImprimir;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguraImpressao.FormCreate(Sender: TObject);
begin
  Nome := 'Cliente';
  if ConfigModulos.Academico then
    Nome := 'Aluno';
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  DocPage.ActivePage := DocTab;
  DocPageChange(Self);
  IMP.LocalizaTipoDocumento(CAD_DOC, 'NOT');
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguraImpressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FPrincipal.BaseDados.InTransaction then
  begin
    if Confirmacao('Deseja gravar as alterações efetuadas ?') then
      FPrincipal.BaseDados.Commit
    else
      FPrincipal.BaseDados.Rollback;
  end;
  IMP.Destroy;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                            Codigo de Barra
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }


{**************** fecha formulario ****************************************** }
procedure TFConfiguraImpressao.BFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TFConfiguraImpressao.DocPageChange(Sender: TObject);
var
  VpfTipo: string;
begin
  case DocPage.ActivePage.PageIndex of
    00 : begin
           AdicionaSQLAbreTabela(CAD_DRIVER_AUX,
             ' SELECT * FROM CAD_DRIVER ' +
             ' WHERE I_COD_DRV IS NULL '); // Somente Impresoras.
           case RTipoDocumento.ItemIndex of
             00 : VpfTipo := 'NOT';
             01 : VpfTipo := 'CHE';
             02 : VpfTipo := 'BOL';
             03 : VpfTipo := 'REC';
             04 : VpfTipo := 'DUP';
             06 : VpfTipo := 'ENV';
           end;
           IMP.LocalizaTipoDocumento(CAD_DOC, VpfTipo);
         end;
  end;
  if FPrincipal.BaseDados.InTransaction then
  begin
    if Confirmacao('Deseja gravar as alterações efetuadas ?') then
      FPrincipal.BaseDados.Commit
    else
      FPrincipal.BaseDados.Rollback;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                     Funcoes das tabelas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** depois do insert de um novo documento ************************ }
procedure TFConfiguraImpressao.CAD_DOCAfterInsert(DataSet: TDataSet);
begin
  ProximoCodigoDocumento.Execute('CAD_DOC') ;
  CAD_DOCC_CHR_ESQ.AsString := '('; // Caracter Direita.
  CAD_DOCC_CHR_DIR.AsString := ')'; // Caracter Esquerda.
  CAD_DOCC_FLA_LIN.AsString := 'N'; // Normal.
  CAD_DOCC_FLA_PAP.AsString := 'S'; // Normal.
  CAD_DOCC_FLA_EXT.AsString := 'S'; // Mês Extenso.
  CAD_DOCC_FLA_COP.AsString := 'N'; // Documento original.
  CAD_DOCD_DAT_DOC.AsDateTime := Date;
  CAD_DOCN_CAB_PAG.AsFloat := 0;
  CAD_DOCN_ROD_DOC.AsFloat := 5;
  CAD_DOCI_QTD_PAG.AsInteger := 1;
end;

{**************** Antes do post da tabela ********************************** }
procedure TFConfiguraImpressao.CAD_DOCBeforePost(DataSet: TDataSet);
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

{****************** Depois do Post do cad documentos ************************* }
procedure TFConfiguraImpressao.CAD_DOCAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CAD_DOC);
  CAD_DOC.Last;
  IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

{*************** pocisiona o mov doc donforme o cad doc ********************** }
procedure TFConfiguraImpressao.CAD_DOCAfterScroll(DataSet: TDataSet);
begin
  BExemplo.Enabled := not CAD_DOC.EOF;
  if CAD_DOC.EOF then
    FechaTabela(MOV_DOC)
  else
    IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

{****************** antes da edicao do cad doc ****************************** }
procedure TFConfiguraImpressao.CAD_DOCBeforeEdit(DataSet: TDataSet);
begin
  if not FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.StartTransaction;
end;

{************** Garante que o texto digitado ser S ou s ou N ou n ********** }
procedure TFConfiguraImpressao.SetText_SN(Sender: TField;
  const Text: String);
begin
  if (text = 's') or (text =  'S' ) then
    sender.Value := 'S';
  if (text = 'n') or (text =  'N' ) then
    sender.Value := 'N';
end;

{***************** antes do Insert ***************************************** }
procedure TFConfiguraImpressao.MOV_DOCBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

{********************* antes do Delete ************************************* }
procedure TFConfiguraImpressao.MOV_DOCBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

{************** Garante que o texto digitado ser D ou d ou E ou e ********** }
procedure TFConfiguraImpressao.SetText_DE(Sender: TField;
  const Text: String);
begin
  if (text = 'd') or (text =  'D' ) then
    sender.Value := 'D';
  if (text = 'e') or (text =  'E' ) then
    sender.Value := 'E';
end;

{****************** antes do post do mov doc ********************************* }
procedure TFConfiguraImpressao.MOV_DOCBeforePost(DataSet: TDataSet);
begin
  // Se for condensado não pode ser negrito.
  if ((MOV_DOCC_FLA_CND.AsString = 'S') and (MOV_DOCC_FLA_NEG.AsString = 'S')) then
  begin
    MOV_DOCC_FLA_NEG.AsString := 'N';
    Aviso('O Campo não pode ser NEGRITO  e CONDENSADO ao mesmo tempo.');
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         Novo Documento
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ *********************** Inicializa itens do mov documentos **************** }
procedure TFConfiguraImpressao.InicializaItens(NroDoc: Integer; Atualizar : Boolean);
begin
  case RTipoDocumento.ItemIndex of
    00 : begin // Nota Promissória.
           // VALORES CONFIGURADOS DEFAULT;
                                            //  H   V   T  .
           IMP.InsereMovDoc( NroDoc, 1,     41,  2,  50, 'S', 'Dia de Vencimento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  2,     48,  2,  50, 'S', 'Mês de Vencimento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  3,     69,  2,  50, 'S', 'Ano de Vencimento', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  4,     12,  4,  50, 'S', 'Número do Documento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  5,     68,  4,  50, 'S', 'Valor  do Documento', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  6,      8,  6,  50, 'S', 'Descrição da Duplicata - Linha 1.', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc,  7,      8,  6,  50, 'S', 'Descrição da Duplicata - Linha 2.', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  8,      6,  9,  50, 'S', 'Pessoa da Duplicata', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc,  9,     51,  9,  50, 'S', 'Número do CGC ou CPF', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 10,     15, 11,  50, 'S', 'Descrição do Valor - Linha 1. ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11,      5, 13,  50, 'S', 'Descrição do Valor - Linha 2. ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 12,     10, 15,  50, 'S', 'Descrição de Pagamento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 13,      5, 17,  50, 'S', 'Emitente', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 14,     10, 18,  50, 'S', 'Número do CGC/CPF do emitente', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 15,     6,  20,  50, 'S', 'Descrição do endereço do emitente', 'E', 'N', 'N' , atualizar);
           AtualizaSQLTabela(MOV_DOC);
         end;
    01 : begin // CHEQUE.
           // VALORES CONFIGURADOS DEFAULT;  V   T  .
           IMP.InsereMovDoc(NroDoc,  1,     62,  2,  50, 'S', 'Valor do Cheque', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  2,     10,  4,  20, 'S', 'Descrição do Valor - Linha 1. ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  3,      1,  5,  20, 'S', 'Descrição do Valor - Linha 2. ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  4,      2,  7,  30, 'S', 'Descrição Nominal. ', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc,  5,     31,  8,  30, 'S', 'Cidade Emitido', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc( NroDoc, 6,     43,  8,  30, 'S', 'Dia de Depósito', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  7,     46,  8,  40, 'S', 'Mês de Depósito', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  8,     63,  8,  50, 'S', 'Ano de Depósito', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  9,     1,  9,  50, 'S', 'Traço Separátorio - Cópia', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 10,     1, 10,  50, 'S', 'Número do Cheque - Cópia', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11,     1, 11,  50, 'S', 'Agência do Cheque - Cópia', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 12,     1, 12,  50, 'S', 'Banco do Cheque - Cópia', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 13,     1, 13,  50, 'S', 'Número da Conta - Cópia', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 14,     1, 13,  50, 'S', 'Observação - Cópia', 'E', 'N', 'N' , atualizar);
           AtualizaSQLTabela(MOV_DOC);
         end;
    02 : begin // BOLETO.
           // VALORES CONFIGURADOS DEFAULT;  V   T  .
           IMP.InsereMovDoc(NroDoc,  1,     62,  2,  50, 'S', 'Local de Pagamento', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  2,     10,  4,  20, 'S', 'Cedente', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  3,      0,  5,  20, 'S', 'Data do Documento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  4,      0,  7,  22, 'S', 'Numero do Documento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  5,     31,  8,  30, 'S', 'Espécie do Documento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  6,     43,  8,  30, 'S', 'Aceite', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  7,     46,  8,  40, 'S', 'Data de Processamento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  8,     63,  8,  50, 'S', 'Carteira', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc,  9,     31,  8,  30, 'S', 'Espécie', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 10,     43,  8,  30, 'S', 'Quantidade', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11,     46,  8,  40, 'S', 'Valor', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 12,     63,  8,  50, 'S', 'Vencimento', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 13,     31,  8,  30, 'S', 'Agência/Código Cedente', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 14,     43,  8,  30, 'S', 'Nosso Número', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 15,     46,  8,  40, 'S', 'Valor do Documento', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 16,     46,  8,  40, 'S', 'Descontos ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 17,     46,  8,  40, 'S', 'Abatimentos', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 18,     46,  8,  40, 'S', 'Mora / Multa', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 19,     46,  8,  40, 'S', 'Outros Acrescimos', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 20,     46,  8,  40, 'S', 'Valor Cobrado', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 21,     63,  8,  50, 'S', 'Instruções - TEXTO ', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 22,     63,  8,  50, 'S', 'Sacado - TEXTO', 'E', 'N', 'N' , atualizar);
           AtualizaSQLTabela(MOV_DOC);
         end;
    03 : begin // Carnê de Pagamento.
           // VALORES CONFIGURADOS DEFAULT;
           // TAMANHO DE LINHA NORMAL.
           // RODAPÉ - 3.
           // SALTO DE PÁGINA - 0.
           // DOC. POR PÁGINA - 4.
           IMP.InsereMovDoc(NroDoc, 01, 002, 06, 12, 'S', 'Carne1 - Código do ' + Nome + ' - 1 via' , 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 02, 006, 03, 28, 'S', 'Carne1 - Nome do ' + Nome + ' -  1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 03, 012, 03, 06, 'S', 'Carne1 - Parcela - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 04, 012, 09, 10, 'S', 'Carne1 - Data de Vencimento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 05, 030, 09, 18, 'S', 'Carne1 - Número do Documento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 06, 012, 18, 13, 'S', 'Carne1 - Valor da Parcela - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 07, 014, 03, 28, 'S', 'Carne1 - Observações - 1 via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 08, 002, 12, 22, 'S', 'Carne1 - Acréscimo / Desconto - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 09, 002, 15, 46, 'S', 'Carne1 - Autentificação - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 10, 002, 15, 22, 'S', 'Carne1 - Valor Total - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11, 002, 06, 12, 'S', 'Carne1 - Código do ' + Nome + ' - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 12, 014, 33, 10, 'S', 'Carne1 - Nome do ' + Nome + ' - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 13, 006, 38, 05, 'S', 'Carne1 - Parcela - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 14, 010, 33, 10, 'S', 'Carne1 - Data de Vencimento - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 15, 002, 09, 18, 'S', 'Carne1 - Número do Documento - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 16, 012, 33, 10, 'S', 'Carne1 - Valor da Parcela - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 17, 002, 12, 47, 'S', 'Carne1 - Observações - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 18, 002, 12, 22, 'S', 'Carne1 - Acréscimo / Desconto - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 19, 002, 15, 46, 'S', 'Carne1 - Autentificação - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 20, 002, 15, 22, 'S', 'Carne1 - Valor Total - 2 Via', 'D', 'N', 'N', atualizar );

           IMP.InsereMovDoc(NroDoc, 21, 008, 03, 29, 'S', 'Carne1 - Endereço - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 22, 010, 03, 03, 'S', 'Carne1 - Estado - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 23, 010, 06, 10, 'S', 'Carne1 - CEP - ' + Nome, 'E', 'N', 'N', atualizar );

           IMP.InsereMovDoc(NroDoc, 24, 002, 06, 12, 'S', 'Carne1 - Código do ' + Nome + ' - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 25, 002, 06, 53, 'S', 'Carne1 - Nome do ' + Nome + ' - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 26, 002, 09, 03, 'S', 'Carne1 - Parcela - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 27, 002, 09, 12, 'S', 'Carne1 - Data de Vencimento - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 28, 002, 09, 18, 'S', 'Carne1 - Número do Documento - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 29, 002, 09, 22, 'S', 'Carne1 - Valor da Parcela - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 30, 002, 12, 47, 'S', 'Carne1 - Observações - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 31, 002, 12, 22, 'S', 'Carne1 - Acréscimo / Desconto - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 32, 002, 15, 46, 'S', 'Carne1 - Autentificação - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 33, 002, 15, 22, 'S', 'Carne1 - Valor Total - 3 Via', 'D', 'N', 'N', atualizar );
           if ConfigModulos.Academico then
           begin
             IMP.InsereMovDoc(NroDoc, 34, 010, 15, 06, 'S', 'Carne1 - Turma - 1 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 35, 010, 21, 10, 'S', 'Carne1 - Contrato - 1 Via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 36, 006, 33, 05, 'S', 'Carne1 - Turma - 2 via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 37, 008, 33, 10, 'S', 'Carne1 - Contrato - 2 via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 38, 002, 15, 46, 'S', 'Carne1 - Turma - 3 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 39, 002, 15, 22, 'S', 'Carne1 - Contrato - 3 Via', 'E', 'N', 'N', atualizar );
           end;

           IMP.InsereMovDoc(NroDoc, 40, 002, 06, 12, 'N', 'Carne2 - Código do ' + Nome + ' - 1 via' , 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 41, 006, 45, 28, 'N', 'Carne2 - Nome do ' + Nome + ' -  1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 42, 012, 45, 06, 'N', 'Carne2 - Parcela - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 43, 012, 51, 10, 'N', 'Carne2 - Data de Vencimento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 44, 002, 09, 18, 'N', 'Carne2 - Número do Documento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 45, 012, 62, 13, 'N', 'Carne2 - Valor da Parcela - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 46, 014, 45, 28, 'N', 'Carne2 - Observações - 1 via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 47, 002, 12, 22, 'N', 'Carne2 - Acréscimo / Desconto - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 48, 002, 15, 46, 'N', 'Carne2 - Autentificação - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 49, 002, 15, 22, 'N', 'Carne2 - Valor Total - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 50, 002, 06, 12, 'N', 'Carne2 - Código do ' + Nome + ' - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 51, 014, 75, 10, 'N', 'Carne2 - Nome do ' + Nome + ' - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 52, 006, 75, 05, 'N', 'Carne2 - Parcela - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 53, 010, 09, 10, 'N', 'Carne2 - Data de Vencimento - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 54, 002, 09, 18, 'N', 'Carne2 - Número do Documento - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 55, 012, 75, 10, 'N', 'Carne2 - Valor da Parcela - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 56, 002, 12, 47, 'N', 'Carne2 - Observações - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 57, 002, 12, 22, 'N', 'Carne2 - Acréscimo / Desconto - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 58, 002, 15, 46, 'N', 'Carne2 - Autentificação - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 59, 002, 15, 22, 'N', 'Carne2 - Valor Total - 2 Via', 'D', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 60, 008, 45, 29, 'N', 'Carne2 - Endereço - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 61, 010, 45, 03, 'N', 'Carne2 - Estado - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 62, 010, 49, 03, 'N', 'Carne2 - CEP - ' + Nome, 'E', 'N', 'N', atualizar );

           IMP.InsereMovDoc(NroDoc, 63, 002, 06, 12, 'N', 'Carne2 - Código do ' + Nome + ' - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 64, 002, 06, 53, 'N', 'Carne2 - Nome do ' + Nome + ' - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 65, 002, 09, 03, 'N', 'Carne2 - Parcela - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 66, 002, 09, 12, 'N', 'Carne2 - Data de Vencimento - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 67, 002, 09, 18, 'N', 'Carne2 - Número do Documento - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 68, 002, 09, 22, 'N', 'Carne2 - Valor da Parcela - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 69, 002, 12, 47, 'N', 'Carne2 - Observações - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 70, 002, 12, 22, 'N', 'Carne2 - Acréscimo / Desconto - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 71, 002, 15, 46, 'N', 'Carne2 - Autentificação - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 72, 002, 15, 22, 'N', 'Carne2 - Valor Total - 3 Via', 'D', 'N', 'N', atualizar );
           if ConfigModulos.Academico then
           begin
             IMP.InsereMovDoc(NroDoc, 73, 010, 58, 06, 'N', 'Carne2 - Turma - 1 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 74, 010, 65, 10, 'N', 'Carne2 - Contrato - 1 Via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 75, 006, 75, 05, 'N', 'Carne2 - Turma - 2 via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 76, 008, 75, 10, 'N', 'Carne2 - Contrato - 2 via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 77, 002, 15, 46, 'N', 'Carne2 - Turma - 3 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 78, 002, 15, 22, 'N', 'Carne2 - Contrato - 3 Via', 'E', 'N', 'N', atualizar );
           end;

           IMP.InsereMovDoc(NroDoc, 79, 002, 06, 12, 'N', 'Carne3 - Código do ' + Nome + ' - 1 via' , 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 80, 006, 87, 28, 'N', 'Carne3 - Nome do ' + Nome + ' -  1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 81, 012, 87, 06, 'N', 'Carne3 - Parcela - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 82, 012, 94, 10, 'N', 'Carne3 - Data de Vencimento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 83, 002, 09, 18, 'N', 'Carne3 - Número do Documento - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 84, 012, 104, 13, 'N', 'Carne3 - Valor da Parcela - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 85, 014, 87, 28, 'N', 'Carne3 - Observações - 1 via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 86, 002, 12, 22, 'N', 'Carne3 - Acréscimo / Desconto - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 87, 002, 15, 46, 'N', 'Carne3 - Autentificação - 1 via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 88, 002, 15, 22, 'N', 'Carne3 - Valor Total - 1 via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 89, 002, 06, 12, 'N', 'Carne3 - Código do ' + Nome + ' - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 90, 014, 118, 10, 'N', 'Carne3 - Nome do ' + Nome + ' - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 91, 006, 124, 05, 'N', 'Carne3 - Parcela - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 92, 010, 118, 10, 'N', 'Carne3 - Data de Vencimento - 2 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 93, 002, 09, 18, 'N', 'Carne3 - Número do Documento - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 94, 012, 118, 10, 'N', 'Carne3 - Valor da Parcela - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 95, 014, 12, 28, 'N', 'Carne3 - Observações - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 96, 002, 12, 22, 'N', 'Carne3 - Acréscimo / Desconto - 2 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 97, 002, 15, 46, 'N', 'Carne3 - Autentificação - 2 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 98, 002, 15, 22, 'N', 'Carne3 - Valor Total - 2 Via', 'D', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 99, 008, 87, 29, 'N', 'Carne3 - Endereço - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 100, 010, 87, 03, 'N', 'Carne3 - Estado - ' + Nome, 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 101, 010, 91, 10, 'N', 'Carne3 - CEP - ' + Nome, 'E', 'N', 'N', atualizar );

           IMP.InsereMovDoc(NroDoc, 102, 002, 06, 12, 'N', 'Carne3 - Código do ' + Nome + ' - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 103, 002, 06, 53, 'N', 'Carne3 - Nome do ' + Nome + ' - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 104, 002, 09, 03, 'N', 'Carne3 - Parcela - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 105, 002, 09, 12, 'N', 'Carne3 - Data de Vencimento - 3 Via', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 106, 002, 09, 18, 'N', 'Carne3 - Número do Documento - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 107, 002, 09, 22, 'N', 'Carne3 - Valor da Parcela - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 108, 002, 12, 47, 'N', 'Carne3 - Observações - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 109, 002, 12, 22, 'N', 'Carne3 - Acréscimo / Desconto - 3 Via', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 110, 002, 15, 46, 'N', 'Carne3 - Autentificação - 3 Via', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 111, 002, 15, 22, 'N', 'Carne3 - Valor Total - 3 Via', 'D', 'N', 'N', atualizar );
           if ConfigModulos.Academico then
           begin
             IMP.InsereMovDoc(NroDoc, 112, 006, 101, 05, 'N', 'Carne3 - Turma - 1 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 113, 008, 107, 10, 'N', 'Carne3 - Contrato - 1 Via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 114, 006, 118, 05, 'N', 'Carne3 - Turma - 2 via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 115, 008, 123, 10, 'N', 'Carne3 - Contrato - 2 via', 'E', 'N', 'N', atualizar );
             IMP.InsereMovDoc(NroDoc, 116, 002, 15, 46, 'N', 'Carne3 - Turma - 3 Via', 'E', 'N', 'N' , atualizar);
             IMP.InsereMovDoc(NroDoc, 117, 002, 15, 22, 'N', 'Carne3 - Contrato - 3 Via', 'E', 'N', 'N', atualizar );
           end;


           AtualizaSQLTabela(MOV_DOC);
         end;
    04 : begin // Recibo.     h    v   t
           IMP.InsereMovDoc(NroDoc, 01, 005, 06, 10, 'S', 'Número do Recibo', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 02, 025, 06, 10, 'S', 'Valor do Recibo ', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 03, 005, 08, 40, 'S', 'Pessoa do Recibo', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 04, 010, 09, 40, 'S', 'Descrição Valor Linha 1', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 05, 005, 10, 50, 'S', 'Descrição Valor Linha 2', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 06, 010, 11, 50, 'S', 'Descrição referência Linha 1', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 07, 005, 12, 50, 'S', 'Descrição referência Linha 2', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 08, 020, 15, 30, 'S', 'Cidade', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 09, 055, 15, 02, 'S', 'Dia', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 10, 060, 15, 10, 'S', 'Mês', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11, 075, 15, 04, 'S', 'Ano', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 12, 005, 18, 40, 'S', 'Emitente', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 13, 005, 19, 40, 'S', 'CGC, CPF ou RG do Emitente ', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 14, 005, 20, 80, 'S', 'Endereço do Emitente', 'E', 'N', 'N' , atualizar);
           AtualizaSQLTabela(MOV_DOC);
         end;
    05 : begin // Duplicata.             h    v   t
           IMP.InsereMovDoc(NroDoc, 01, 050, 08, 10, 'S', 'Data de Emissão', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 02, 002, 12, 10, 'S', 'Número da Fatura ', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 03, 015, 12, 10, 'S', 'Valor da Fatura', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 04, 030, 12, 10, 'S', 'Número de Ordem', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 05, 045, 12, 12, 'S', 'Vencimento', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 06, 010, 15, 10, 'S', 'Desconto', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 07, 060, 15, 12, 'S', 'Data Limite de Pagamento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 08, 010, 16, 30, 'S', 'Condições Especiais', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 09, 020, 19, 30, 'S', 'Nome do Sacado', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 10, 020, 20, 30, 'S', 'Endereço do Sacado', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 11, 020, 21, 30, 'S', 'Município', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 12, 070, 21, 02, 'S', 'Estado', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 13, 020, 22, 20, 'S', 'Inscrição CGC', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 14, 070, 22, 20, 'S', 'Inscrição Estadual', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 15, 020, 23, 30, 'S', 'Praça de Pagamento', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 16, 020, 27, 40, 'S', 'Descrição Valor Linha 1', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 17, 020, 28, 40, 'S', 'Descrição Valor Linha 1', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 18, 020, 30, 20, 'S', 'Valor Total da Duplicata', 'D', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 19, 070, 31, 20, 'S', 'Representante', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 20, 020, 32, 30, 'S', 'Código do Representante', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 21, 020, 33, 40, 'S', 'CEP', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 22, 020, 34, 40, 'S', 'Código do Sacado', 'E', 'N', 'N', atualizar );
           AtualizaSQLTabela(MOV_DOC);
         end;
    06 : begin // Envelope              h    v   t
           // frente
           IMP.InsereMovDoc(NroDoc, 01, 10, 05, 60, 'S', 'Nome Destinatário', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 02, 10, 06, 100, 'S', 'Rua Destinatário', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 03, 10, 07, 50, 'S', 'Bairro Destinatário', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 04, 10, 08, 50, 'S', 'Cidade/Estado Destinatário', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 05, 10, 09, 10, 'S', 'CEP Destinatário', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 06, 10, 10, 50, 'S', 'A/C Destinatário', 'E', 'N', 'N' , atualizar);
           // verso
           IMP.InsereMovDoc(NroDoc, 07, 10, 15, 60, 'S', 'Nome Remetente', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 08, 10, 16, 100, 'S', 'Rua Remetente', 'E', 'N', 'N' , atualizar);
           IMP.InsereMovDoc(NroDoc, 09, 10, 17, 50, 'S', 'Bairro Remetente', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 10, 10, 18, 50, 'S', 'Cidade/Estado Remetente', 'E', 'N', 'N', atualizar );
           IMP.InsereMovDoc(NroDoc, 11, 10, 19, 10, 'S', 'CEP Remetente', 'E', 'N', 'N' , atualizar);
           AtualizaSQLTabela(MOV_DOC);
         end;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       Funcoes do botoes inferiores
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********************* grava documento ************************************** }
procedure TFConfiguraImpressao.BGravarClick(Sender: TObject);
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

{******************* Cancela documento ************************************* }
procedure TFConfiguraImpressao.BCancelarClick(Sender: TObject);
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

{***************** Excluir documento **************************************** }
procedure TFConfiguraImpressao.BExcluirClick(Sender: TObject);
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

{**************** cadastrar documento ************************************** }
procedure TFConfiguraImpressao.BCadastrarClick(Sender: TObject);
var
  VpfTipo,
  VpfNovo,
  VpfMsg : string;
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  MudaEstado(false);
  try
    case RTipoDocumento.ItemIndex of
      00 : begin
             VpfMsg := 'de NOTA PROMISSÓRIA';
             VpfTipo := 'NOT';
           end;
      01 : begin
             VpfMsg := 'de CHEQUE';
             VpfTipo := 'CHE';
           end;
      02 : begin
             VpfMsg := 'de BOLETO BANCÁRIO';
             VpfTipo := 'BOL';
           end;
      03 : begin
             VpfMsg := 'de CARNÊ DE PAGAMENTO';
             VpfTipo := 'CAR';
           end;
      04 : begin
             VpfMsg := 'de RECIBO';
             VpfTipo := 'REC';
           end;
      05 : begin
             VpfMsg := 'de DUPLICATA';
             VpfTipo := 'DUP';
           end;
      06 : begin
             VpfMsg := 'de ENVELOPE';
             VpfTipo := 'ENV';
           end;

    end;
    if MOV_DOC.State in [dsInsert, dsEdit] then
      MOV_DOC.Post;
    if CAD_DOC.State in [dsInsert, dsEdit] then
      CAD_DOC.Post;
    if Entrada('Novo Documento',
               'Digite o nome do novo modelo ' + VpfMsg + ' a incluir: ',
               VpfNovo, False, clWhite, clBtnFace) then
    begin
      if (VpfNovo <> '') then
      begin
        if not FPrincipal.BaseDados.InTransaction then
          FPrincipal.BaseDados.StartTransaction;
        CAD_DOC.Insert;
        CAD_DOCC_NOM_DOC.AsString := VpfNovo;
        CAD_DOCC_TIP_DOC.AsString := VpfTipo;
        CAD_DOCI_SEQ_IMP.Value := CAD_DRIVER_AUX.FieldByName('I_SEQ_IMP').Value;
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
  except
   if FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.Rollback;
  end;

  if FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.Commit;
end;

{***************** cria um exemplo do documento selecionado ***************** }
procedure TFConfiguraImpressao.BExemploClick(Sender: TObject);
var
  I,
  Qtd: Integer;
  Preenche :string;
  TI,
  TS: TStringList;
  DadosPromissoria: TDadosPromissoria;
  DadosBoleto: TDadosBoleto;
  DadosCheque: TDadosCheque;
  DadosCarne: TDadosCarne;
  DadosRecibo: TDadosRecibo;
  DadosDuplicata: TDadosDuplicata;
  DadosEnvelope : TDadosEnvelope;
begin
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;
  Preenche:= '';
  if ETeste.Text <> '' then
    Preenche:=AdicionaCharD(ETeste.Text[1], Preenche, 200);
  IMP.InicializaImpressao(CAD_DOCI_NRO_DOC.AsInteger, CAD_DOCI_SEQ_IMP.AsInteger);
  if IMP.CabecalhoDOC.QuantidadePorPagina = 1 then
    Qtd := 1 // Imprime somente este.
  else
    Qtd := (IMP.CabecalhoDOC.QuantidadePorPagina * 2); // Imprime duas páginas.
  for I := 1  to Qtd do
  begin
    case RTipoDocumento.ItemIndex of
      00: begin
             // Carrega e Imprime os dados do cheque.
             DadosPromissoria := TDadosPromissoria.Create;
             with DadosPromissoria do
             begin
               DiaVencimento:='25' + Preenche;
               MesVencimento:='06';
               AnoVencimento:='2000' + Preenche;
               NumeroDocumento:=Preenche + '12345678';
               ValorDocumento:=5000;
               DescricaoDuplicata1:='111111 - NOTA EXEMPLO PARA IMPRIMIR.' + Preenche;
               DescricaoDuplicata2:='222222 - NOTA EXEMPLO PARA IMPRIMIR.' + Preenche;
               PessoaDuplicata:='PESSOA DO DOCUMENTO.' + Preenche;
               NumeroCGCCPF:='123.456.789.101-88' + Preenche;
               DescricaoValor1:='1 - CENTO E DOZE MIL TREZENTOS E QUARENTA E CINCO REAIS ' + Preenche;
               DescricaoValor2:='2 - E NOVENTA E NOVE CENTAVOS. ' + Preenche;
               DescricaoPagamento:='PAGAMENTO EM DINHEIRO.' + Preenche;
               Emitente:='MARIO DA SILVA.' + Preenche;
               CPFCGCEmitente:= Preenche + '123.456.789.000.555-22';
               EnderecoEmitente:='EXEMPLO DE LOCAL PARA DOCUMENTOS.' + Preenche;
             end;
             IMP.ImprimePromissoria(DadosPromissoria);
           end;
      01: begin
             DadosCheque := TDadosCheque.Create;
             with DadosCheque do
             begin
              // Carrega e Imprime os dados do cheque.
               ValorCheque := 1234567.78;
               DescValor1 := 'CENTO E DOZE MIL TREZENTOS E QUARENTA E ' + Preenche;
               DescValor2 := 'CINCO REAIS E NOVENTA E NOVE CENTAVOS. ' + Preenche;
               DescNominal := 'EXEMPLO INF. LTDA. - ME.' + Preenche;
               CidadeEmitido := 'BLUMENAU' + Preenche;
               DiaDeposito := '05' + Preenche;
               MesDeposito := '02';
               AnodeDeposito := '2000' + Preenche;
               Numero := Preenche + '12344444';
               Conta :=  Preenche + '222.666-7';
               Agencia := Preenche + '555';
               Banco := 'BANCO EXEMPLO' + Preenche;
               Observ := 'OBS.' + Preenche;
               Traco := '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
             end;
             IMP.ImprimeCheque(DadosCheque);
          end;
      02 : begin
             DadosBoleto := TDadosBoleto.Create;
             TI := TStringList.Create;
             TS := TStringList.Create;
             with DadosBoleto do
             begin
               LocalPagamento := 'QUALQUER BANCO ATE O VENCIMENTO.' + Preenche;
               Cedente := 'BANCO EXEMPLO LTDA. ' + Preenche;
               DataDocumento := Date;
               NumeroDocumento := '123456789012' + Preenche;
               EspecieDocumento := 'AP.' + Preenche;
               Aceite := 'N.' + Preenche;
               DataProcessamento := Date;
               Carteira := 'DIREITA' + Preenche;
               Especie := 'R$' + Preenche;
               Quantidade := Preenche + '50,00';
               Valor := 1000;
               Vencimento := Date;
               Agencia := '003-92342/303-6' + Preenche;
               NossoNumero := '4444444444' + Preenche;
               ValorDocumento := 5000;
               Desconto := 2;
               Outras := 3;
               MoraMulta := 5;
               Acrescimos := 4;
               ValoCobrado := 5010;
               TI.Add('1 - Instruções');
               TI.Add('2 - Instruções');
               TI.Add('3 - Instruções');
               TI.Add('4 - Instruções');
               TI.Add('5 - Instruções');
               TI.Add('6 - Instruções');
               TI.Add('7 - Instruções');
               Instrucoes := TI;
               // Máximo 3 linhas.
               TS.Add('1 - Sacado.');
               TS.Add('2 - Sacado.');
               TS.Add('3 - Sacado.');
               Sacado := TS;
             end;
             IMP.ImprimeBoleto(DadosBoleto);
             TI.Destroy;
             TS.Destroy;
           end;
      03: begin
             // Carrega e Imprime os dados do Carne de Pagamento.
             DadosCarne := TDadosCarne.Create;
             with DadosCarne do
             begin
               CodigoClienteC := '11 123456' + Preenche;
               NomeClienteC := '11 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaC := '11' + Preenche;
               VencimentoC := Date;
               NumeroDocumentoC := '11 333' + Preenche;
               ValorParcelaC := 11345;
               ObservacoesC := '11 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescC := 113;
               AutentificacaoC := '11 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalC := 1188888.88;

               CodigoClienteL := '12 123456' + Preenche;
               NomeClienteL := '12 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL := '12' +  Preenche;
               VencimentoL := date;
               NumeroDocumentoL := '12 333' + Preenche;
               ValorParcelaL := 12345;
               ObservacoesL := '12 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL := 123;
               AutentificacaoL := '12 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL := 1288888.88;

               Endereco := '11 Rua Joao Pessoa' + Preenche;
               Estado := 'SC'  + Preenche;
               CEP := '11160-000' + Preenche;

               CodigoClienteL1 := '13 123456' + Preenche;
               NomeClienteL1 := '13 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL1 := '13' +  Preenche;
               VencimentoL1 := date;
               NumeroDocumentoL1 := '13 333' + Preenche;
               ValorParcelaL1 := 13345;
               ObservacoesL1 := '13 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL1 := 133;
               AutentificacaoL1 := '13 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL1 := 1388888.88;

               if ConfigModulos.Academico then
               begin
                 Turma := '11 Turma';
                 Contrato := '11 Contrato';
                 TurmaL := '12 Turma';
                 ContratoL := '12 Contrato';
                 TurmaL1 := '13 Turma';
                 ContratoL1 := '13 Contrato';
               end;

               CodigoClienteC_2 := '21 123456' + Preenche;
               NomeClienteC_2 := '21 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaC_2 := '21' + Preenche;
               VencimentoC_2 := Date;
               NumeroDocumentoC_2 := '21 333' + Preenche;
               ValorParcelaC_2 := 21345;
               ObservacoesC_2 := '21 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescC_2 := 213;
               AutentificacaoC_2 := '21 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalC_2 := 2188888.88;

               CodigoClienteL_2 := '22 123456' + Preenche;
               NomeClienteL_2 := '22 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL_2 := '22' +  Preenche;
               VencimentoL_2 := date;
               NumeroDocumentoL_2:= '22 333' + Preenche;
               ValorParcelaL_2 := 22345;
               ObservacoesL_2 := '22 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL_2 := 223;
               AutentificacaoL_2 := '22 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL_2 := 2288888.88;

               Endereco_2 := '21 Rua Joao Pessoa' + Preenche;
               Estado_2 := 'SC'  + Preenche;
               CEP_2 := '21160-000' + Preenche;

               CodigoClienteL1_2 := '23 123456' + Preenche;
               NomeClienteL1_2 := '23 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL1_2 := '23' +  Preenche;
               VencimentoL1_2 := date;
               NumeroDocumentoL1_2 := '23 333' + Preenche;
               ValorParcelaL1_2 := 23345;
               ObservacoesL1_2 := '23 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL1_2 := 233;
               AutentificacaoL1_2 := '23 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL1_2 := 2388888.88;

               if ConfigModulos.Academico then
               begin
                 Turma_2 := '21 Turma';
                 Contrato_2 := '21 Contrato';
                 TurmaL_2 := '22 Turma';
                 ContratoL_2 := '22 Contrato';
                 TurmaL1_2 := '23 Turma';
                 ContratoL1_2 := '23 Contrato';
               end;

               CodigoClienteC_3 := '31 123456' + Preenche;
               NomeClienteC_3 := '31 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaC_3 := '31' + Preenche;
               VencimentoC_3 := Date;
               NumeroDocumentoC_3 := '31 333' + Preenche;
               ValorParcelaC_3 := 31345;
               ObservacoesC_3 := '31 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescC_3 := 313;
               AutentificacaoC_3 := '31 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalC_3 := 3188888.88;

               CodigoClienteL_3 := '32 123456' + Preenche;
               NomeClienteL_3 := '32 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL_3 := '32' +  Preenche;
               VencimentoL_3 := date;
               NumeroDocumentoL_3:= '32 333' + Preenche;
               ValorParcelaL_3 := 32345;
               ObservacoesL_3 := '32 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL_3 := 323;
               AutentificacaoL_3 := '32 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL_3 := 3288888.88;

               Endereco_3 := '31 Rua Joao Pessoa' + Preenche;
               Estado_3 := 'SC'  + Preenche;
               CEP_3 := '31160-000' + Preenche;

               CodigoClienteL1_3 := '33 123456' + Preenche;
               NomeClienteL1_3 := '33 RODRIGO EXEMPLO DE OLIVEIRA DA SILVA' + Preenche;
               ParcelaL1_3 := '33' +  Preenche;
               VencimentoL1_3 := date;
               NumeroDocumentoL1_3 := '33 333' + Preenche;
               ValorParcelaL1_3 := 33345;
               ObservacoesL1_3 := '33 DEMO DE CARNE DE PAGAMENTO.' + Preenche;
               AcrDescL1_3 := 333;
               AutentificacaoL1_3 := '33 /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/' + Preenche;
               ValorTotalL1_3 := 3388888.88;

               if ConfigModulos.Academico then
               begin
                 Turma_3 := '31 Turma';
                 Contrato_3 := '31 Contrato';
                 TurmaL_3 := '32 Turma';
                 ContratoL_3 := '32 Contrato';
                 TurmaL1_3 := '33 Turma';
                 ContratoL1_3 := '33 Contrato';
               end;
             end;
             IMP.ImprimeCarnePagamento(DadosCarne);
           end;
      04: begin
            // Carrega e Imprime os dados do Carne de Pagamento.
            DadosRecibo := TDadosRecibo.Create;
            with DadosRecibo do
            begin
              Numero := '1234567890' + Preenche;
              Valor := 123456.88;
              Pessoa := 'PESSOA EXEMPLO.' + Preenche;
              DescValor1 := 'CENTO E VINTE E CINCO MIL REAIS' + Preenche;
              DescValor2 := 'E TRINTA E DOIS CENTAVOS'  + Preenche;
              DescReferente1 := 'COMPRA DE EQUIPAMENTO, OU SEJA, DE'  + Preenche;
              DescReferente2 := 'UM COMPUTADOR MARCA EXEMPLO.'  + Preenche;
              Cidade := 'CIDADE EXEMPLO'  + Preenche;
              Dia := '01' + Preenche;
              Mes := 'JANEIRO' + Preenche;
              Ano := '2000' + Preenche;
              Emitente := 'EMITENTE EXEMPLO'  + Preenche;
              CGCCPFGREmitente := '2423.4234.234.234'  + Preenche;
              EnderecoEmitente := 'ENDERECO EXEMPLO.' + Preenche;
            end;
            IMP.ImprimeRecibo(DadosRecibo);
          end;
      05: begin
            // Carrega e Imprime os dados do Carne de Pagamento.
            DadosDuplicata := TDadosDuplicata.Create;
            with DadosDuplicata do
            begin
              DataEmissao := Date;
              Numero := '1234567890' + Preenche;
              Valor :=1234.80;
              NroOrdem := '1234567890' + Preenche;
              DataVencimento := Date;
              DescontoDe := 12.05;
              DataPagtoAte := Date;
              CondEspeciais := 'EXEMPLO DE CONDICOES ESPECIAIS' + Preenche;
              NomeSacado := 'EXEMPLO NOME SACADO' + Preenche;
              EnderecoSacado := 'ENDERECO EXEMPLO' + Preenche;
              CidadeSacado := 'CIDADE EXEMPLO' + Preenche;
              EstadoSacado := 'SC' + Preenche;
              InscricaoCGC := '1234564567890' + Preenche;
              InscricaoEstadual := '123467867567890' + Preenche;
              PracaPagto := 'PRACA EXEMPLO' + Preenche;
              DescValor1 := 'TREZENTOS E OITENTA E CINCO REAIS E ' + Preenche;
              DescValor2 := 'SETENTA CENTAVOS' + Preenche;
              ValorTotal := 12345678.50;
              Representante := 'REPRESENTANTE' + Preenche;
              Cod_Representante := '8228' + Preenche;
              CEP := '89802-240' + Preenche;
              Cod_Sacado := '12345678' + Preenche;
            end;
            IMP.ImprimeDuplicata(DadosDuplicata);
          end;
      06: begin
            // Carrega e Imprime os dados do envelope
            DadosEnvelope := TDadosEnvelope.Create;
            with DadosEnvelope do
            begin
              // frente
              nomeDes := 'XXYZ Comercio Ltda' + Preenche;
              ruaDes := 'Rua Paraiba, 1233' + Preenche;
              bairroDes := 'Bairro : Velha' + Preenche;
              cidade_estadoDes := 'Blumenau - Santa Catarina' + Preenche;
              cepDes := '88959-000' + Preenche;
              ContatoDes := 'A/C : Marcelo' + Preenche;
              // verso
              nomeRem := 'Indata Sistema Ltda' + Preenche;
              ruaRem := 'Rua João Pessoa, 740' + Preenche;
              bairroRem := 'Bairro : Velha' + Preenche;
              cidade_estadoRem := 'Blumenau - Santa Catarina' + Preenche;
              cepRem := '89036-000' + Preenche;
           end;
           IMP.ImprimeEnvelope(DadosEnvelope);
         end;
    end;
  end;
  IMP.FechaImpressao(Config.ImpPorta, 'C:\IMP.TXT');
end;

{******************* altera um documento ************************************* }
procedure TFConfiguraImpressao.BAlterarClick(Sender: TObject);
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  DATA_CAD_DOC.AutoEdit := true;
  DATA_MOV_DOC.AutoEdit := true;
  MudaEstado(false);
end;

{***************** cria um novo documento apartir do modelo ****************** }
procedure TFConfiguraImpressao.BModeloClick(Sender: TObject);
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

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       funcoes diversas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********* evita a digitacao de numeros negativos ************************** }
procedure TFConfiguraImpressao.Negativo_keyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
   Key := '#';
end;

{********** no click de um tipo de documento configura o cad doc *************}
procedure TFConfiguraImpressao.RTipoDocumentoClick(Sender: TObject);
var
  VpfTipo: string;
begin
  if not (CAD_DOC.State in [dsInsert, dsEdit]) then
  begin
    DMes.Visible := RTipoDocumento.ItemIndex < 2;
    Copia.Visible := RTipoDocumento.ItemIndex = 1;
    case RTipoDocumento.ItemIndex of
      00 : VpfTipo := 'NOT';
      01 : VpfTipo := 'CHE';
      02 : VpfTipo := 'BOL';
      03 : VpfTipo := 'CAR';
      04 : VpfTipo := 'REC';
      05 : VpfTipo := 'DUP';
      06 : VpfTipo := 'ENV';
    end;
    IMP.LocalizaTipoDocumento(CAD_DOC, VpfTipo);
  end;
end;

{*************************** help ******************************************** }
procedure TFConfiguraImpressao.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FConfiguraImpressao.HelpContext);
end;

{ ****************** Muda os estados dos Botoes **************************** }
procedure TFConfiguraImpressao.MudaEstado( acao : Boolean );
begin
  BCadastrar.Enabled := acao;
  BAlterar.Enabled := acao;
  BExcluir.Enabled := acao;
  BGravar.Enabled := not acao;
  BCancelar.Enabled := not  acao;
  BExemplo.Enabled := acao;
  BFechar.Enabled := acao;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFConfiguraImpressao.BitBtn6Click(Sender: TObject);
begin
  InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, true);
  AtualizaSQLTabela(MOV_DOC);
end;

Initialization
  RegisterClasses([TFConfiguraImpressao]);
end.


