unit AConfiguracaoFiscal;
{          Autor: Sergio Luiz Censi
    Data Criação: 01/04/1999;
          Função: configurações das variáveis do sistema
  Data Alteração: 01/04/1999;
    Alterado por: Rafael Budag
Motivo alteração: - Adicionado os comentários e o blocos nas rotinas, e realizado
                    um teste - 01/04/199 / Rafael Budag
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, formularios, constMsg, DBCtrls, Tabela,
  Mask, Db, DBTables, BotaoCadastro, Buttons, Componentes1, constantes,
  ColorGrd, LabelCorMove,  Grids, DBGrids, Registry, PainelGradiente,
  Localizacao, UnImpressao;

type
  TFConfiguracoesFiscal = class(TFormularioPermissao)
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
    DataNumeroSerie: TDataSource;
    CadNumeroSerie: TSQL;
    SeriePadrao: TQuery;
    DataSeriePadrao: TDataSource;
    TabSheet1: TTabSheet;
    MostraParcelas: TDBCheckBox;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    PortaECF: TEditColor;
    Label17: TLabel;
    DBEditColor11: TDBEditColor;
    Label46: TLabel;
    DBEditLocaliza7: TDBEditLocaliza;
    SpeedButton7: TSpeedButton;
    Label43: TLabel;
    Label48: TLabel;
    DBMemoColor1: TDBMemoColor;
    Label18: TLabel;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label51: TLabel;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoExcluir1: TBotaoExcluir;
    DBGridColor1: TDBGridColor;
    DBLookupComboBoxColor2: TDBLookupComboBoxColor;
    BotaoGravar2: TBotaoGravar;
    BotaoCancelar2: TBotaoCancelar;
    CFGC_PAT_ECF: TStringField;
    CFGC_EST_ICM: TStringField;
    CFGL_TEX_PRO: TMemoField;
    CFGN_DES_NOT: TFloatField;
    CFGC_ALT_VLR: TStringField;
    CFGC_DES_NOT: TStringField;
    CFGC_OPE_ECF: TIntegerField;
    CFGC_MOS_PAR: TStringField;
    CFGN_PER_ISQ: TFloatField;
    CFGC_SER_NOT: TStringField;
    CFGC_SEN_ALT: TStringField;
    Label20: TLabel;
    DBComboBoxUF1: TDBComboBoxUF;
    Aux: TQuery;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    ENotaPAdrao: TDBEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label44: TLabel;
    MReducao: TDBMemoColorLimite;
    Label3: TLabel;
    MAdicionais: TDBMemoColorLimite;
    CadFiliais: TQuery;
    DataCadFiliais: TDataSource;
    DBGridColor2: TDBGridColor;
    CFGI_IMP_ECF: TIntegerField;
    ctipoEcf: TComboBoxColor;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    EPlano: TDBEditNumerico;
    CFGC_PLA_ECF: TStringField;
    CFGI_DES_MAI: TIntegerField;
    CFGC_SEN_LIB: TStringField;
    TabSheet5: TTabSheet;
    Label42: TLabel;
    DBEditColor14: TDBEditColor;
    DBRadioGroup1: TDBRadioGroup;
    DCAltVlrUniNot: TDBCheckBox;
    DCDescontoNota: TDBCheckBox;
    DCAlterarVrlUnitario: TDBCheckBox;
    CFGI_BOL_PAD: TIntegerField;
    Boleto: TQuery;
    DataBoleto: TDataSource;
    DadosBoleto: TQuery;
    DataDadosBoleto: TDataSource;
    CFGI_DAD_BOL: TIntegerField;
    UsarGaveta: TCheckBox;
    CTEF: TDBCheckBox;
    CFGC_USA_TEF: TStringField;
    CFGI_CLI_DEV: TIntegerField;
    EClienteDevolucao: TDBEditLocaliza;
    Label9: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    BBAjuda: TBitBtn;
    CFGc_cli_cup: TStringField;
    CDadosClienteCupom: TDBCheckBox;
    TabSheet6: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    CFGI_LAY_ECF: TIntegerField;
    Notebook1: TNotebook;
    PanelColor2: TPanelColor;
    PainelGradiente2: TPainelGradiente;
    PanelColor3: TPanelColor;
    PanelColor4: TPanelColor;
    PanelColor5: TPanelColor;
    PanelColor6: TPanelColor;
    StringGrid1: TStringGrid;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    PanelColor7: TPanelColor;
    PainelGradiente3: TPainelGradiente;
    PanelColor8: TPanelColor;
    Shape13: TShape;
    PanelColor9: TPanelColor;
    PanelColor10: TPanelColor;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    PanelColor11: TPanelColor;
    Shape19: TShape;
    Shape22: TShape;
    StringGrid2: TStringGrid;
    PanelColor12: TPanelColor;
    Label19: TLabel;
    Label21: TLabel;
    PanelColor13: TPanelColor;
    PainelGradiente4: TPainelGradiente;
    PanelColor14: TPanelColor;
    Shape20: TShape;
    PanelColor15: TPanelColor;
    PanelColor16: TPanelColor;
    Shape21: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    PanelColor17: TPanelColor;
    Shape27: TShape;
    Shape28: TShape;
    PanelColor18: TPanelColor;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEditNumerico1: TDBEditNumerico;
    Label29: TLabel;
    DBEditLocaliza4: TDBEditLocaliza;
    SpeedButton8: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    CFGI_FON_ECF: TIntegerField;
    CFGI_CLI_ECF: TIntegerField;
    Image1: TImage;
    Sintegra: TEditColor;
    Label32: TLabel;
    CFGC_COD_NAT: TStringField;
    CFGC_NAT_NOT: TStringField;
    CFGC_NOT_CUP: TStringField;
    CFGC_NAT_DEV: TStringField;
    DBRadioGroup3: TDBRadioGroup;
    CFGI_FRE_NOT: TIntegerField;
    Label33: TLabel;
    CAlteraNroNF: TDBCheckBox;
    CFGC_NRO_NOT: TStringField;
    ProximoNroNota: TDBCheckBox;
    CFGC_GER_NRO: TStringField;
    Vinculado: TCheckBox;
    CFGC_TRA_VEN: TStringField;
    TrancaVendedor: TDBCheckBox;
    NotaSub: TDBCheckBox;
    CFGC_NOT_SUB: TStringField;
    AltTotProNF: TDBCheckBox;
    CFGC_TOT_NOT: TStringField;
    CFGC_DUP_PRO: TStringField;
    DuplicaProduto: TDBCheckBox;
    TruncarTotal: TDBCheckBox;
    CFGC_TRU_TOT: TStringField;
    DBEditColor2: TDBEditColor;
    Label35: TLabel;
    CFGC_DEV_CUP: TStringField;
    Label36: TLabel;
    DBMemoColor2: TDBMemoColor;
    CSerieAut: TDBCheckBox;
    CFGC_SER_AUT: TStringField;
    Label37: TLabel;
    EditLocaliza1: TEditLocaliza;
    SpeedButton10: TSpeedButton;
    Label38: TLabel;
    DBEditColor3: TDBEditColor;
    Label39: TLabel;
    CFGI_VIA_ROM: TIntegerField;
    CalPesoLiquido: TDBCheckBox;
    CFGC_CAL_PES: TStringField;
    CFGC_ITE_AUT: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    CFGC_MOS_TRO: TStringField;
    InaNF: TDBCheckBox;
    CFGC_MOS_INA: TStringField;
    TabSheet8: TTabSheet;
    Label12: TLabel;
    DBEditLocaliza2: TDBEditLocaliza;
    SpeedButton5: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    DBEditLocaliza3: TDBEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label16: TLabel;
    Label50: TLabel;
    DBEditLocaliza8: TDBEditLocaliza;
    SpeedButton9: TSpeedButton;
    Label49: TLabel;
    Label7: TLabel;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    ExcNota: TDBCheckBox;
    CFGC_PER_NOT: TStringField;
    DBEditNumerico2: TDBEditNumerico;
    CFGC_CAR_INA: TIntegerField;
    Label34: TLabel;
    Label40: TLabel;
    DBEditLocaliza5: TDBEditLocaliza;
    SpeedButton11: TSpeedButton;
    Label41: TLabel;
    CFGC_NAT_ORS: TStringField;
    Label47: TLabel;
    DBEditColor1: TDBEditColor;
    CFGC_DEV_NOT: TStringField;
    CFGI_TIP_TEF: TIntegerField;
    DBRadioGroup4: TDBRadioGroup;
    DBEditColor4: TDBEditColor;
    Label5: TLabel;
    DBLookupComboBoxColor1: TDBLookupComboBoxColor;
    DBLookupComboBoxColor3: TDBLookupComboBoxColor;
    Label6: TLabel;
    Label52: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditLocaliza2Retorno(Retorno1, Retorno2: String);
    procedure FecharClick(Sender: TObject);
    procedure mascaraProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure mascaraExit(Sender: TObject);
    procedure mascaraKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemoColor1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemoColor2KeyPress(Sender: TObject; var Key: Char);
    procedure DelHistoricoPadraoCadastrar(Sender: TObject);
    procedure CFGAfterScroll(DataSet: TDataSet);
    procedure CadNumeroSerieAfterPost(DataSet: TDataSet);
    procedure BotaoCadastrar1DepoisAtividade(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure ENotaPAdraoRetorno(Retorno1, Retorno2: String);
    procedure BotaoAlterar1DepoisAtividade(Sender: TObject);
    procedure BotaoGravar1DepoisAtividade(Sender: TObject);
    procedure BotaoCancelar1DepoisAtividade(Sender: TObject);
    procedure CadFiliaisAfterScroll(DataSet: TDataSet);
    procedure ctipoEcfChange(Sender: TObject);
    procedure EPlanoExit(Sender: TObject);
    procedure EPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UsarGavetaClick(Sender: TObject);
    procedure PortaECFExit(Sender: TObject);
    procedure BotaoGravar1AntesAtividade(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure DBEditNumerico1Exit(Sender: TObject);
    procedure SintegraExit(Sender: TObject);
    procedure CadNumeroSerieBeforePost(DataSet: TDataSet);
    procedure VinculadoClick(Sender: TObject);
    procedure EditLocaliza1Retorno(Retorno1, Retorno2: String);
  private
      UnImp : TFuncoesImpressao;
      procedure AtualizaLocalizas;
      procedure ConfiguraTextoReducaoAdicionais( CodDoc : Integer ) ;

  public
    { Public declarations }
  end;

var
  FConfiguracoesFiscal: TFConfiguracoesFiscal;

implementation

uses APrincipal, FunValida, FunSql, funobjeto, APlanoConta;

{$R *.DFM}

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesFiscal.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   try
     ctipoEcf.ItemIndex := CFGI_IMP_ECF.AsInteger - 1;
   except
   end;
   CadFiliais.open;

   IniciallizaCheckBox([DCAltVlrUniNot,DCDescontoNota,DCAlterarVrlUnitario, MostraParcelas, CTEF,
                        CDadosClienteCupom, CAlteraNroNF, ProximoNroNota, TrancaVendedor, NotaSub,
                        AltTotProNF, DuplicaProduto, TruncarTotal, CSerieAut, CalPesoLiquido,
                        DBCheckBox1, DBCheckBox3, InaNF, ExcNota], 'T', 'F');

   UnImp := TFuncoesImpressao.criar(self,FPrincipal.BaseDados);

   DBEditLocaliza7.Atualiza;
   DBEditLocaliza2.Atualiza;
   DBEditLocaliza3.Atualiza;
   DBEditLocaliza1.Atualiza;
   EClienteDevolucao.Atualiza;
   DBMemoColor1.Font.Size := 8;
   CadNumeroSerie.OPEN;
   SeriePadrao.open;
   if varia.NotaFiscalPadrao <> 0 then
   begin
     ENotaPAdrao.Text := IntToStr(varia.NotaFiscalPadrao);
     ENotaPAdrao.Atualiza;
   end;
   Boleto.open;
   DadosBoleto.open;
   PortaECF.Text := varia.PortaComunicacaoECF;
   Sintegra.Text := varia.PathSintegra;

   if not ConfigModulos.TEF then
     ctef.Enabled := false;
   if not ConfigModulos.Gaveta then
     UsarGaveta.Enabled := false
   else
     UsarGaveta.Checked :=  varia.UsarGaveta = 'S';
   if varia.CupomVinculado_Ped_Orc = 'S' then
    Vinculado.Checked := true;

   EditLocaliza1.Text := IntTostr(varia.TipoImpressoraRomaneio);
   EditLocaliza1.atualiza;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    CadFiliais.close;
    CadNumeroSerie.close;
    UnImp.Free;
    SeriePadrao.close;
    Boleto.close;
    DadosBoleto.close;
    Aux.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesFiscal.FecharClick(Sender: TObject);
begin
close;
end;

{ ******* Adiciona o nome da nova empresa *********************************** }
procedure TFConfiguracoesFiscal.DBEditLocaliza2Retorno(Retorno1,
  Retorno2: String);
begin
end;


{ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                         Produtos
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }



procedure TFConfiguracoesFiscal.mascaraProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (not (key in [#57, #8])) then
 key := #;
end;

procedure TFConfiguracoesFiscal.mascaraExit(Sender: TObject);
begin
   if (sender as TDBEditColor).Text <> '' then
   if ((sender as TDBEditColor).Text[Length((sender as TDBEditColor).Text)] = '.') then
     (sender as TDBEditColor).Field.Value := copy((sender as TDBEditColor).Text,0, Length((sender as TDBEditColor).Text)-1);
end;

procedure TFConfiguracoesFiscal.mascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key in [ #46, #57, #8]) then
   begin
      if ((sender as TDBEditColor).Text <> '') then
      begin
         if ((sender as TDBEditColor).Text[Length((sender as TDBEditColor).Text)] = '.') and (Key = '.') then
           key := #;
      end
      else
        if ((sender as TDBEditColor).Text = '') and (Key = '.') then
          key := #;
   end
   else
       key := #;
end;



{ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                            Financeiro
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }


{**********************Altera a senha de permissão*****************************}
procedure TFConfiguracoesFiscal.DBMemoColor1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if (length(DBMemocolor1.Lines.Strings[DBMemocolor1.CaretPos.y]) > 47) and (key <> #8) and (key <> #13) then
      key := #;

   if (key = #13) and (DBMemocolor1.Lines.count >= 11) then
      key := #;

end;

procedure TFConfiguracoesFiscal.DBMemoColor2KeyPress(Sender: TObject;
  var Key: Char);
begin
   if (length(TDBMemocolor(Sender).Lines.Strings[TDBMemocolor(Sender).CaretPos.y]) > 140) and (key <> #8) and (key <> #13) then
      key := #;

   if (key = #13) and (TDBMemocolor(sender).Lines.count >= 3) then
      key := #;
end;

{******************Cadastrar um novo historico Padrao**************************}
procedure TFConfiguracoesFiscal.DelHistoricoPadraoCadastrar(Sender: TObject);
begin
end;

{**************************Atualiza os localizas*******************************}
procedure TFConfiguracoesFiscal.AtualizaLocalizas;
begin

   DBEditLocaliza7.Atualiza;
   DBEditLocaliza8.Atualiza;
end;

{*****************Chama a rotina para atualizar os localizas*******************}
procedure TFConfiguracoesFiscal.CFGAfterScroll(DataSet: TDataSet);
begin
   AtualizaLocalizas;
end;

{******************atualiza a tabela de série padrão***************************}
procedure TFConfiguracoesFiscal.CadNumeroSerieAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(SeriePadrao);
  AtualizaSQLTabela(CadNumeroSerie);  
end;

procedure TFConfiguracoesFiscal.BotaoCadastrar1DepoisAtividade(
  Sender: TObject);
begin
   Self.ActiveControl := DBGridColor1;
end;

procedure TFConfiguracoesFiscal.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguracoesFiscal.HelpContext);
end;



procedure TFConfiguracoesFiscal.ENotaPAdraoRetorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
 if Retorno1 <> '' then
   ConfiguraTextoReducaoAdicionais(StrToInt(Retorno1));

  if ENotaPAdrao.Text <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('NOTAPADRAO','NOTAFISCAL' + CadFiliais.fieldByName('i_emp_fil').AsString, StrToInt(ENotaPAdrao.Text));
    ini.free;
    varia.NotaFiscalPadrao := StrToInt(ENotaPAdrao.Text);
  end;

end;

procedure TFConfiguracoesFiscal.ConfiguraTextoReducaoAdicionais( CodDoc : Integer ) ;
begin
  UnImp.LocalizaUmItem(aux, CodDoc, 74);
  MReducao.AQdadeCaracter := Aux. FieldByname('i_tam_cam').AsInteger;
  UnImp.LocalizaUmItem(aux, CodDoc, 60);
  MAdicionais.AQdadeCaracter := Aux. FieldByname('i_tam_cam').AsInteger;
  UnImp.LocalizaCab(aux,CodDoc);
  MAdicionais.AQdadeLinha := Aux. FieldByname('i_qtd_adi').AsInteger;
  aux.close;
end;

procedure TFConfiguracoesFiscal.BotaoAlterar1DepoisAtividade(
  Sender: TObject);
begin
  DataCadFiliais.AutoEdit := true;
  CadFiliais.edit;
end;

procedure TFConfiguracoesFiscal.BotaoGravar1DepoisAtividade(
  Sender: TObject);
begin
  if CadFiliais.State in [ dsEdit, dsInsert ] then
    CadFiliais.Post;
  DataCadFiliais.AutoEdit := false;
end;

procedure TFConfiguracoesFiscal.BotaoCancelar1DepoisAtividade(
  Sender: TObject);
begin
  if CadFiliais.State in [ dsEdit, dsInsert ] then
    CadFiliais.cancel;
  DataCadFiliais.AutoEdit := false;
end;

procedure TFConfiguracoesFiscal.CadFiliaisAfterScroll(DataSet: TDataSet);
begin
  ConfiguraTextoReducaoAdicionais(CadFiliais.fieldByname('i_doc_not').AsInteger);
  if DataCadFiliais.AutoEdit then
    CadFiliais.edit;
end;

procedure TFConfiguracoesFiscal.ctipoEcfChange(Sender: TObject);
begin
  if CFG.State in [ dsInsert, dsEdit ] then
    CFGI_IMP_ECF.AsInteger := ctipoEcf.ItemIndex + 1  // os codigos de impressoras iniciam com 1
  else
    ctipoEcf.ItemIndex := CFGI_IMP_ECF.AsInteger - 1;


end;

procedure TFConfiguracoesFiscal.EPlanoExit(Sender: TObject);
var
  VpfCodigo : string;
begin
  if CFG.State in [ dsinsert, dsEdit ] then
  begin
    FPlanoConta := TFPlanoConta.criarSDI(Self, '', True);
    VpfCodigo := EPlano.Field.AsString;
    if not FPlanoConta.verificaCodigo( VpfCodigo, '', Label14, false,(Sender is TSpeedButton) ) then
      EPlano.SetFocus;
    EPlano.Field.AsString := VpfCodigo;
  end;
end;

procedure TFConfiguracoesFiscal.EPlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 114 then
    EPlanoExit(SpeedButton2);
end;

{**************************Altera a senha de permissão*************************}

procedure TFConfiguracoesFiscal.UsarGavetaClick(Sender: TObject);
var
  ini : TRegIniFile;
  gaveta : string;
begin
  gaveta := 'N';
  if UsarGaveta.Checked then
    gaveta := 'S';
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('ECF','USARGAVETA',gaveta);
  ini.free;
  varia.UsarGaveta := gaveta;
end;

procedure TFConfiguracoesFiscal.PortaECFExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('ECF','PORTAECF', PortaECF.Text);
  ini.free;
  varia.PortaComunicacaoECF := PortaECF.Text;
end;

procedure TFConfiguracoesFiscal.BotaoGravar1AntesAtividade(
  Sender: TObject);
begin
  if not ConfigModulos.TEF then
     ctef.Field.AsString := 'N';
  if not ConfigModulos.Gaveta then
    UsarGaveta.Checked := False;
end;

procedure TFConfiguracoesFiscal.DBRadioGroup2Change(Sender: TObject);
begin
  case DBRadioGroup2.ItemIndex of
    0 : Notebook1.PageIndex := 2;
    1 : Notebook1.PageIndex := 0;
    2 : Notebook1.PageIndex := 1;
  end;
end;

procedure TFConfiguracoesFiscal.DBEditNumerico1Exit(Sender: TObject);
begin
  if (CFGI_FON_ECF.AsInteger < 7) or (CFGI_FON_ECF.AsInteger > 24) then
  begin
    Aviso(' O Tamanho da fonte deve estar entre 7 e 24.');
    DBEditNumerico1.SetFocus;
  end;   
end;

procedure TFConfiguracoesFiscal.SintegraExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('SINTEGRA','PATH', Sintegra.Text);
  ini.free;
  varia.PathSintegra := Sintegra.Text;
end;

{******************* antes de gravar o registro *******************************}
procedure TFConfiguracoesFiscal.CadNumeroSerieBeforePost(
  DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadNumeroSerie.FieldByname('D_ULT_ALT').AsDateTime := DATE;
end;

procedure TFConfiguracoesFiscal.VinculadoClick(Sender: TObject);
var
  ini : TRegIniFile;
  VprVinculado : string;
begin
  VprVinculado := 'N';
  if Vinculado.Checked then
    VprVinculado := 'S';
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('ECF','CUPOMVINCULADO',VprVinculado);
  ini.free;
  varia.CupomVinculado_Ped_Orc := VprVinculado;
end;

procedure TFConfiguracoesFiscal.EditLocaliza1Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAROMANEIO',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraRomaneio := StrtoInt(retorno1);
  end;

end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesFiscal]);
end.
