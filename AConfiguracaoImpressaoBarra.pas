unit AConfiguracaoImpressaoBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, ComCtrls, StdCtrls, Buttons, Componentes1,
  Mask, numericos, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation,
  DBCtrls, BotaoCadastro, UnImpressao, ConfigImpressora, Geradores,
  Localizacao;

type
  TFConfiguraImpressaoBarra = class(TFormularioPermissao)
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
    Label1: TLabel;
    DBEdit1: TDBEditColor;
    Label2: TLabel;
    DBEdit2: TDBEditColor;
    Label3: TLabel;
    DBEdit3: TDBEditColor;
    Label5: TLabel;
    DBEdit4: TDBEditColor;
    Label6: TLabel;
    DBEdit5: TDBEditColor;
    Label8: TLabel;
    DBEdit7: TDBEditColor;
    Label9: TLabel;
    DBEdit8: TDBEditColor;
    Label10: TLabel;
    DBEdit9: TDBEditColor;
    Label11: TLabel;
    DBEdit10: TDBEditColor;
    Label12: TLabel;
    CAD_DOCN_COM_ETI: TFloatField;
    CAD_DOCN_COL_ETI: TFloatField;
    CAD_DOCN_MAR_ESQ: TFloatField;
    DBComboBoxColor1: TDBComboBoxColor;
    CAD_DOCI_ALT_BAR: TIntegerField;
    Label7: TLabel;
    DBEditColor1: TDBEditColor;
    CodBarra: TQuery;
    DataCodBarra: TDataSource;
    DBLookupComboBoxColor1: TDBLookupComboBoxColor;
    CAD_DOCI_COD_BAR: TIntegerField;
    ComboBoxColor1: TComboBoxColor;
    Label13: TLabel;
    DBEditColor2: TDBEditColor;
    Label14: TLabel;
    CAD_DOCN_MAR_DIR: TFloatField;
    CAD_DOCC_IMP_COD: TStringField;
    BVisualiza: TBitBtn;
    DBEditChar1: TDBEditChar;
    CAD_DOCN_DIV_CUS: TFloatField;
    CAD_DOCC_CRI_DAT: TStringField;
    Label15: TLabel;
    DBEditChar2: TDBEditChar;
    Label16: TLabel;
    DBEditColor3: TDBEditColor;
    PTempo: TPainelTempo;
    Label4: TLabel;
    CAD_DOCC_FLA_COP: TStringField;
    Label17: TLabel;
    DBEditChar3: TDBEditChar;
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
    procedure CAD_DOCI_COD_BARChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure BVisualizaClick(Sender: TObject);
    procedure DBEditColor1Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
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
  FConfiguraImpressaoBarra: TFConfiguraImpressaoBarra;

implementation

uses APrincipal, Constantes, FunSql, ConstMsg, FunString, UnClassesImprimir,
  funsistema;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguraImpressaoBarra.FormCreate(Sender: TObject);
begin
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  IMP.LocalizaTipoDocumento(CAD_DOC, 'CDB');
  CodBarra.open;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguraImpressaoBarra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FPrincipal.BaseDados.InTransaction then
  begin
    if Confirmacao('Deseja gravar as alterações efetuadas ?') then
      FPrincipal.BaseDados.Commit
    else
      FPrincipal.BaseDados.Rollback;
  end;
  IMP.Destroy;
  CodBarra.close;
  Action := CaFree;
end;

{********* ao inicializar o formulario ************************************* }
procedure TFConfiguraImpressaoBarra.FormShow(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  CAD_DOCI_COD_BARChange(nil);
end;

procedure TFConfiguraImpressaoBarra.BVisualizaClick(Sender: TObject);
begin
  if not VerificaFormCriado('TFImprimeEtiquetaBarra') then
 //    FImprimeEtiquetaBarra := TFImprimeEtiquetaBarra.CriarSDI(application, '', true);

//  FImprimeEtiquetaBarra.VisualizaBarra( CAD_DOCI_NRO_DOC.AsInteger,ComboBoxColor1.ItemIndex ,1);
//  FImprimeEtiquetaBarra.ShowModal;
end;


{**************** fecha formulario ****************************************** }
procedure TFConfiguraImpressaoBarra.BFecharClick(Sender: TObject);
begin
  Close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                     Funcoes das tabelas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** depois do insert de um novo documento ************************ }
