unit ADriveImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, ComCtrls, StdCtrls, Buttons, Componentes1,
  Mask, numericos, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation,
  DBCtrls, BotaoCadastro, UnImpressao, ConfigImpressora, Geradores,
  Localizacao, Registry;

type
  TFDriveImpressora = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    CAD_DRIVER: TSQL;
    DATACAD_DRIVER: TDataSource;
    ProximoCodigoDriver: TProximoCodigo;
    CAD_DRIVER_AUX: TQuery;
    DATACAD_DRIVER_AUX: TDataSource;
    Label35: TLabel;
    PanelColor3: TPanelColor;
    BitBtn6: TBitBtn;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoExcluir1: TBotaoExcluir;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    BitBtn2: TBitBtn;
    GridIndice1: TGridIndice;
    Label6: TLabel;
    ENomeImpressora: TDBEditColor;
    Drivers: TComponenteMove;
    Label13: TLabel;
    PanelColor6: TPanelColor;
    BContinuar: TBitBtn;
    BCancelar: TBitBtn;
    GridIndice2: TGridIndice;
    BAvancado: TBitBtn;
    BitBtn1: TBitBtn;
    ElocalImpressao: TEditColor;
    PLocalImpressao: TComponenteMove;
    Label1: TLabel;
    PanelColor2: TPanelColor;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ListaPorta: TListBoxColor;
    Blocaliza: TBitBtn;
    Label2: TLabel;
    CAD_DRIVERI_SEQ_IMP: TIntegerField;
    CAD_DRIVERI_COD_DRV: TIntegerField;
    CAD_DRIVERC_NOM_DRV: TStringField;
    CAD_DRIVERC_NOM_IMP: TStringField;
    CAD_DRIVERC_NEG_SIM: TStringField;
    CAD_DRIVERC_NEG_NAO: TStringField;
    CAD_DRIVERC_ITA_SIM: TStringField;
    CAD_DRIVERC_ITA_NAO: TStringField;
    CAD_DRIVERC_CND_SIM: TStringField;
    CAD_DRIVERC_CND_NAO: TStringField;
    CAD_DRIVERC_CPI_SIM: TStringField;
    CAD_DRIVERC_CPI_NAO: TStringField;
    CAD_DRIVERC_LIN_SIM: TStringField;
    CAD_DRIVERC_LIN_NAO: TStringField;
    CAD_DRIVERC_INI_IMP: TStringField;
    CAD_DRIVERC_MRG_ESQ: TStringField;
    CAD_DRIVERC_MRG_DIR: TStringField;
    CAD_DRIVERC_BEP_BEP: TStringField;
    CAD_DRIVERC_CHR_SEP: TStringField;
    CAD_DRIVERC_PAP_SIM: TStringField;
    CAD_DRIVERC_PAP_NAO: TStringField;
    CAD_DRIVERI_DRI_PAI: TIntegerField;
    CAD_DRIVERI_AMI_TIO: TIntegerField;
    CAD_DRIVERI_AMA_TIO: TIntegerField;
    CAD_DRIVERI_AMI_AGU: TIntegerField;
    CAD_DRIVERI_AMA_AGU: TIntegerField;
    CAD_DRIVERI_AMI_CRA: TIntegerField;
    CAD_DRIVERI_AMA_CRA: TIntegerField;
    CAD_DRIVERI_AMI_CIR: TIntegerField;
    CAD_DRIVERI_AMA_CIR: TIntegerField;
    CAD_DRIVERI_AMI_TRE: TIntegerField;
    CAD_DRIVERI_AMA_TRE: TIntegerField;
    CAD_DRIVERI_EMI_AGU: TIntegerField;
    CAD_DRIVERI_EMA_AGU: TIntegerField;
    CAD_DRIVERI_EMI_CIR: TIntegerField;
    CAD_DRIVERI_EMA_CIR: TIntegerField;
    CAD_DRIVERI_IMI_AGU: TIntegerField;
    CAD_DRIVERI_IMA_AGU: TIntegerField;
    CAD_DRIVERI_OMI_TIO: TIntegerField;
    CAD_DRIVERI_OMA_TIO: TIntegerField;
    CAD_DRIVERI_OMI_AGU: TIntegerField;
    CAD_DRIVERI_OMA_AGU: TIntegerField;
    CAD_DRIVERI_OMI_CIR: TIntegerField;
    CAD_DRIVERI_OMA_CIR: TIntegerField;
    CAD_DRIVERI_OMI_TRE: TIntegerField;
    CAD_DRIVERI_OMA_TRE: TIntegerField;
    CAD_DRIVERI_UMI_AGU: TIntegerField;
    CAD_DRIVERI_UMA_AGU: TIntegerField;
    CAD_DRIVERI_UMI_TRE: TIntegerField;
    CAD_DRIVERI_UMA_TRE: TIntegerField;
    CAD_DRIVERI_CMI_CED: TIntegerField;
    CAD_DRIVERI_CMA_CED: TIntegerField;
    CAD_DRIVERI_AMI_NUM: TIntegerField;
    CAD_DRIVERI_OMA_NUM: TIntegerField;
    Label24: TLabel;
    EditColor3: TEditColor;
    BitBtn5: TBitBtn;
    ConfigImpressora: TPrinterSetupDialog;
    CImpPorta: TDBCheckBox;
    CFG: TTabela;
    CFGC_IMP_PRT: TStringField;
    DataCFG: TDataSource;
    ComboBoxColor1: TComboBoxColor;
    Label3: TLabel;
    EPortaCheque: TEditColor;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure CAD_DRIVERAfterInsert(DataSet: TDataSet);
    procedure BotaoCadastrar1DepoisAtividade(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BContinuarClick(Sender: TObject);
    procedure CAD_DRIVERBeforePost(DataSet: TDataSet);
    procedure CAD_DRIVERAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BAvancadoClick(Sender: TObject);
    procedure BlocalizaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ElocalImpressaoExit(Sender: TObject);
    procedure BotaoCadastrar1Atividade(Sender: TObject);
    procedure BotaoGravar1Atividade(Sender: TObject);
    procedure CAD_DRIVERAfterScroll(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxColor1Change(Sender: TObject);
    procedure EPortaChequeExit(Sender: TObject);
  private
    { Private declarations }
    IMP : TFuncoesImpressao;
    procedure CopiaDriverImpressora;
  public
    { Public declarations }
  end;

var
  FDriveImpressora: TFDriveImpressora;

implementation

uses APrincipal, funObjeto,Constantes, FunSql, ConstMsg, FunString, UnClassesImprimir,
     AConfiguracaoImpressao, AComandosImpressora, Printers;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFDriveImpressora.FormCreate(Sender: TObject);
begin
  ComboBoxColor1.ItemIndex :=  varia.ImpressoraCheque;
  IMP := TFuncoesImpressao.Criar(self,FPrincipal.BaseDados);
  AdicionaSQLAbreTabela(CAD_DRIVER, 'SELECT * FROM CAD_DRIVER WHERE I_COD_DRV IS NULL');
  EditColor3.Text := varia.ImpressoraRelatorio;
  EPortaCheque.text := varia.PortaCheque;
  IniciallizaCheckBox([ CImpPorta ],'T','F');
  cfg.open;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFDriveImpressora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IMP.Destroy;
  cfg.close;
  CAD_DRIVER.close;
  Action := CaFree;
end;

{**************** fecha o formulario **************************************** }
procedure TFDriveImpressora.BFecharClick(Sender: TObject);
begin
  Close;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Instalacao de um novo drive
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********* cancela a instalacao de um novo drive *************************** }
procedure TFDriveImpressora.BCancelarClick(Sender: TObject);
begin
  Drivers.Visible := False;
  CAD_DRIVER.Cancel;
end;

{*** continua a instalacao de um novo drive apos o usuario escolher o drive ** }
procedure TFDriveImpressora.BContinuarClick(Sender: TObject);
var
  Nome: string;
begin
  CopiaDriverImpressora;
  CAD_DRIVER.FieldByname('I_DRI_PAI').AsInteger := CAD_DRIVER_AUX.fieldByName('I_COD_DRV').AsInteger;
  Drivers.Visible := False;
  Nome := CAD_DRIVER_AUX.FieldByName('C_NOM_DRV').AsString;
  Entrada('Instalação de Impressora', 'Informe o nome da impressora a ser instalada : ',
     Nome, False, clWhite, clBtnFace);
  CAD_DRIVER.FieldByname('C_NOM_IMP').AsString := NOME;
  ENomeImpressora.SetFocus;
  if CAD_DRIVER.State = dsInsert then
    CAD_DRIVER.Post;
end;


{************ Mostra uma lista de drives para instalacao ********************* }
procedure TFDriveImpressora.BotaoCadastrar1DepoisAtividade(
  Sender: TObject);
begin
  // Somente os registros que são drivers.
  AdicionaSQLAbreTabela(CAD_DRIVER_AUX,
    ' SELECT * FROM CAD_DRIVER ' +
    ' WHERE NOT I_COD_DRV IS NULL');
  if CAD_DRIVER_AUX.EOF then
    Aviso(CT_Drivers_Nao_Instalados)
  else
    Drivers.Visible  := True;
end;

{************** copia o drive do sistema para o drive do cliente ************* }
procedure TFDriveImpressora.CopiaDriverImpressora;
var
  Laco: Integer;
begin
    for Laco:=0 to (CAD_DRIVER.FieldCount -1) do
    begin
      if (CAD_DRIVER.Fields[Laco].FieldName <> 'I_SEQ_IMP') and
         (CAD_DRIVER.Fields[Laco].FieldName <> 'I_COD_DRV') and
         (CAD_DRIVER.Fields[Laco].FieldName <> 'C_NOM_IMP') and
         (CAD_DRIVER.Fields[Laco].FieldName <> 'I_DRI_PAI') then
        CAD_DRIVER.Fields[Laco].Value := CAD_DRIVER_AUX.Fields[Laco].Value;
    end;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Funcoes das tabela
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************* gera proximo codigo ****************************************** }
procedure TFDriveImpressora.CAD_DRIVERAfterInsert(DataSet: TDataSet);
begin
  ProximoCodigoDriver.Execute('CAD_DRIVER');
