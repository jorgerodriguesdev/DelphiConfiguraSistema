unit ACadMetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Componentes1, ExtCtrls, PainelGradiente, BotaoCadastro, StdCtrls,
  Buttons, Db, DBTables, Tabela, Localizacao, Grids, DBGrids, UnComissoes1,
  DBKeyViolation, Mask, DBCtrls, constantes, constMsg;

type
  TFCadMetas = class(TFormularioPermissao)
    PainelGradiente: TPainelGradiente;
    Painel1: TPanelColor;
    DataMetas: TDataSource;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoAlterar1: TBotaoAlterar;
    BtnFechar: TBitBtn;
    BitBtn2: TBitBtn;
    BotaoConsultar1: TBotaoConsultar;
    PanelColor1: TPanelColor;
    Consulta: TLocalizaEdit;
    Label1: TLabel;
    DBIndice: TGridIndice;
    Localiza: TConsultaPadrao;
    CadMetas: TQuery;
    PainelGradiente1: TPainelGradiente;
    CadMetasI_COD_MET: TIntegerField;
    CadMetasC_NOM_MET: TStringField;
    CadMetasAnalise: TStringField;
    CadMetasData: TStringField;
    CadMetasCalculo: TStringField;
    CadMetasMontante: TStringField;
    CadMetasFaturamento: TStringField;
    CadMetaspagamento: TStringField;
    CadMetasI_EMP_FIL: TIntegerField;
    CadMetasD_ULT_ALT: TDateField;
    CadMetasI_COD_USU: TIntegerField;
    CadMetasD_DAT_CAD: TDateField;
    CadMetasI_FOR_MET: TIntegerField;
    CadMetasI_ANA_MET: TIntegerField;
    CadMetasI_CAL_MET: TIntegerField;
    CadMetasI_PAG_MET: TIntegerField;
    CadMetasI_ORI_MET: TIntegerField;
    CadMetasI_VAL_MET: TIntegerField;
    Aux: TQuery;
    BotaoExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
    procedure DBIndiceOrdem(Ordem: String);
    procedure BotaoCadastrar1AntesAtividade(Sender: TObject);
    procedure BotaoCadastrar1DepoisAtividade(Sender: TObject);
    procedure BotaoExcluir1DepoisAtividade(Sender: TObject);
    procedure BotaoConsultar1AntesAtividade(Sender: TObject);
    procedure BotaoExcluir1DestroiFormulario(Sender: TObject);
    procedure BotaoAlterar1Atividade(Sender: TObject);
    procedure BotaoConsultar1DepoisAtividade(Sender: TObject);
    procedure CadMetasCalcFields(DataSet: TDataSet);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BCadastrarClick(Sender: TObject);

  private
    { Private declarations }
    FunCom : TFuncoesComissao;
    procedure AtualizaConsulta;
  public
    { Public declarations }

  end;

var
  FCadMetas: TFCadMetas;

implementation

uses
  {$R *.DFM}
 Aprincipal, funsql, ADefinicaoMetas ;

{ ****************** Na criação do Formulário ******************************** }
procedure TFCadMetas.FormCreate(Sender: TObject);
begin
   FunCom := TFuncoesComissao.criar(self,FPrincipal.BaseDados);
   Self.HelpFile := Varia.PathHelp + 'MaGeral.hlp>janela';
   CadMetas.open;  {  abre tabelas }
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFCadMetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { fecha tabelas }
 { chamar a rotina de atualização de menus }
 FunCom.Destroy;
 cadmetas.Close;
 Action := CaFree;

end;


{ ****************************** Fecha *************************************** }
procedure TFCadMetas.BtnFecharClick(Sender: TObject);
begin
  close;
end;

{***************************** Ordena grade ***********************************}
procedure TFCadMetas.DBIndiceOrdem(Ordem: String);
begin
  consulta.AOrdem := ordem;
end;

procedure TFCadMetas.AtualizaConsulta;
begin
  AdicionaSQLAbreTabela(CadMetas,' select * from cadmetacomissao '+
                                 ' where i_emp_fil = '+ inttostr(varia.codigoempfil)+
                                 ' order by c_nom_met');
end;


{*************************** Cadastrar Antes Atividade*************************}
procedure TFCadMetas.BotaoCadastrar1AntesAtividade(Sender: TObject);
begin
  FDefinicaoMetas := TFDefinicaoMetas.CriarSDI (Application,'', FPrincipal.VerificaPermisao ('FDefinicaoMetas'));
  FDefinicaoMetas.Valores.TabVisible := true;
  FDefinicaoMetas.Quantidade.TabVisible := false;
end;

{************************ Cadastrar depois atividade **************************}
procedure TFCadMetas.BotaoCadastrar1DepoisAtividade(Sender: TObject);
begin
  AtualizaConsulta;
end;