procedure TFConfiguraImpressaoBarra.CAD_DOCAfterInsert(DataSet: TDataSet);
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
  CAD_DOCN_COL_ETI.AsFloat := 3;
  CAD_DOCI_TAM_BAR.AsInteger := 0;
  CAD_DOCI_ALT_BAR.AsInteger := 50;
  CAD_DOCN_MAR_DIR.AsInteger := 5;
  CAD_DOCC_IMP_COD.AsString := 'S';
  CAD_DOCC_CRI_DAT.AsString := 'S';
  CAD_DOCN_DIV_CUS.AsFloat := 0;
  CAD_DOCC_FLA_COP.AsString := 'S';
end;

{**************** Antes do post da tabela ********************************** }
procedure TFConfiguraImpressaoBarra.CAD_DOCBeforePost(DataSet: TDataSet);
begin
  if CAD_DOC.State = dsInsert then
    ProximoCodigoDocumento.VerificaCodigo;
end;

{****************** Depois do Post do cad documentos ************************* }
procedure TFConfiguraImpressaoBarra.CAD_DOCAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CAD_DOC);
  CAD_DOC.Last;
  IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
end;

{*************** pocisiona o mov doc donforme o cad doc ********************** }
procedure TFConfiguraImpressaoBarra.CAD_DOCAfterScroll(DataSet: TDataSet);
begin
  BExemplo.Enabled := not CAD_DOC.EOF;
  if CAD_DOC.EOF then
    FechaTabela(MOV_DOC)
  else
    IMP.LocalizaItems(MOV_DOC, CAD_DOCI_NRO_DOC.AsInteger);
  if self.Visible then
    CAD_DOCI_COD_BARChange(nil);
end;

{****************** antes da edicao do cad doc ****************************** }
procedure TFConfiguraImpressaoBarra.CAD_DOCBeforeEdit(DataSet: TDataSet);
begin
  if not FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.StartTransaction;
end;

{************** Garante que o texto digitado ser S ou s ou N ou n ********** }
procedure TFConfiguraImpressaoBarra.SetText_SN(Sender: TField;
  const Text: String);
begin
  if (text = 's') or (text =  'S' ) then
    sender.Value := 'S';
  if (text = 'n') or (text =  'N' ) then
    sender.Value := 'N';
end;

{***************** antes do Insert ***************************************** }
procedure TFConfiguraImpressaoBarra.MOV_DOCBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

{********************* antes do Delete ************************************* }
procedure TFConfiguraImpressaoBarra.MOV_DOCBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

{************** Garante que o texto digitado ser D ou d ou E ou e ********** }
procedure TFConfiguraImpressaoBarra.SetText_DE(Sender: TField;
  const Text: String);
begin
  if (text = 'd') or (text =  'D' ) then
    sender.Value := 'D';
  if (text = 'e') or (text =  'E' ) then
    sender.Value := 'E';
end;

{****************** antes do post do mov doc ********************************* }
procedure TFConfiguraImpressaoBarra.MOV_DOCBeforePost(DataSet: TDataSet);
begin
  // Se for condensado não pode ser negrito.
  if ((MOV_DOCC_FLA_CND.AsString = 'S') and (MOV_DOCC_FLA_NEG.AsString = 'S')) then
  begin
    MOV_DOCC_FLA_NEG.AsString := 'N';
    Aviso('O Campo não pode ser NEGRITO  e CONDENSADO ao mesmo tempo.');
  end;
end;

{*********** atualiza o nome do codigo de barra, ean_13, ean_8 etc ************* }
procedure TFConfiguraImpressaoBarra.CAD_DOCI_COD_BARChange(Sender: TField);
begin
  if CodBarra.fieldByname('C_COD_BAR').AsString  <> '' then
    ComboBoxColor1.ItemIndex := StrToInt(CodBarra.fieldByname('C_COD_BAR').AsString[1]);
end;

{************* no exit da altura da barra *********************************** }
procedure TFConfiguraImpressaoBarra.DBEditColor1Exit(Sender: TObject);
begin
  if not ( CAD_DOCI_ALT_BAR.AsInteger in [20..100] )then
  begin
    Aviso('A altura da barra deve estar estre 20..100.');
    DBEditColor1.SetFocus;
    abort;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       funcoes diversas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********* evita a digitacao de numeros negativos ************************** }
procedure TFConfiguraImpressaoBarra.Negativo_keyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
   Key := '#';
end;