end;

{ ************** evita nome de drive de impressora sem nome ****************** }
procedure TFDriveImpressora.CAD_DRIVERBeforePost(DataSet: TDataSet);
begin
  if CAD_DRIVER.FieldByname('C_NOM_IMP').AsString = '' then
  begin
    Aviso('Informe o nome da Impressora Instalada.');
    ENomeImpressora.SetFocus;
    Abort;
  end;

end;

{*********** apos o post atualiza a tabela de drive ************************* }
procedure TFDriveImpressora.CAD_DRIVERAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CAD_DRIVER);
end;


{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }


procedure TFDriveImpressora.BitBtn1Click(Sender: TObject);
begin
  if not CAD_DRIVER.Eof then
  begin
   AdicionaSQLAbreTabela(CAD_DRIVER_AUX,
                         ' SELECT * FROM CAD_DRIVER ' +
                         ' WHERE I_COD_DRV = ' + CAD_DRIVER.FieldByname('I_DRI_PAI').AsString );

    CAD_DRIVER.edit;
    CopiaDriverImpressora;
    CAD_DRIVER.post;
  end;
end;

procedure TFDriveImpressora.BAvancadoClick(Sender: TObject);
begin
  FComandosImpressora := TFComandosImpressora. CriarSDI(application, '', true);
  FComandosImpressora.CarregaComandos(CAD_DRIVER.FieldByname('I_SEQ_IMP').AsInteger, ElocalImpressao.text);
