unit AConfiguracaoSenhas;
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
  TFConfiguracoesSenhas = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    localiza: TConsultaPadrao;
    BBAjuda: TBitBtn;
    CFGC_SEN_LIB: TStringField;
    kk0y: TPageControl;
    TabSheet4: TTabSheet;
    GroupBox6: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label17: TLabel;
    ECSenhaLiberacao: TEditColor;
    ECConfirmaSenha: TEditColor;
    EditColor1: TEditColor;
    CFGC_SEN_CAI: TStringField;
    CFGC_SEN_ADM: TStringField;
    CFGC_SEN_SER: TStringField;
    CFGC_SEN_FIN: TStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditColor2: TEditColor;
    EditColor3: TEditColor;
    EditColor4: TEditColor;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditColor5: TEditColor;
    EditColor6: TEditColor;
    EditColor7: TEditColor;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditColor8: TEditColor;
    EditColor9: TEditColor;
    EditColor10: TEditColor;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditColor11: TEditColor;
    EditColor12: TEditColor;
    EditColor13: TEditColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FecharClick(Sender: TObject);
    procedure ECConfirmaSenhaExit(Sender: TObject);
    procedure ECSenhaLiberacaoExit(Sender: TObject);
    procedure EditColor1Exit(Sender: TObject);
    procedure BotaoGravar1DepoisAtividade(Sender: TObject);
    procedure EditColor7Exit(Sender: TObject);
    procedure EditColor4Exit(Sender: TObject);
    procedure EditColor13Exit(Sender: TObject);
    procedure EditColor10Exit(Sender: TObject);
    procedure EditColor2Exit(Sender: TObject);
    procedure EditColor5Exit(Sender: TObject);
    procedure EditColor11Exit(Sender: TObject);
    procedure EditColor8Exit(Sender: TObject);
    procedure EditColor3Exit(Sender: TObject);
    procedure EditColor6Exit(Sender: TObject);
    procedure EditColor12Exit(Sender: TObject);
    procedure EditColor9Exit(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FConfiguracoesSenhas: TFConfiguracoesSenhas;

implementation

uses APrincipal, FunValida, FunSql, funobjeto;

{$R *.DFM}

{ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                            Modulo Básico
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesSenhas.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   ECSenhaLiberacao.Text := Varia.SenhaLiberacao;
   ECConfirmaSenha.Text := Varia.SenhaLiberacao;
   EditColor5.Text := varia.SenhaCaixas;
   EditColor6.Text := varia.SenhaCaixas;
   EditColor2.Text := varia.SenhaAdministrativo;
   EditColor3.Text := varia.SenhaAdministrativo;
   EditColor8.Text := varia.Senhaos;
   EditColor9.Text := varia.Senhaos;
   EditColor11.Text := varia.SenhaFinanceiro;
   EditColor12.Text := varia.SenhaFinanceiro;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesSenhas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CFG.close;
  Action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesSenhas.FecharClick(Sender: TObject);
begin
  Close;
end;

{ *************** exit do senha atual  *************************************** }
procedure TFConfiguracoesSenhas.EditColor1Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
  begin
    label40.Enabled := EditColor1.Text = varia.SenhaLiberacao;
    label41.Enabled := EditColor1.Text = varia.SenhaLiberacao;
    ECSenhaLiberacao.Enabled := EditColor1.Text = varia.SenhaLiberacao;
    ECConfirmaSenha.Enabled := EditColor1.Text = varia.SenhaLiberacao;
  end;
end;

procedure TFConfiguracoesSenhas.EditColor7Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
  begin
    label4.Enabled := EditColor7.Text = varia.SenhaCaixas;
    label5.Enabled := EditColor7.Text = varia.SenhaCaixas;
    EditColor5.Enabled := EditColor7.Text = varia.SenhaCaixas;
    EditColor6.Enabled := EditColor7.Text = varia.SenhaCaixas;
  end;
end;

procedure TFConfiguracoesSenhas.EditColor4Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
  begin
    label1.Enabled := EditColor4.Text = varia.SenhaAdministrativo;
    label2.Enabled := EditColor4.Text = varia.SenhaAdministrativo;
    EditColor2.Enabled := EditColor4.Text = varia.SenhaAdministrativo;
    EditColor3.Enabled := EditColor4.Text = varia.SenhaAdministrativo;
  end;
end;

procedure TFConfiguracoesSenhas.EditColor13Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
  begin
    label10.Enabled := EditColor13.Text = varia.SenhaFinanceiro;
    label11.Enabled := EditColor13.Text = varia.SenhaFinanceiro;
    EditColor11.Enabled := EditColor13.Text = varia.SenhaFinanceiro;
    EditColor12.Enabled := EditColor13.Text = varia.SenhaFinanceiro;
  end;
end;

procedure TFConfiguracoesSenhas.EditColor10Exit(Sender: TObject);
begin
  if CFG.State in [ dsEdit, dsInsert ] then
  begin
    label7.Enabled := EditColor10.Text = varia.SenhaOS;
    label8.Enabled := EditColor10.Text = varia.SenhaOS;
    EditColor8.Enabled := EditColor10.Text = varia.SenhaOS;
    EditColor9.Enabled := EditColor10.Text = varia.SenhaOS;
  end;
end;

{ *************** exit da senha   *************************************** }
procedure TFConfiguracoesSenhas.ECSenhaLiberacaoExit(Sender: TObject);
begin
  if not BotaoCancelar1.Focused then
    ECConfirmaSenha.SetFocus;
end;

procedure TFConfiguracoesSenhas.EditColor2Exit(Sender: TObject);
begin
  if not BotaoCancelar1.Focused then
    EditColor3.SetFocus;
end;

procedure TFConfiguracoesSenhas.EditColor5Exit(Sender: TObject);
begin
  if not BotaoCancelar1.Focused then
    EditColor6.SetFocus;
end;

procedure TFConfiguracoesSenhas.EditColor11Exit(Sender: TObject);
begin
  if not BotaoCancelar1.Focused then
    EditColor12.SetFocus;
end;

procedure TFConfiguracoesSenhas.EditColor8Exit(Sender: TObject);
begin
  if not BotaoCancelar1.Focused then
    EditColor9.SetFocus;
end;

{******************* depois de cncelar ou gravar **************************}
procedure TFConfiguracoesSenhas.BotaoGravar1DepoisAtividade(
  Sender: TObject);
begin
  label40.Enabled := false;
  label41.Enabled := false;
  ECSenhaLiberacao.Enabled := false;
  ECConfirmaSenha.Enabled := false;
  EditColor1.Clear;
end;


procedure TFConfiguracoesSenhas.ECConfirmaSenhaExit(Sender: TObject);
begin
   if ECSenhaLiberacao.Text <> ECConfirmaSenha.Text then
   begin
      erro(CT_SenhaInvalida);
      ECSenhaLiberacao.SetFocus;
      ECSenhaLiberacao.SelectAll;
   end
   else
    if cfg.state in [dsedit,dsinsert] then
    begin
       CFGC_SEN_LIB.AsString := ECSenhaLiberacao.Text;
       varia.SenhaLiberacao :=  ECSenhaLiberacao.Text;
    end;
end;

procedure TFConfiguracoesSenhas.EditColor3Exit(Sender: TObject);
begin
   if EditColor3.Text <> EditColor2.Text then
   begin
      erro(CT_SenhaInvalida);
      EditColor2.SetFocus;
      EditColor2.SelectAll;
   end
   else
    if cfg.state in [dsedit,dsinsert] then
    begin
       CFGC_SEN_ADM.AsString := EditColor2.Text;
       varia.SenhaAdministrativo :=  EditColor2.Text;
    end;
end;

procedure TFConfiguracoesSenhas.EditColor6Exit(Sender: TObject);
begin
   if EditColor5.Text <> EditColor6.Text then
   begin
      erro(CT_SenhaInvalida);
      EditColor5.SetFocus;
      EditColor5.SelectAll;
   end
   else
    if cfg.state in [dsedit,dsinsert] then
    begin
       CFGC_SEN_CAI.AsString := EditColor5.Text;
       varia.SenhaCaixas :=  EditColor5.Text;
    end;
end;

procedure TFConfiguracoesSenhas.EditColor12Exit(Sender: TObject);
begin
   if EditColor11.Text <> EditColor12.Text then
   begin
      erro(CT_SenhaInvalida);
      EditColor11.SetFocus;
      EditColor11.SelectAll;
   end
   else
    if cfg.state in [dsedit,dsinsert] then
    begin
       CFGC_SEN_FIN.AsString := EditColor11.Text;
       varia.SenhaFinanceiro :=  EditColor11.Text;
    end;
end;

procedure TFConfiguracoesSenhas.EditColor9Exit(Sender: TObject);
begin
   if EditColor8.Text <> EditColor9.Text then
   begin
      erro(CT_SenhaInvalida);
      EditColor8.SetFocus;
      EditColor8.SelectAll;
   end
   else
    if cfg.state in [dsedit,dsinsert] then
    begin
       CFGC_SEN_SER.AsString := EditColor8.Text;
       varia.SenhaOS :=  EditColor8.Text;
    end;
end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesSenhas]);
end.
