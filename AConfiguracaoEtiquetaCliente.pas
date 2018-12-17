unit AConfiguracaoEtiquetaCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, ComCtrls, StdCtrls, Buttons, Componentes1,
  Mask, numericos, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation,
  DBCtrls, BotaoCadastro, UnImpressao, ConfigImpressora, Geradores,
  Localizacao;

type
  TFConfiguracaoEtiquetaCliente = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    DocPage: TPageControl;
    DocTab: TTabSheet;
    CAD_DOC: TSQL;
    DATA_CAD_DOC: TDataSource;
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
    GDoc: TGridIndice;
    MOV_DOCC_DIR_ESQ: TStringField;
    MOV_DOCI_TAM_CAM: TIntegerField;
    PanelColor2: TPanelColor;
    BFechar: TBitBtn;
    BCadastrar: TBitBtn;
    BExcluir: TBitBtn;
    BGravar: TBitBtn;
    BCancelar: TBitBtn;
    BExemplo: TBitBtn;
    ProximoCodigoDocumento: TProximoCodigo;
    MOV_DOCC_FLA_NEG: TStringField;
    MOV_DOCC_FLA_ITA: TStringField;
    MOV_DOCC_FLA_CND: TStringField;
    MOV_DOCC_FLA_RED: TStringField;
    BBAjuda: TBitBtn;
    Label35: TLabel;
    BAlterar: TBitBtn;
    AUX: TQuery;
    BModelo: TBitBtn;
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
    BVisualiza: TBitBtn;
    CAD_DOCN_DIV_CUS: TFloatField;
    CAD_DOCC_CRI_DAT: TStringField;
    PTempo: TPainelTempo;
    ETeste: TEditColor;
    Label4: TLabel;
    CAD_DRIVER_AUX: TQuery;
    DATACAD_DRIVER_AUX: TDataSource;
    CAD_DOCI_SEQ_IMP: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEditColor;
    DBEdit2: TDBEditColor;
    DBEdit3: TDBEditColor;
    DBEdit4: TDBEditColor;
    DBEdit5: TDBEditColor;
    DBEdit7: TDBEditColor;
    DBEdit8: TDBEditColor;
    DBEdit9: TDBEditColor;
    DBEdit10: TDBEditColor;
    DBEditColor2: TDBEditColor;
    DBEditChar1: TDBEditChar;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EQtdDoc: TDBEditColor;
    ERodDoc: TDBEditColor;
    ECabPag: TDBEditColor;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label7: TLabel;
    CPadrao: TDBLookupComboBoxColor;
    CAD_DOCI_QTD_PAG: TIntegerField;
    CAD_DOCN_ROD_DOC: TFloatField;
    CAD_DOCN_CAB_PAG: TFloatField;
    CAD_DOCC_CHR_DIR: TStringField;
    CAD_DOCC_CHR_ESQ: TStringField;
    CAD_DOCC_FLA_LIN: TStringField;
    CAD_DOCC_FLA_PAP: TStringField;
    CAD_DOCC_FLA_EXT: TStringField;
    CAD_DOCC_FLA_COP: TStringField;
    Label17: TLabel;
    DBEditColor1: TDBEditColor;
    PanelColor3: TPanelColor;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
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
    procedure MOV_DOCBeforePost(DataSet: TDataSet);
    procedure BAlterarClick(Sender: TObject);
    procedure BModeloClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BVisualizaClick(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    IMP : TFuncoesImpressao;
    procedure InicializaItens(NroDoc: Integer; Atualizar : Boolean);
    procedure MudaEstado( acao : Boolean );
  public
    { Public declarations }
  end;

var
  FConfiguracaoEtiquetaCliente: TFConfiguracaoEtiquetaCliente;

implementation

uses APrincipal, Constantes, FunSql, ConstMsg, FunString, UnClassesImprimir,
   funsistema, AImprimeEtiquetaCliente;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguracaoEtiquetaCliente.FormCreate(Sender: TObject);
begin
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  IMP.LocalizaTipoDocumento(CAD_DOC, 'ETI');
  AdicionaSQLAbreTabela(CAD_DRIVER_AUX,' SELECT * FROM CAD_DRIVER ' +
                                       ' WHERE I_COD_DRV IS NULL '); // Somente Impresoras.

end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguracaoEtiquetaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
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

{********* ao inicializar o formulario ************************************* }
procedure TFConfiguracaoEtiquetaCliente.FormShow(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

procedure TFConfiguracaoEtiquetaCliente.BVisualizaClick(Sender: TObject);
begin
{  if not VerificaFormCriado('TFImprimeEtiquetaBarra') then
     FImprimeEtiquetaBarra := TFImprimeEtiquetaBarra.CriarSDI(application, '', true);

  FImprimeEtiquetaBarra.VisualizaBarra( CAD_DOCI_NRO_DOC.AsInteger,ComboBoxColor1.ItemIndex ,1);
  FImprimeEtiquetaBarra.ShowModal;}
end;


{**************** fecha formulario ****************************************** }
procedure TFConfiguracaoEtiquetaCliente.BFecharClick(Sender: TObject);
begin
  Close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                     Funcoes das tabelas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** depois do insert de um novo documento ************************ }
procedure TFConfiguracaoEtiquetaCliente.CAD_DOCAfterInsert(DataSet: TDataSet);
begin
  ProximoCodigoDocumento.Execute('CAD_DOC') ;
  CAD_DOCD_DAT_DOC.AsDateTime := Date;
  CAD_DOCN_ALT_ETI.AsFloat := 25.4;
  CAD_DOCN_COM_ETI.AsFloat := 66.7;
  CAD_DOCN_ESP_VER.AsFloat := 3;
  CAD_DOCN_ESP_HOR.AsFloat := 0;
  CAD_DOCN_MAR_ESQ.AsFloat :=5;
  CAD_DOCN_MAR_SUP.AsFloat := 13;
  CAD_DOCN_MAR_INF.AsFloat := 13;
  CAD_DOCN_LIN_ETI.AsFloat := 10;
  CAD_DOCN_COL_ETI.AsFloat := 2;
  CAD_DOCI_TAM_BAR.AsInteger := 0;
  CAD_DOCI_ALT_BAR.AsInteger := 50;
  CAD_DOCN_MAR_DIR.AsInteger := 5;
  CAD_DOCC_IMP_COD.AsString := 'S';
  CAD_DOCC_CRI_DAT.AsString := 'S';
  CAD_DOCN_DIV_CUS.AsFloat := 0;

  CAD_DOCI_SEQ_IMP.Value := CAD_DRIVER_AUX.FieldByName('I_SEQ_IMP').Value;
  CAD_DOCN_CAB_PAG.AsInteger := 0;
  CAD_DOCN_ROD_DOC.AsInteger := 1;
  CAD_DOCI_QTD_PAG.AsInteger := 12;
  CAD_DOCC_FLA_LIN.AsString := 'N';
  CAD_DOCC_FLA_PAP.AsString := 'S';
end;

{**************** Antes do post da tabela ********************************** }
procedure TFConfiguracaoEtiquetaCliente.CAD_DOCBeforePost(DataSet: TDataSet);
begin
  if CAD_DOC.State = dsInsert then
    ProximoCodigoDocumento.VerificaCodigo;
end;

{****************** Depois do Post do cad documentos ************************* }
procedure TFConfiguracaoEtiquetaCliente.CAD_DOCAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CAD_DOC);
  CAD_DOC.Last;
  IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