end;

procedure TFDriveImpressora.BlocalizaClick(Sender: TObject);
var
 Ini : TRegIniFile;
 texto : TstringList;
 laco : integer;
 Endereco : string;
begin
  texto := TstringList.create;
  ListaPorta.Items.Clear;
  PLocalImpressao.Visible := true;
  Ini := TRegIniFile.Create('Network\Persistent');
  ini.ReadSections(texto);
  for laco := 0 to texto.count - 1 do
   if Length(texto[laco]) = 4 then
   begin
     endereco := ini.ReadString(texto[laco],'RemotePath', '');
     if Endereco <> '' then
       endereco := endereco + '\';
     ListaPorta.Items.Add( endereco +  texto[laco]   );
   end;
  ini.Free;
  texto.Free;
end;

procedure TFDriveImpressora.BitBtn3Click(Sender: TObject);
begin
  ElocalImpressao.text := ListaPorta.Items[ListaPorta.ItemIndex];
  PLocalImpressao.Visible := false;
  ElocalImpressao.SetFocus;
end;

procedure TFDriveImpressora.BitBtn4Click(Sender: TObject);
begin
  PLocalImpressao.Visible := false;
end;

procedure TFDriveImpressora.ElocalImpressaoExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  if ElocalImpressao.text <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteString('IMPRESSORA',CAD_DRIVER.FieldByname('i_seq_imp').AsString,ElocalImpressao.Text);
    ini.free;
  end;
