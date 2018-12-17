unit AConfiguracaoGeral;
{          Autor: Sergio Luiz Censi
    Data Criação: 01/04/1999;
          Função: configurações das variáveis do sistema
  Data Alteração: 01/04/1999;
    Alterado por: Rafael Budag
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
  TFConfiguracoesGeral = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    ConfigImpressora: TPrinterSetupDialog;
    localiza: TConsultaPadrao;
    kk0y: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DBEditLocaliza2: TDBEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    DBEditLocaliza3: TDBEditLocaliza;
    SpeedButton3: TSpeedButton;
    TabSheet3: TTabSheet;
    LeitorCodigoBarras: TDBCheckBox;
    CFGI_EMP_FIL: TIntegerField;
    CFGI_COD_EMP: TIntegerField;
    CFGC_MAS_DAT: TStringField;
    CFGC_MAS_MOE: TStringField;
    CFGD_DAT_MOE: TDateField;
    CFGI_MOE_BAS: TIntegerField;
    CFGC_MOE_VAZ: TStringField;
    CFGI_GRU_MAS: TIntegerField;
    CFGI_DEC_VAL: TIntegerField;
    CFGI_DEC_QTD: TIntegerField;
    CFGC_COD_BAR: TStringField;
    Label32: TLabel;
    DBEditLocaliza6: TDBEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BBAjuda: TBitBtn;
    CFGC_VER_FOR: TStringField;
    AtualizaPermissao: TDBCheckBox;
    AlterarPermComissao: TDBCheckBox;
    CFGC_ALT_COM: TStringField;
    TabSheet2: TTabSheet;
    Label31: TLabel;
    PathRelatorio: TEditColor;
    Label6: TLabel;
    Help: TEditColor;
    Label9: TLabel;
    ESybase: TEditColor;
    Drives: TEditColor;
    Label27: TLabel;
    Label10: TLabel;
    EBackup: TEditColor;
    Label11: TLabel;
    EInSig: TEditColor;
    EImportacao: TEditColor;
    Label12: TLabel;
    Label13: TLabel;
    CFGL_ATU_IGN: TMemoField;
    DBMemoColor1: TDBMemoColor;
    Label2: TLabel;
    CFGc_mos_dec: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    CFGC_ALT_CAP: TStringField;
    CFGC_ALT_CAR: TStringField;
    CFGC_ALT_NFS: TStringField;
    CFGC_ALT_PED: TStringField;
    CFGC_ALT_ORC: TStringField;
    CFGC_ALT_EST: TStringField;
    CFGC_ALT_COS: TStringField;
    CFGC_ALT_BAN: TStringField;
    CFGC_ALT_ORS: TStringField;
    CFGC_ALT_NFE: TStringField;
    CFGC_ALT_PRE: TStringField;
    CFGC_ALT_PLA: TStringField;
    CFGC_ALT_NAT: TStringField;
    CFGC_ALT_PRO: TStringField;
    CFGC_EXP_FIL: TStringField;
    ExpFil: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    CFGC_ALT_COR: TStringField;
    CFGD_DAT_SIS: TDateField;
    DBEditColor1: TDBEditColor;
    Label3: TLabel;
    CFGC_SEN_LIB: TStringField;
    CFGI_DEC_CUS: TIntegerField;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    CFGC_MAN_COP: TStringField;
    CFGC_MAN_COR: TStringField;
    CFGC_VER_DAT: TStringField;
    DBCheckBox18: TDBCheckBox;
    CFGC_ALI_REL: TStringField;
    Label15: TLabel;
    DBEditColor2: TDBEditColor;
    TabSheet5: TTabSheet;
    CFGI_DEC_UNI: TIntegerField;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label34: TLabel;
    SpeedButton1: TSpeedButton;
    Label35: TLabel;
    DBEditLocaliza1: TDBEditLocaliza;
    DBEditColor17: TDBEditColor;
    MostraCasaDecimal: TDBCheckBox;
    Label39: TLabel;
    DBEditNumerico2: TDBEditNumerico;
    Label26: TLabel;
    DBEditNumerico3: TDBEditNumerico;
    Label14: TLabel;
    DBEditNumerico1: TDBEditNumerico;
    Label16: TLabel;
    DBEditNumerico4: TDBEditNumerico;
    CFGC_PAT_ATU: TStringField;
    DBEditColor3: TDBEditColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure DrivesExit(Sender: TObject);
    procedure PathRelatorioChange(Sender: TObject);
    procedure DBEditLocaliza3Select(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure DBEditLocaliza1Retorno(Retorno1, Retorno2: String);
    procedure DBEditLocaliza1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditNumerico2Exit(Sender: TObject);
    procedure CFGAfterScroll(DataSet: TDataSet);
    procedure HelpExit(Sender: TObject);
    procedure DBEditLocaliza2Retorno(Retorno1, Retorno2: String);
    procedure BBAjudaClick(Sender: TObject);
    procedure CFGAfterInsert(DataSet: TDataSet);
    procedure ESybaseExit(Sender: TObject);
    procedure EBackupExit(Sender: TObject);
    procedure EInSigExit(Sender: TObject);
    procedure EImportacaoExit(Sender: TObject);
    procedure DBEditNumerico1Exit(Sender: TObject);
    procedure DBCheckBox18Click(Sender: TObject);
  private
      ini : TRegIniFile;
      procedure AtualizaLocalizas;
  public
    { Public declarations }
  end;

var
  FConfiguracoesGeral: TFConfiguracoesGeral;

implementation

uses APrincipal, FunValida, FunSql, funobjeto;

{$R *.DFM}

{ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                            Modulo Básico
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesGeral.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   ini := TRegIniFile.Create('Software\Systec\Sistema');
   CFG.open;
   Drives.Text := varia.DriveFoto;
   PathRelatorio.Text := varia.PathRel;
   Help.Text := Varia.PathHelp;
   ESybase.Text := varia.PathSybase;
   EBackup.text := varia.PathBackup;
   EInSig.text := varia.PathInSig;
   EImportacao.Text := Varia.PathImportacao;

   IniciallizaCheckBox([LeitorCodigoBarras, AtualizaPermissao, AlterarPermComissao, MostraCasaDecimal,
                        DBCheckBox1, DBCheckBox2, DBCheckBox3, DBCheckBox4, DBCheckBox5,
                        DBCheckBox6, DBCheckBox7, DBCheckBox8, DBCheckBox9, DBCheckBox10,
                        DBCheckBox11, DBCheckBox12, DBCheckBox13, DBCheckBox14,ExpFil, DBCheckBox15,
                        DBCheckBox16,DBCheckBox17, DBCheckBox18 ],'T','F');

   if not ConfigModulos.CodigoBarra then
     LeitorCodigoBarras.Enabled := false;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CFG.close;
  ini.free;
  Action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesGeral.FecharClick(Sender: TObject);
begin
  Close;
end;

{ ******** codigo para liberação da alteração da moeda base CTRL+ALT+SHIF+A****}
procedure TFConfiguracoesGeral.DBEditLocaliza1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Shift = [ssShift, ssAlt, ssCtrl]) and (key = 65) then
begin
  DBEditLocaliza1.ReadOnly := false;
  Aviso(CT_AutorizacaoMoedaBase);
end;
end;

{ ************ Adiciona a Unidade monetária ********************************* }
procedure TFConfiguracoesGeral.DBEditLocaliza1Retorno(Retorno1,
  Retorno2: String);
begin
if retorno1 <> '' then
  CFGC_MAS_MOE.Value := retorno1;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
          configurações de Inicialização da Filial e Empresas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{ ********** Monta a select da Filial conforme empresa *********************** }
procedure TFConfiguracoesGeral.DBEditLocaliza3Select(Sender: TObject);
begin
DBEditLocaliza3.ASelectValida.Clear;
DBEditLocaliza3.ASelectValida.Add('select * from CadFiliais where I_COD_EMP = ' + DBEditLocaliza2.Text +
                              ' and I_EMP_FIL = @');
DBEditLocaliza3.ASelectLocaliza.Clear;
DBEditLocaliza3.ASelectLocaliza.Add('select * from CadFiliais where I_COD_EMP = ' + DBEditLocaliza2.Text +
                                ' and C_NOM_FAN like ''@%''');
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesGeral.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados, CampoPermissaoModulo, varia.CodigoEmpFil);
   FPrincipal.CorFoco.AMascaraData := CFG.fieldByname('C_MAS_DAT').AsString;
   FPrincipal.AlteraNomeEmpresa;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                 Grava Path foto, Porta Impressora e Relatorios
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{***************************Grava o drive da foto******************************}
procedure TFConfiguracoesGeral.DrivesExit(Sender: TObject);
begin
  ini.WriteString('DRIVEFOTO','DRIVE',Drives.Text);
  varia.DriveFoto := Drives.Text;
end;


{*************************Grava o path do relatório****************************}
procedure TFConfiguracoesGeral.PathRelatorioChange(Sender: TObject);
begin
  ini.WriteString('RELATORIO','PATH',PathRelatorio.Text);
  varia.PathRel := PathRelatorio.Text;
end;

{*************************Grava o path do Help *******************************}
procedure TFConfiguracoesGeral.HelpExit(Sender: TObject);
begin
  ini.WriteString('HELP','PATH',Help.Text);
  varia.PathHelp := Help.Text;
end;

{*************************Grava o path do Sybase ******************************}
procedure TFConfiguracoesGeral.ESybaseExit(Sender: TObject);
begin
  ini.WriteString('PATH_SYBASE','PATH',ESybase.Text);
  varia.PathSybase := ESybase.Text;
end;

{*************************Grava o path do Backup ******************************}
procedure TFConfiguracoesGeral.EBackupExit(Sender: TObject);
begin
  ini.WriteString('PATH_BACKUP','PATH',EBackup.Text);
  varia.PathBackup := EBackup.Text;
end;

{*************************Grava o path do InSig ******************************}
procedure TFConfiguracoesGeral.EInSigExit(Sender: TObject);
begin
  ini.WriteString('PATH_INSIG','PATH',EInSig.Text);
  varia.PathInSig := EInSig.Text;
end;

{********* configura decimais da quantidade e valores ************************ }
procedure TFConfiguracoesGeral.DBEditNumerico2Exit(Sender: TObject);
begin
if not((Sender as TDBEditNumerico).Field.AsInteger in [2,3]) then
   (Sender as TDBEditNumerico).Field.AsInteger := 2;
end;

{**************************Atualiza os localizas*******************************}
procedure TFConfiguracoesGeral.AtualizaLocalizas;
begin
   DBEditLocaliza1.Atualiza;
   DBEditLocaliza2.Atualiza;
   DBEditLocaliza3.Atualiza;
   DBEditLocaliza6.Atualiza;
end;

{*****************Chama a rotina para atualizar os localizas*******************}
procedure TFConfiguracoesGeral.CFGAfterScroll(DataSet: TDataSet);
begin
   AtualizaLocalizas;
end;



procedure TFConfiguracoesGeral.DBEditLocaliza2Retorno(Retorno1,
  Retorno2: String);
begin
DBEditLocaliza3.Atualiza;
end;

procedure TFConfiguracoesGeral.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguracoesGeral.HelpContext);
end;

procedure TFConfiguracoesGeral.CFGAfterInsert(DataSet: TDataSet);
begin
  if ConfigModulos.CodigoBarra then
    CFGC_COD_BAR.AsString := 'N';
end;

procedure TFConfiguracoesGeral.EImportacaoExit(Sender: TObject);
begin
  ini.WriteString('PATH_IMPORTACAO','PATH',EImportacao.Text);
  varia.PathImportacao := EImportacao.Text;
end;

procedure TFConfiguracoesGeral.DBEditNumerico1Exit(Sender: TObject);
begin
if not((Sender as TDBEditNumerico).Field.AsInteger in [2,3,4,5,6,7]) then
   (Sender as TDBEditNumerico).Field.AsInteger := 2;
end;

procedure TFConfiguracoesGeral.DBCheckBox18Click(Sender: TObject);
begin
  label3.Enabled := not DBCheckBox18.Checked;
  DBEditColor1.Enabled := not DBCheckBox18.Checked;
end;


Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesGeral]);
end.
