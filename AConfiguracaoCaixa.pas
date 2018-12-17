unit AConfiguracaoCaixa;
{          Autor: Jorge Eduardo
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
  formularios,  BotaoCadastro, Buttons, Componentes1, constantes,
  LabelCorMove, PainelGradiente,
  Localizacao, Db, DBTables, Mask, Tabela, DBCtrls, StdCtrls, ComCtrls,
  ExtCtrls, Registry;

type
  TFConfiguracoesCaixa = class(TFormularioPermissao)
    CFG: TTabela;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    localiza: TConsultaPadrao;
    kk0y: TPageControl;
    TabSheet7: TTabSheet;
    CFGFLA_VARIOS_GERAIS: TStringField;
    CFGFLA_LOG_DIRETO: TStringField;
    CFGVAL_TOLERANCIA: TFloatField;
    CFGCOD_OPERACAO_PADRAO_RECEBER: TIntegerField;
    CFGCOD_OPERACAO_PADRAO_PAGAR: TIntegerField;
    Label56: TLabel;
    Label58: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DBEditLocaliza10: TDBEditLocaliza;
    DBEditLocaliza9: TDBEditLocaliza;
    Label57: TLabel;
    Label55: TLabel;
    Label53: TLabel;
    DBEditColor16: TDBEditColor;
    ECaixaAbertura: TEditLocaliza;
    Label54: TLabel;
    DataCFG: TDataSource;
    BBAjuda: TBitBtn;
    CFGC_SEN_CAI: TStringField;
    CFGC_SEN_ALT: TStringField;
    CFGC_SEN_EST: TStringField;
    BitBtn1: TBitBtn;
    CFGC_PAR_DAT: TStringField;
    CFGC_ITE_DAT: TStringField;
    CFGC_SEN_TRA: TStringField;
    TabSheet1: TTabSheet;
    PermitirVariosGerais: TDBCheckBox;
    LogDireto: TDBCheckBox;
    SenhaAlteracao: TDBCheckBox;
    SenhaEstorno: TDBCheckBox;
    CPermitirParcialAnterior: TDBCheckBox;
    CItensDataRetroativa: TDBCheckBox;
    SenhaTra: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEditLocaliza1: TDBEditLocaliza;
    DBEditLocaliza2: TDBEditLocaliza;
    Label3: TLabel;
    Label4: TLabel;
    CFGI_CAI_COP: TIntegerField;
    CFGI_CAI_COR: TIntegerField;
    Impressoras: TTabSheet;
    Label10: TLabel;
    PortaAut: TEditColor;
    Label7: TLabel;
    ctipoAut: TComboBoxColor;
    CFGI_IMP_AUT: TIntegerField;
    PainelMP20CI: TPanel;
    Tipos: TDBRadioGroup;
    CFGI_MOD_AUT: TIntegerField;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label6: TLabel;
    DBEditColor1: TDBEditColor;
    CFGI_NUM_AUT: TIntegerField;
    CFGC_FON_NEG: TStringField;
    CFGC_FON_ITA: TStringField;
    CFGC_FON_SUB: TStringField;
    CFGC_FON_EXP: TStringField;
    CFGC_CAI_COP: TStringField;
    CFGC_CAI_COR: TStringField;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure FecharClick(Sender: TObject);
    procedure CFGAfterScroll(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure ECaixaAberturaRetorno(Retorno1, Retorno2: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure ECaixaAberturaSelect(Sender: TObject);
    procedure ctipoAutChange(Sender: TObject);
    procedure PortaAutExit(Sender: TObject);
    procedure CFGAfterEdit(DataSet: TDataSet);
    procedure CFGBeforeCancel(DataSet: TDataSet);
     
  private
      procedure AtualizaLocalizas;
  public
    { Public declarations }
  end;

var
  FConfiguracoesCaixa: TFConfiguracoesCaixa;

implementation

uses APrincipal, funObjeto, ConstMsg, funvalida, ASangriaSuprimento;

{$R *.DFM}

{ ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesCaixa.FormCreate(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  CFG.open;
  if (Varia.CaixaPadrao <> 0) then
  ECaixaAbertura.Text:=IntToStr(Varia.CaixaPadrao);
  IniciallizaCheckBox([PermitirVariosGerais, LogDireto, SenhaAlteracao,
                       SenhaEstorno, CPermitirParcialAnterior, CItensDataRetroativa,
                       SenhaTra, DBCheckBox1,DBCheckBox2, DBCheckBox3, DBCheckBox4,DBCheckBox5, DBCheckBox6], 'T', 'F');
  try
    ctipoAUT.ItemIndex := CFGI_IMP_AUT.AsInteger;
  except
  end;
   PortaAUT.Text := varia.PortaComunicacaoAUT;

  Case ctipoAut.itemindex of
    0 : painelMP20CI.visible := false;
    1 : painelMP20CI.visible := true;
  end;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesCaixa.FecharClick(Sender: TObject);
begin
close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesCaixa.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
   FPrincipal.AlteraNomeEmpresa;
   Label54.Enabled := false;
   ECaixaAbertura.Enabled := false;
end;


{ (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Financeiro
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************************Atualiza os localizas*******************************}
procedure TFConfiguracoesCaixa.AtualizaLocalizas;
begin
   DBEditLocaliza9.Atualiza;
   DBEditLocaliza10.Atualiza;
   DBEditLocaliza1.Atualiza;
   DBEditLocaliza2.Atualiza;
end;

{*****************Chama a rotina para atualizar os localizas*******************}
procedure TFConfiguracoesCaixa.CFGAfterScroll(DataSet: TDataSet);
begin
   AtualizaLocalizas;
end;


procedure TFConfiguracoesCaixa.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguracoesCaixa.HelpContext);
end;

procedure TFConfiguracoesCaixa.ECaixaAberturaRetorno(Retorno1,
  Retorno2: String);
var
  Ini : TRegIniFile;
  CodCaixaPadrao : Integer;
begin
  try
    Ini := TRegIniFile.Create('Software\Systec\Sistema');
    if Retorno1 <> '' then
       CodCaixaPadrao := StrToInt(Retorno1)
     else
      if ECaixaAbertura.Text = '' then
         CodCaixaPadrao := 0;
   Ini.WriteInteger('CAIXA','PADRAO', CodCaixaPadrao); // Grava.
   varia.CaixaPadrao := CodCaixaPadrao;
  finally
    Ini.Free;
  end;
end;

procedure TFConfiguracoesCaixa.BitBtn1Click(Sender: TObject);
begin
  FSangriaSuprimento := TFSangriaSuprimento.CriarSDI(Application,'' , true);
  FSangriaSuprimento.ValidaCarregaAbertura;
end;

procedure TFConfiguracoesCaixa.ECaixaAberturaSelect(Sender: TObject);
begin
  ECaixaAbertura.ASelectValida.Clear;
  ECaixaAbertura.ASelectValida.Add(' SELECT * FROM CAD_CAIXA ' +
                                   ' where EMP_FIL = ' + IntTostr(varia.CodigoEmpFil)  +
                                   ' and NUM_CAIXA = @ ');

  ECaixaAbertura.ASelectLocaliza.Clear;
  ECaixaAbertura.ASelectLocaliza.Add('SELECT * FROM CAD_CAIXA ' +
                                     ' WHERE DES_CAIXA LIKE ''@%'' ' +
                                     ' and EMP_FIL = ' + IntTostr(varia.CodigoEmpFil)  )
end;


procedure TFConfiguracoesCaixa.ctipoAutChange(Sender: TObject);
begin
  Case ctipoAut.itemindex of
    0 : begin
          painelMP20CI.visible := false;
          if CFG.State in [ dsInsert, dsEdit ] then
            CFGI_IMP_AUT.AsInteger := ctipoAut.ItemIndex
          else
            ctipoAut.ItemIndex := CFGI_IMP_AUT.AsInteger;
        end;
    1 : begin
          painelMP20CI.visible := true;
          if CFG.State in [ dsInsert, dsEdit ] then
            CFGI_IMP_AUT.AsInteger := ctipoAut.ItemIndex
          else
            ctipoAut.ItemIndex := CFGI_IMP_AUT.AsInteger;
        end;
  end;
end;


procedure TFConfiguracoesCaixa.PortaAutExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('AUT','PORTAAUT', PortaAUT.Text);
  ini.free;
  varia.PortaComunicacaoAUT := PortaAUT.Text;
end;




procedure TFConfiguracoesCaixa.CFGAfterEdit(DataSet: TDataSet);
begin
  Label54.Enabled := true;
  ECaixaAbertura.Enabled := true;
end;

procedure TFConfiguracoesCaixa.CFGBeforeCancel(DataSet: TDataSet);
begin
  Label54.Enabled := false;
  ECaixaAbertura.Enabled := false;
end;

initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesCaixa]);
end.