{ ****************** Muda os estados dos Botoes **************************** }
procedure TFConfiguraImpressaoBarra.MudaEstado( acao : Boolean );
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
procedure TFConfiguraImpressaoBarra.InicializaItens(NroDoc: Integer; Atualizar : Boolean);
begin                   //  nº    col  lin fonte Vis     nome              direita/esquerda
  IMP.InsereMovDoc(NroDoc,  1,     10,  15,  10, 'S', 'Barra', 'E', 'N', 'N', atualizar);
  IMP.InsereMovDoc(NroDoc,  2,     10,  28,  10, 'S', 'Nome Produto', 'E', 'N', 'N', atualizar);
  IMP.InsereMovDoc(NroDoc,  3,     10,  32,  10, 'S', 'Valor Produto', 'E', 'N', 'N', atualizar);
  IMP.InsereMovDoc(NroDoc,  4,     40,  32,  10, 'S', 'Data Impressão', 'E', 'N', 'N', atualizar);
  IMP.InsereMovDoc(NroDoc,  5,     70,  32,  10, 'S', 'Valor Compra', 'E', 'N', 'N', atualizar);
  IMP.InsereMovDoc(NroDoc,  6,     5,   15,  10, 'S', 'Codigo Produto', 'E', 'N', 'N', atualizar);
  AtualizaSQLTabela(MOV_DOC);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       Funcoes do botoes inferiores
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{**************** cadastrar documento ************************************** }
procedure TFConfiguraImpressaoBarra.BCadastrarClick(Sender: TObject);
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
        CAD_DOCC_TIP_DOC.AsString := 'CDB';
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
procedure TFConfiguraImpressaoBarra.BAlterarClick(Sender: TObject);
begin
  if not FPrincipal.BaseDados.InTransaction  then
    FPrincipal.BaseDados.StartTransaction;
  DATA_CAD_DOC.AutoEdit := true;
  DATA_MOV_DOC.AutoEdit := true;
  MudaEstado(false);
end;

{***************** Excluir documento **************************************** }
procedure TFConfiguraImpressaoBarra.BExcluirClick(Sender: TObject);
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
procedure TFConfiguraImpressaoBarra.BGravarClick(Sender: TObject);
begin
  if not CAD_DOCI_COD_BAR.IsNull then
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
  end
  else
  begin
    aviso( 'Você deve escolher o código de barra para a impressão ');
    DBLookupComboBoxColor1.SetFocus;
  end;
end;

{******************* Cancela documento ************************************* }
procedure TFConfiguraImpressaoBarra.BCancelarClick(Sender: TObject);
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
procedure TFConfiguraImpressaoBarra.BExemploClick(Sender: TObject);
var
  seqpro, qdade : TstringList;
begin
  seqpro := TstringList.create;
  qdade := TstringList.create;
  if MOV_DOC.State in [dsInsert, dsEdit] then
    MOV_DOC.Post;
  if CAD_DOC.State in [dsInsert, dsEdit] then
    CAD_DOC.Post;

  if not VerificaFormCriado('TFImprimeEtiquetaBarra') then
   //  FImprimeEtiquetaBarra := TFImprimeEtiquetaBarra.CriarSDI(application, '', true)
  else
   // FImprimeEtiquetaBarra.Visible := false;

  seqpro.add('1');
  seqpro.add('100');
  Qdade.add('10');
  qdade.add('10');
  imp.AdicionaItemsTemporaria(1,seqpro,qdade);
//  FImprimeEtiquetaBarra.ImprimeBarra( CAD_DOCI_NRO_DOC.AsInteger,ComboBoxColor1.ItemIndex);
//  FImprimeEtiquetaBarra.Pagina.Preview;
//  FImprimeEtiquetaBarra.close;
  seqpro.free;
  qdade.free;
end;


{***************** cria um novo documento apartir do modelo ****************** }
procedure TFConfiguraImpressaoBarra.BModeloClick(Sender: TObject);
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

procedure TFConfiguraImpressaoBarra.DBEdit9Exit(Sender: TObject);
begin
  if (CAD_DOCN_LIN_ETI.AsCurrency * CAD_DOCN_COL_ETI.AsCurrency) >= 400 then
  begin
    aviso('A quantidade de etiqueta não pode ser maior que 399 ');
    ( sender as TDBEditColor).SetFocus;
  end
end;

procedure TFConfiguraImpressaoBarra.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguraImpressaoBarra.HelpContext);
end;

procedure TFConfiguraImpressaoBarra.BitBtn6Click(Sender: TObject);
begin
  InicializaItens(CAD_DOCI_NRO_DOC.AsInteger, true);
  AtualizaSQLTabela(MOV_DOC);
end;

Initialization
  RegisterClasses([TFConfiguraImpressaoBarra]);
end.