{************************* Alterar ********************************************}
procedure TFCadMetas.BotaoAlterar1Atividade(Sender: TObject);
begin
  FDefinicaoMetas.CarregaCadMetas(inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
  FDefinicaoMetas.CarregaMetas(inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
  FDefinicaoMetas.CadMetas.edit;
  FDefinicaoMetas.MovMetas.edit;
  case cadmetas.FieldByName('i_ana_met').asinteger of
    0 : begin
         FDefinicaoMetas.Valores.TabVisible := true;
         FDefinicaoMetas.quantidade.TabVisible := false;
        end;
    1 : begin
         FDefinicaoMetas.quantidade.TabVisible := true;
         FDefinicaoMetas.valores.TabVisible := false;
        end;
  end;


end;

{********************** Excluir depois atividade ******************************}
procedure TFCadMetas.BotaoExcluir1DepoisAtividade(Sender: TObject);
begin
   FDefinicaoMetas.show;
end;

{******************************* Excluir destroi ******************************}
procedure TFCadMetas.BotaoExcluir1DestroiFormulario(Sender: TObject);
begin
  FDefinicaoMetas.Close;
  AtualizaConsulta;
end;

{**************************** Consultar ***************************************}
procedure TFCadMetas.BotaoConsultar1AntesAtividade(Sender: TObject);
begin
  FDefinicaoMetas := TFDefinicaoMetas.CriarSDI (Application, '', true );
  FDefinicaoMetas.CarregaCadMetas(inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
  FDefinicaoMetas.CarregaMetas(inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
  FDefinicaoMetas.Datametas.AutoEdit := false;
  FDefinicaoMetas.DataCadmetas.AutoEdit := false;
  case cadmetas.FieldByName('i_ana_met').asinteger of
    0 : begin
         FDefinicaoMetas.Valores.TabVisible := true;
         FDefinicaoMetas.quantidade.TabVisible := false;
         FDefinicaoMetas.Grade.enabled := false;
        end;
    1 : begin
         FDefinicaoMetas.quantidade.TabVisible := true;
         FDefinicaoMetas.valores.TabVisible := false;
         FDefinicaoMetas.Grade2.enabled := false;
        end;
  end;
end;

{**************************** Depois de Consultar *****************************}
procedure TFCadMetas.BotaoConsultar1DepoisAtividade(Sender: TObject);
begin
   FDefinicaoMetas.Show;
end;

{******************** Mostra a descricao dos radiobuttons *********************}
procedure TFCadMetas.CadMetasCalcFields(DataSet: TDataSet);
begin
  case CadMetas.fieldbyname('i_val_met').asinteger of
    0 : CadMetasFaturamento.asstring := 'Empresa';
    1 : CadMetasFaturamento.asstring := 'Filial';
    2 : CadMetasFaturamento.asstring := 'Vendedor';
  end;

  Case CadMetas.fieldbyname('i_cal_met').asinteger of
    0 : CadMetasMontante.asstring := 'Faturado';
    1 : CadMetasMontante.asstring := 'Liquidado';
  end;

  Case CadMetas.fieldbyname('i_ori_met').asinteger of
    0 : CadMetasData.asstring := 'Origem';
    1 : CadMetasData.asstring := 'Atual';
  end;

  Case CadMetas.fieldbyname('i_ana_met').asinteger of
    0 : CadMetasAnalise.asstring := 'Valor';
    1 : CadMetasAnalise.asstring := 'Quantidade';
    2 : CadMetasAnalise.asstring := 'Vendedor';
  end;

  Case CadMetas.fieldbyname('i_for_met').asinteger of
    0 : CadMetasCalculo.asstring := 'Valor';
    1 : CadMetasCalculo.asstring := 'Percentual';
  end;

  Case CadMetas.fieldbyname('i_pag_met').asinteger of
    0 : CadMetasPagamento.asstring := 'na Parcela';
    1 : CadMetasPagamento.asstring := 'no Montante';
  end;

end;

{*************************** Botao Excluir ************************************}
procedure TFCadMetas.BotaoExcluirClick(Sender: TObject);
begin
  FDefinicaoMetas := TFDefinicaoMetas.CriarSDI (Application, '', true );
  FDefinicaoMetas.Show;
  if confirmacao('Deseja excluir a Meta?') then
    if not cadmetas.eof then
      if not Funcom.VerificaMetaemUso(CadMetas.fieldbyname('I_cod_met').asinteger, varia.codigoempfil) then
        begin
          executacomandosql(Aux, ' delete movmetacomissao' +
                                 ' where i_emp_fil = ' + inttostr(varia.codigoempfil)+
                                 ' and i_cod_met = ' + inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
          executacomandosql(Cadmetas, ' delete cadmetacomissao' +
                                      ' where i_emp_fil = ' + inttostr(varia.codigoempfil)+
                                      ' and i_cod_met = ' + inttostr(CadMetas.fieldbyname('I_cod_met').asinteger));
        end
      else
        aviso('Não é possível excluir a meta pois está em uso');
   FDefinicaoMetas.BFechar.Click;
   AtualizaConsulta;
end;

procedure TFCadMetas.BCadastrarClick(Sender: TObject);
begin
  FDefinicaoMetas := TFDefinicaoMetas.CriarSDI (Application,'', FPrincipal.VerificaPermisao ('FDefinicaoMetas'));
  FDefinicaoMetas.Valores.TabVisible := true;
  FDefinicaoMetas.Quantidade.TabVisible := false;
  FDefinicaoMetas.CadMetas.Insert;
  AtualizaConsulta;
end;

Initialization
 RegisterClasses([TFCadMetas]);
end.
