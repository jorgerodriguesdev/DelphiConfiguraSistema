unit ADefinicaoMetas;

//               Autor: Enezilda Guesser
//     Data da Criação: 17/08/2001
//              Função: Define as metas para comissao
//        Alterado por:
//   Data da Alteração:
// Motivo da Alteração:

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Localizacao, Db, DBTables, StdCtrls, Buttons, BotaoCadastro, Mask,
  numericos, Grids, DBGrids, Tabela, DBKeyViolation, Componentes1,
  ComCtrls, ExtCtrls, PainelGradiente, DBCtrls, Geradores;

type
  TFDefinicaoMetas = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    Localiza: TConsultaPadrao;
    DataMetas: TDataSource;
    MovMetas: TSQL;
    Aux: TQuery;
    Panel1: TPanel;
    kk0y: TPageControl;
    Valores: TTabSheet;
    Quantidade: TTabSheet;
    Grade: TGridIndice;
    MovMetasI_EMP_FIL: TIntegerField;
    MovMetasI_SEQ_MOV: TIntegerField;
    MovMetasI_COD_MET: TIntegerField;
    MovMetasN_TOT_MET: TFloatField;
    MovMetasN_PER_MET: TFloatField;
    MovMetasN_VLR_MET: TFloatField;
    MovMetasI_QTD_MET: TIntegerField;
    MovMetasN_VLR_QTD: TFloatField;
    MovMetasI_COD_USU: TIntegerField;
    MovMetasD_ULT_ALT: TDateField;
    MovMetasN_MET_FIM: TFloatField;
    MovMetasI_QTD_FIM: TIntegerField;
    Grade2: TGridIndice;
    MovMetasN_PER_QTD: TFloatField;
    PanelColor2: TPanelColor;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEditColor1: TDBEditColor;
    DBFilialColor1: TDBFilialColor;
    DBEditColor3: TDBEditColor;
    EditColor7: TEditColor;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    PanelColor1: TPanelColor;
    BotaoCancelar1: TBotaoCancelar;
    BFechar: TBitBtn;
    BBAjuda: TBitBtn;
    CadMetas: TSQL;
    CadMetasI_EMP_FIL: TIntegerField;
    CadMetasI_COD_MET: TIntegerField;
    CadMetasC_NOM_MET: TStringField;
    CadMetasD_ULT_ALT: TDateField;
    CadMetasI_COD_USU: TIntegerField;
    CadMetasD_DAT_CAD: TDateField;
    CadMetasI_FOR_MET: TIntegerField;
    CadMetasI_ANA_MET: TIntegerField;
    CadMetasI_CAL_MET: TIntegerField;
    CadMetasI_PAG_MET: TIntegerField;
    CadMetasI_ORI_MET: TIntegerField;
    CadMetasI_VAL_MET: TIntegerField;
    DataCadMetas: TDataSource;
    ValidaGravacao1: TValidaGravacao;
    BotaoGravar1: TBotaoGravar;
    DBRadioGroup7: TDBRadioGroup;
    CadMetasI_CAL_FEC: TIntegerField;
    ajudametas: TComponenteMove;
    Label50: TLabel;
    PainelAjuda: TPanelColor;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GradeExit(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MovMetasAfterInsert(DataSet: TDataSet);
    procedure MovMetasBeforePost(DataSet: TDataSet);
    procedure MovMetasAfterPost(DataSet: TDataSet);
    procedure Grade2Exit(Sender: TObject);
    procedure Grade2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadMetasAfterInsert(DataSet: TDataSet);
    procedure CadMetasBeforePost(DataSet: TDataSet);
    procedure CadMetasAfterEdit(DataSet: TDataSet);
    procedure DBFilialColor1Change(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure DBRadioGroup2Click(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure DBRadioGroup6Exit(Sender: TObject);
    procedure DBRadioGroup4Exit(Sender: TObject);
    procedure DBRadioGroup5Exit(Sender: TObject);
    procedure DBRadioGroup3Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    procedure CarregaMetas(codmeta : string);
    procedure CarregaCadMetas(codmeta : string);
    procedure ConfiguraGrade;
    procedure ValidaValores;
    procedure ValidaQuantidade;
  end;

var
  FDefinicaoMetas: TFDefinicaoMetas;
  texto, texto1 : string;
  OrdemConsulta : string;
implementation
uses APrincipal, Constantes, Fundata, Funstring, Constmsg, FunObjeto,
     FunSql, Funnumeros, AcadMetas;
{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFDefinicaoMetas.FormCreate(Sender: TObject);
begin
  Cadmetas.open;
  DBFilialColor1.ACodFilial := Varia.Codigoempfil;
  DBEditColor3.text := datetostr(date);
  editcolor7.Text := varia.NomeUsuario;
  texto := '';
  texto1 := '';
end;


{ ******************* Quando o formulario e fechado ************************** }
procedure TFDefinicaoMetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CadMetas.close;
  MovMetas.Close;
  Aux.close;
  CadMetas.close;
  Action := CaFree;
end;

{************************ Configura grade Valor ou Percentual *****************}
procedure TFDefinicaoMetas.ConfiguraGrade;
begin
  Grade.Columns[2].Visible := not (DBRadioGroup1.itemindex = 1);
  Grade.Columns[3].Visible := not (DBRadioGroup1.itemindex = 0);
  Grade2.Columns[2].visible := not (DBRadioGroup1.itemindex = 1);
  Grade2.Columns[3].visible := not (DBRadioGroup1.itemindex = 0);
end;

{*********************** Carrega Cad Metas ************************************}
procedure TFDefinicaoMetas.CarregaCadMetas(codmeta : string);
begin
  LimpaSQLTabela(CadMetas);
  AdicionaSQLAbreTabela(CadMetas, ' select * from CadMetaComissao' +
                                  ' where i_emp_fil = ' + inttostr(Varia.CodigoEmpFil)+
                                  ' and i_cod_met = '  + codmeta);

end;

{**************************** Carrega Mov Metas *******************************}
procedure TFDefinicaoMetas.CarregaMetas(codmeta : string);
begin
  LimpaSQLTabela(MovMetas);
  AdicionaSQLTabela(MovMetas, ' select * from MovMetaComissao' +
                              ' where i_emp_fil = ' + inttostr(Varia.CodigoEmpFil)+
                              ' and i_cod_met = '  + codmeta +
                              ' order by n_tot_met, i_qtd_met');
  MovMetas.open;
end;



{****************************** Valida Valores *******************************}
procedure TFDefinicaoMetas.ValidaValores;
begin
  LimpaSQLTabela(Aux);
  AdicionaSQLAbreTabela(Aux, ' Select max(N_MET_FIM) as MaiorValor '+
                             ' from MovMetaComissao' +
                             ' where i_emp_fil = ' + IntToStr(Varia.codigoempfil)+
                             ' and i_cod_met = ' + dbfilialcolor1.text);

   if (Aux.fieldbyname('MaiorValor').asfloat >= MovMetasN_TOT_MET.asfloat) or
      (movmetasN_MET_FIM.asfloat <= MovMetasN_TOT_MET.asfloat) then
    begin
      aviso('Valor inválido, o valor deve ser maior que o anterior');
      abort;
    end;
end;

{****************************** Valida Quantidade *****************************}
procedure TFDefinicaoMetas.ValidaQuantidade;
begin
  LimpaSQLTabela(Aux);
  AdicionaSQLAbreTabela(Aux, ' Select max(I_QTD_FIM) as MaiorQuant'+
                             ' from MovMetaComissao' +
                             ' where i_emp_fil = ' + IntToStr(Varia.codigoempfil)+
                             ' and i_cod_met = ' + dbfilialcolor1.text);

   if (Aux.fieldbyname('MaiorQuant').asfloat >= MovMetasI_QTD_MET.asfloat) or
      (movmetasI_QTD_FIM.asfloat <= MovMetasI_QTD_MET.asfloat) then
    begin
      aviso('Quantidade inválida, a quantidade deve ser maior que a anterior');
      abort;
    end;
end;


{**************************** Saida Grade Valor ou Percentual *****************}
procedure TFDefinicaoMetas.GradeExit(Sender: TObject);
begin
 if (not MovMetasN_TOT_MET.isnull) then
 begin
   if MovMetas.State in [dsEdit, dsInsert] then
      MovMetas.Post;
 end;
end;

{**************************** Exluir e Tab ***********************************}
procedure TFDefinicaoMetas.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46)  and (grade.SelectedIndex = 0) then  // Exclui meta
     begin
       if not (MovMetas.State in [ DsEdit, dsInsert ]) then
         MovMetas.delete;
      end;
end;


{************************* Insere Meta **************************************}
procedure TFDefinicaoMetas.MovMetasAfterInsert(DataSet: TDataSet);
begin
  if cadmetas.State = dsinsert then
    cadmetas.post;
  MovMetasI_COD_MET.AsInteger := strtoint(dbfilialcolor1.text);
  MovMetasI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
  MovMetasI_COD_USU.AsInteger := varia.CodigoUsuario;
  MovMetasI_SEQ_MOV.AsInteger := ProximoCodigoFilial('MovMetaComissao','i_seq_mov','i_emp_fil',
                                                     varia.codigoEmpfil,FPrincipal.BaseDados);
end;

{*************************** Antes de Gravar **********************************}
procedure TFDefinicaoMetas.MovMetasBeforePost(DataSet: TDataSet);
begin
  MovMetasD_ULT_ALT.AsDateTime := Date;
  if movmetas.State = dsinsert then
  begin
    case DBRadioGroup2.itemindex of
     0 : ValidaValores;
     1 : ValidaQuantidade;
    end;
  end;
end;



{********************************* Atualiza Consulta **************************}
procedure TFDefinicaoMetas.MovMetasAfterPost(DataSet: TDataSet);
begin
  CarregaMetas(dbfilialcolor1.text);
  MovMetas.last;
end;



{************************** Saida da Grade Quantidade *************************}
procedure TFDefinicaoMetas.Grade2Exit(Sender: TObject);
begin
 if (not MovMetasI_QTD_MET.isnull) then
 begin
  if MovMetas.State in [dsEdit, dsInsert] then
     MovMetas.Post;
 end;
end;

{**************************** Grade *******************************************}
procedure TFDefinicaoMetas.Grade2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46)  and (grade2.SelectedIndex = 0) then  // Exclui meta
     begin
       if not (MovMetas.State in [ DsEdit, dsInsert ]) then
         MovMetas.delete;
      end;
end;


{**************************** Apos o insert ***********************************}
procedure TFDefinicaoMetas.CadMetasAfterInsert(DataSet: TDataSet);
begin
   DBFilialColor1.ProximoCodigo;
   CadMetasI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
   CadMetasD_DAT_CAD.AsDateTime:= date;
   CadMetasI_For_met.asinteger := 0;
   CadMetasI_ana_met.asinteger := 0;
   CadMetasI_cal_met.asinteger := 0;
   CadMetasI_pag_met.asinteger := 0;
   CadMetasI_ori_met.asinteger := 0;
   CadMetasI_val_met.asinteger := 0;
   CadMetasI_Cal_Fec.asinteger := 0;
   DBFilialColor1.ReadOnly := False;
end;

{******************************** Antes de Gravar *****************************}
procedure TFDefinicaoMetas.CadMetasBeforePost(DataSet: TDataSet);
begin
  CadMetasD_ULT_ALT.AsDateTime := Date;
  CadMetasI_cod_usu.asinteger := varia.CodigoUsuario;
  if (not CadMetasC_Nom_Met.isnull) then
    begin
      if CadMetas.State = dsinsert then
         DBFilialColor1.VerificaCodigoRede;
    end
  else
    begin
      BotaoGravar1.Enabled := false;
      abort;
    end;
end;

{********************************** Depois do Edit ****************************}
procedure TFDefinicaoMetas.CadMetasAfterEdit(DataSet: TDataSet);
begin
  DBFilialColor1.ReadOnly := True;
end;

{***************************** Valida a gravacao ******************************}
procedure TFDefinicaoMetas.DBFilialColor1Change(Sender: TObject);
begin
  if CadMetas.State in [ dsInsert, dsEdit ] then
    ValidaGravacao1.execute;
end;

{************************* Botao Fechar ***************************************}
procedure TFDefinicaoMetas.BFecharClick(Sender: TObject);
begin
  close;
  FCadMetas.Consulta.AtualizaConsulta;
end;

{********************* Radio Button da analise ********************************}
procedure TFDefinicaoMetas.DBRadioGroup2Click(Sender: TObject);
begin
  ConfiguraGrade;
  CarregaMetas(DBFilialcolor1.Text);
  Case DBRadioGroup2.itemindex of
    0 : begin
          Valores.TabVisible := true;
          quantidade.TabVisible := false;
        end;
    1 : begin
          Quantidade.TabVisible := true;
          Valores.TabVisible := false;
        end;
  end;
end;

{******************* Selecionar forma de calculo da meta **********************}
procedure TFDefinicaoMetas.DBRadioGroup1Change(Sender: TObject);
begin
  configuragrade;
end;

procedure TFDefinicaoMetas.DBRadioGroup6Exit(Sender: TObject);
begin
  CarregaMetas(DBFilialcolor1.Text);
  grade.enabled := true;
  grade2.enabled := true;
  if DBRadioGroup6.itemindex = 2 then
    DBRadioGroup7.Enabled := true
  else
    begin
      DBRadioGroup7.Enabled := false;
      DBRadioGroup7.ItemIndex := 0;
    end;  
end;

procedure TFDefinicaoMetas.DBRadioGroup4Exit(Sender: TObject);
begin
  CarregaMetas(DBFilialcolor1.Text);
  grade.enabled := true;
  grade2.enabled := true;
end;

procedure TFDefinicaoMetas.DBRadioGroup5Exit(Sender: TObject);
begin
  CarregaMetas(DBFilialcolor1.Text);
  grade.enabled := true;
  grade2.enabled := true;
end;

procedure TFDefinicaoMetas.DBRadioGroup3Exit(Sender: TObject);
begin
  CarregaMetas(DBFilialcolor1.Text);
  grade.enabled := true;
  grade2.enabled := true;
end;


procedure TFDefinicaoMetas.BitBtn2Click(Sender: TObject);
begin
  ajudametas.Visible := false;
end;

procedure TFDefinicaoMetas.BitBtn1Click(Sender: TObject);
begin
  ajudametas.Visible := true;
end;

Initialization
 RegisterClasses([TFDefinicaoMetas]);
end.