{*************** pocisiona o mov doc donforme o cad doc ********************** }
procedure TFConfiguracaoEtiquetaCliente.CAD_DOCAfterScroll(DataSet: TDataSet);
begin
  BExemplo.Enabled := not CAD_DOC.EOF;
  if CAD_DOC.EOF then
    FechaTabela(MOV_DOC)
  else
    IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

{****************** antes da edicao do cad doc ****************************** }
procedure TFConfiguracaoEtiquetaCliente.CAD_DOCBeforeEdit(DataSet: TDataSet);
begin
  if not FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.StartTransaction;
end;

{************** Garante que o texto digitado ser S ou s ou N ou n ********** }
procedure TFConfiguracaoEtiquetaCliente.SetText_SN(Sender: TField;
  const Text: String);
begin
  if (text = 's') or (text =  'S' ) then
    sender.Value := 'S';
  if (text = 'n') or (text =  'N' ) then
    sender.Value := 'N';
end;

{***************** antes do Insert ***************************************** }
procedure TFConfiguracaoEtiquetaCliente.MOV_DOCBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

{********************* antes do Delete ************************************* }
procedure TFConfiguracaoEtiquetaCliente.MOV_DOCBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

{************** Garante que o texto digitado ser D ou d ou E ou e ********** }
procedure TFConfiguracaoEtiquetaCliente.SetText_DE(Sender: TField;
  const Text: String);