end;

procedure TFDriveImpressora.BotaoCadastrar1Atividade(Sender: TObject);
begin
  ElocalImpressao.Enabled := true;
  Blocaliza.Enabled := true;
  cfg.edit;
end;

procedure TFDriveImpressora.BotaoGravar1Atividade(Sender: TObject);
begin
  ElocalImpressao.Enabled := false;
  Blocaliza.Enabled := false;
  if cfg.State in [ dsEdit, dsInsert ] then
   cfg.post;
end;

procedure TFDriveImpressora.CAD_DRIVERAfterScroll(DataSet: TDataSet);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ElocalImpressao.Text := ini.ReadString('IMPRESSORA',CAD_DRIVER.FieldByname('i_seq_imp').AsString,'');
  ini.free;
end;

procedure TFDriveImpressora.BitBtn5Click(Sender: TObject);
var
  ini : TRegIniFile;
begin
   if ConfigImpressora.Execute then
   begin
     ini := TRegIniFile.Create('Software\Systec\Sistema');
     ini.WriteString('IMPRESSORA','RELATORIO',printer.Printers[printer.PrinterIndex]);
     ini.free;
   end;
   EditColor3.Text := printer.Printers[printer.PrinterIndex];
   varia.ImpressoraRelatorio := printer.Printers[printer.PrinterIndex];
end;

procedure TFDriveImpressora.BitBtn2Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FDriveImpressora.HelpContext);
end;

procedure TFDriveImpressora.FormShow(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

{************** define a impressora de cheque ******************************* }
procedure TFDriveImpressora.ComboBoxColor1Change(Sender: TObject);
var
  ini : TRegIniFile;
begin
  if ElocalImpressao.text <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteString('IMPRESSORA','CHEQUE', IntToStr(ComboBoxColor1.ItemIndex));
    ini.free;
    varia.ImpressoraCheque := ComboBoxColor1.ItemIndex;
  end;
end;

procedure TFDriveImpressora.EPortaChequeExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  if ElocalImpressao.text <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteString('IMPRESSORA','PORTACHEQUE', EPortaCheque.text);
    ini.free;
    varia.PortaCheque := EPortaCheque.text;
  end;
end;

Initialization
  RegisterClasses([TFDriveImpressora]);
end.