begin
  if (text = 'd') or (text =  'D' ) then
    sender.Value := 'D';
  if (text = 'e') or (text =  'E' ) then
    sender.Value := 'E';
end;

{****************** antes do post do mov doc ********************************* }
procedure TFConfiguracaoEtiquetaCliente.MOV_DOCBeforePost(DataSet: TDataSet);
begin
  // Se for condensado não pode ser negrito.
  if ((MOV_DOCC_FLA_CND.AsString = 'S') and (MOV_DOCC_FLA_NEG.AsString = 'S')) then
  begin
    MOV_DOCC_FLA_NEG.AsString := 'N';
    Aviso('O Campo não pode ser NEGRITO  e CONDENSADO ao mesmo tempo.');
  end;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       funcoes diversas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********* evita a digitacao de numeros negativos ************************** }
procedure TFConfiguracaoEtiquetaCliente.Negativo_keyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
   Key := '#';
end;

{ ****************** Muda os estados dos Botoes **************************** }
procedure TFConfiguracaoEtiquetaCliente.MudaEstado( acao : Boolean );
begin
  BCadastrar.Enabled := acao;
  BAlterar.Enabled := acao;
  BExcluir.Enabled := acao;
  BGravar.Enabled := not acao;
  BCancelar.Enabled := not  acao;
  BExemplo.Enabled := acao;
  BVisualiza.Enabled := acao;
  BFechar.Enabled := acao;
end;

{ *********************** Inicializa itens do mov documentos **************** }
procedure TFConfiguracaoEtiquetaCliente.InicializaItens(NroDoc: Integer; Atualizar : Boolean);
begin                   //  nº    col  lin fonte Vis     nome      direita/esquerda
  if RadioButton1.Checked then
  begin
    IMP.InsereMovDoc(NroDoc,  1,     03,  1,  55, 'S', 'Nome', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  2,     63,  1,  55, 'S', 'Nome1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  3,     100, 1,  55, 'N', 'Nome2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  4,     03,  2,  55, 'S', 'Endereco', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  5,     63,  2,  55, 'S', 'Endereco1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  6,     100,  2,  55, 'N','Endereco2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  7,     03,  3,  55, 'S', 'Bairro', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  8,     63,  3,  55, 'S', 'Bairro1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  9,     100,  3,  55, 'N', 'Bairro2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  10,     03,  4,  30, 'S', 'Cidade', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  11,     63,  4,  30, 'S', 'Cidade1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  12,     100,  4,  30, 'N', 'Cidade2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  13,     35,  4,  06, 'S', 'Estado', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  14,     95,  4,  06, 'S', 'Estado1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  15,     125,  4,  06, 'N', 'Estado2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  16,     03,  5,  14, 'S', 'CEP', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  17,     63,  5,  14, 'S', 'CEP1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  18,     100,  5,  14, 'N', 'CEP2', 'E', 'S', 'N', atualizar);

    IMP.InsereMovDoc(NroDoc,  19,     03,  6,  10, 'N', 'Complemento', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  20,     63,  6,  10, 'N', 'Complemento1', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  21,     100,  6,  10, 'N', 'Complemento2', 'E', 'S', 'N', atualizar);
  end
  else
  begin
    IMP.InsereMovDoc(NroDoc,  1,     03,  1,  55, 'S', 'Nome', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  2,     03,  2,  55, 'S', 'Endereco', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  3,     03,  3,  55, 'S', 'Bairro', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  4,     03,  4,  30, 'S', 'Cidade', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  5,     35,  4,  06, 'S', 'Estado', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  6,     03,  5,  14, 'S', 'CEP', 'E', 'S', 'N', atualizar);
    IMP.InsereMovDoc(NroDoc,  7,     03,  6,  10, 'N', 'Complemento', 'E', 'S', 'N', atualizar);
  end;
  AtualizaSQLTabela(MOV_DOC);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       Funcoes do botoes inferiores
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{**************** cadastrar documento ************************************** }
procedure TFConfiguracaoEtiquetaCliente.BCadastrarClick(Sender: TObject);
var
  VpfNovo,
  VpfMsg : string;
begin
 DATA_CAD_DOC.AutoEdit := true;
 if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  MudaEstado(false);
  try

    VpfMsg := 'de CODIGO BARRA';

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
        CAD_DOCC_TIP_DOC.AsString := 'ETI';
        CAD_DOC.Post;
        InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, false);
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

{******************* altera um documento ************************************* }
procedure TFConfiguracaoEtiquetaCliente.BAlterarClick(Sender: TObject);
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  DATA_CAD_DOC.AutoEdit := true;
  DATA_MOV_DOC.AutoEdit := true;
  MudaEstado(false);
end;

{***************** Excluir documento **************************************** }
procedure TFConfiguracaoEtiquetaCliente.BExcluirClick(Sender: TObject);
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

{********************* grava documento ************************************** }
procedure TFConfiguracaoEtiquetaCliente.BGravarClick(Sender: TObject);
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
procedure TFConfiguracaoEtiquetaCliente.BCancelarClick(Sender: TObject);
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

{***************** cria um exemplo do documento selecionado ***************** }
procedure TFConfiguracaoEtiquetaCliente.BExemploClick(Sender: TObject);
var
  Dados : TDadosEtiquetaCliente;
  Preenche : string;
  i : integer;
begin
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;

  if PageControl1.ActivePage = TabSheet1 then
  begin
    Preenche:= '';
    if ETeste.Text <> '' then
      Preenche:=AdicionaCharD(ETeste.Text[1], Preenche, 200);
    IMP.InicializaImpressao(CAD_DOCI_NRO_DOC.AsInteger, CAD_DOCI_SEQ_IMP.AsInteger);

    for I := 1  to 5 do
    begin
      Dados := TDadosEtiquetaCliente.create;

       with Dados do
       begin
         Nome := 'Indata Sistemas Ltda' + Preenche;
         Endereco := 'Rua : João Pessoa';
         Bairro := 'Bairro : Velha' + Preenche;
         Cidade := 'Blumenau' +  Preenche;
         Estado := 'SC' +  Preenche;
         CEP := '89100-000' + Preenche;
         Complemento := ' Loja 1 ' + Preenche;
         Nome1 := 'Indata Sistemas Ltda' + Preenche;
         Endereco1 := 'Rua : João Pessoa';
         Bairro1 := 'Bairro : Velha' + Preenche;
         Cidade1 := 'Blumenau' +  Preenche;
         Estado1 := 'SC' +  Preenche;
         CEP1 := '89100-000' + Preenche;
         Complemento1 := ' Loja 1 ' + Preenche;
         Nome2 := 'Indata Sistemas Ltda' + Preenche;
         Endereco2 := 'Rua : João Pessoa';
         Bairro2 := 'Bairro : Velha' + Preenche;
         Cidade2 := 'Blumenau' +  Preenche;
         Estado2 := 'SC' +  Preenche;
         CEP2 := '89100-000' + Preenche;
         Complemento2 := ' Loja 1 ' + Preenche;
       end;
       IMP.ImprimeEtiquetaCliente(Dados);
     end;
     IMP.FechaImpressao(Config.ImpPorta, 'C:\IMP.TXT');
  end
  else
  begin
    if not VerificaFormCriado('TFImprimeEtiquetaCliente') then
       FImprimeEtiquetaCliente := TFImprimeEtiquetaCliente.CriarSDI(application, '', true);
    FImprimeEtiquetaCliente.ImprimeCliente(CAD_DOCI_NRO_DOC.AsInteger, 'Select * from cadclientes where i_cod_cli < 500');
    FImprimeEtiquetaCliente.Pagina.Preview;
    FImprimeEtiquetaCliente.close;
  end;
end;


{***************** cria um novo documento apartir do modelo ****************** }
procedure TFConfiguracaoEtiquetaCliente.BModeloClick(Sender: TObject);
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
  VpfNomeModelo := CAD_DOCC_NOM_DOC.AsString;
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


{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFConfiguracaoEtiquetaCliente.DBEdit9Exit(Sender: TObject);
begin
  if CAD_DOCN_COL_ETI.AsCurrency > 3 then
  begin
    aviso('A quantidade de etiqueta não pode ser maior que 3');
    ( sender as TDBEditColor).SetFocus;
  end
end;

procedure TFConfiguracaoEtiquetaCliente.RadioButton2Click(Sender: TObject);
begin
  TabSheet2.TabVisible := true;
  TabSheet1.TabVisible := false;
end;

procedure TFConfiguracaoEtiquetaCliente.RadioButton1Click(Sender: TObject);
begin
  TabSheet1.TabVisible := true;
  TabSheet2.TabVisible := false;
end;

procedure TFConfiguracaoEtiquetaCliente.BitBtn6Click(Sender: TObject);
begin
  InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, true);
  AtualizaSQLTabela(MOV_DOC);
end;

Initialization
  RegisterClasses([TFConfiguracaoEtiquetaCliente]);
end.


