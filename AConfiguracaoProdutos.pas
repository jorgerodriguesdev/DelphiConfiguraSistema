unit AConfiguracaoProdutos;
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
  ColorGrd, LabelCorMove, Grids, DBGrids, Registry, PainelGradiente,
  FileCtrl,printers, Localizacao;

type
  TFConfiguracoesProdutos = class(TFormularioPermissao)
    CFG: TTabela;
    DataCFG: TDataSource;
    PanelColor1: TPanelColor;
    PainelGradiente1: TPainelGradiente;
    BotaoAlterar1: TBotaoAlterar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    Fechar: TBitBtn;
    kk0y: TPageControl;
    DataCadFiliaisPicture: TDataSource;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    mascara: TDBEditColor;
    AlterarMascara: TBitBtn;
    MascaraOk: TBitBtn;
    mascaraProdutos: TDBEditColor;
    DBGridColor2: TDBGridColor;
    Label7: TLabel;
    Label8: TLabel;
    DBEditColor12: TDBEditColor;
    DBEditColor13: TDBEditColor;
    Label9: TLabel;
    DBEditNumerico1: TDBEditNumerico;
    TabSheet1: TTabSheet;
    QtdMin: TDBCheckBox;
    QtdEst: TDBCheckBox;
    VerCodigpPro: TDBCheckBox;
    MascaraProduto: TDBCheckBox;
    GerarContasAPagar: TDBCheckBox;
    QtdNeg: TDBRadioGroup;
    CadEmpresaPicture: TQuery;
    Aux: TQuery;
    CFGC_QTD_EST: TStringField;
    CFGC_QTD_MIN: TStringField;
    CFGI_EST_NEG: TIntegerField;
    CFGC_VER_PRO: TStringField;
    CFGC_MAS_PRO: TStringField;
    CFGI_DIA_ORC: TIntegerField;
    CFGC_PAG_PRO: TStringField;
    CFGC_UNI_PEC: TStringField;
    CFGC_UNI_CAX: TStringField;
    CodigoEmpresa: TDBCheckBox;
    CFGC_COD_UNI: TStringField;
    TabSheet2: TTabSheet;
    CadFiliais: TQuery;
    DatacadFiliais: TDataSource;
    DBGridColor1: TDBGridColor;
    ConsultaPadrao1: TConsultaPadrao;
    CodigoTabela: TDBEditLocaliza;
    BitBtn1: TBitBtn;
    DuplicaItemNFEntrada: TDBCheckBox;
    CFGC_ENT_REP: TStringField;
    DBEditLocaliza1: TDBEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    CFGI_OPE_INI: TIntegerField;
    BBAjuda: TBitBtn;
    DBEditNumerico2: TDBEditNumerico;
    Label3: TLabel;
    CFGC_CLA_FIS: TStringField;
    Label4: TLabel;
    DBEditColor1: TDBEditColor;
    ETabelaServico: TDBEditLocaliza;
    BitBtn2: TBitBtn;
    CFGI_MES_EST: TIntegerField;
    CFGI_ANO_EST: TIntegerField;
    DBEditColor2: TDBEditColor;
    DBEditColor3: TDBEditColor;
    Label10: TLabel;
    Label11: TLabel;
    CFGC_PRO_NUM: TStringField;
    CarcaterCodPro: TDBCheckBox;
    AdicionaFil: TDBCheckBox;
    CFGC_ADI_FIL: TStringField;
    CFGC_MAS_SER: TStringField;
    CodFilSer: TDBCheckBox;
    TipoBal: TComboBoxColor;
    PortaBalanca: TEditColor;
    Label12: TLabel;
    Label13: TLabel;
    CFGC_CLA_PAD: TStringField;
    Label14: TLabel;
    EClassificacaoProduto: TDBEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label15: TLabel;
    CFGC_CFG_VEN: TStringField;
    TabSheet4: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    Label16: TLabel;
    CheckBox15: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CFGC_TIP_CUS: TStringField;
    MostraReservado: TDBCheckBox;
    CFGC_MOS_RES: TStringField;
    DBCheckBox1: TDBCheckBox;
    CFGC_VAL_CUS: TStringField;
    TabSheet6: TTabSheet;
    Label17: TLabel;
    DBEditLocaliza2: TDBEditLocaliza;
    SpeedButton3: TSpeedButton;
    Label18: TLabel;
    Label37: TLabel;
    EditLocaliza1: TEditLocaliza;
    SpeedButton10: TSpeedButton;
    Label38: TLabel;
    CFGI_OPE_REQ: TIntegerField;
    Label20: TLabel;
    DBEditLocaliza3: TDBEditLocaliza;
    SpeedButton4: TSpeedButton;
    Label21: TLabel;
    CFGI_REQ_CAN: TIntegerField;
    DBCheckBox2: TDBCheckBox;
    CFGC_IMP_TAG: TStringField;
    CFGI_SIT_REQ: TIntegerField;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CFGAfterPost(DataSet: TDataSet);
    procedure FecharClick(Sender: TObject);
    procedure mascaraProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure mascaraExit(Sender: TObject);
    procedure mascaraKeyPress(Sender: TObject; var Key: Char);
    procedure AlterarMascaraClick(Sender: TObject);
    procedure MascaraOkClick(Sender: TObject);
    procedure DBEditNumerico2Exit(Sender: TObject);
    procedure DBEditLocaliza1Select(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ETabelaServicoSelect(Sender: TObject);
    procedure PortaBalancaExit(Sender: TObject);
    procedure TipoBalExit(Sender: TObject);
    procedure EClassificacaoProdutoSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CFGBeforePost(DataSet: TDataSet);
    procedure CFGAfterEdit(DataSet: TDataSet);
    procedure EditLocaliza1Retorno(Retorno1, Retorno2: String);
  private
    function MontaItensPer : string;
    procedure ConfiguraItens(Itens : string);
    function MontaItensCusto : string;
    procedure ConfiguraItensCusto(Itens : string);
  public
    { Public declarations }
  end;

var
  FConfiguracoesProdutos: TFConfiguracoesProdutos;

implementation

uses APrincipal,funobjeto, funsql;

{$R *.DFM}

{ ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Modulo Básico
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ******************* Na Criacao do formulario ****************************** }
procedure TFConfiguracoesProdutos.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   CFG.open;
   AbreTabela(cadfiliais);
   IniciallizaCheckBox([QtdMin,QtdEst,DuplicaItemNFEntrada,CarcaterCodPro,
                        VerCodigpPro, MascaraProduto,GerarContasAPagar,
                        CodigoEmpresa, AdicionaFil, CodFilSer, MostraReservado, DBCheckBox1,DBCheckBox2 ], 'T', 'F');

   CadEmpresaPicture.open;  // produtos
   TipoBal.ItemIndex := Varia.TipoBalanca;
   PortaBalanca.Text := varia.PortaBalanca;
   ConfiguraItens(CFGC_CFG_VEN.AsString);
   ConfiguraItensCusto(CFGC_TIP_CUS.AsString);
   EditLocaliza1.text := Inttostr(varia.ImpressoraReqMat);
   EditLocaliza1.Atualiza;
   dbEditLocaliza2.atualiza;
   dbEditLocaliza3.atualiza;
end;

{ ******************* No fechamento do formulário **************************** }
procedure TFConfiguracoesProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CFG.close;
    FechaTabela(cadfiliais);
    CadEmpresaPicture.close;  //produtos
    action := cafree;
end;

{ *************** fecha o formulario *************************************** }
procedure TFConfiguracoesProdutos.FecharClick(Sender: TObject);
begin
close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
              configurações de Inicialização do Sistema
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ******************* Apos Gravar as alterações na tabela CFG **************** }
procedure TFConfiguracoesProdutos.CFGAfterPost(DataSet: TDataSet);
begin
   CarregaCFG(FPrincipal.BaseDados,CampoPermissaoModulo, Varia.CodigoEmpFil);
   FPrincipal.AlteraNomeEmpresa;
   TabSheet4.Enabled := false;
end;

{ ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                   Produtos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

procedure TFConfiguracoesProdutos.mascaraProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (not (key in [#57, #8])) then
 key := #;
end;

procedure TFConfiguracoesProdutos.mascaraExit(Sender: TObject);
begin
   if (sender as TDBEditColor).Text <> '' then
   if ((sender as TDBEditColor).Text[Length((sender as TDBEditColor).Text)] = '.') then
     (sender as TDBEditColor).Field.Value := copy((sender as TDBEditColor).Text,0, Length((sender as TDBEditColor).Text)-1);
end;

procedure TFConfiguracoesProdutos.mascaraKeyPress(Sender: TObject;
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

procedure TFConfiguracoesProdutos.AlterarMascaraClick(Sender: TObject);
begin
   Aux.close;
   Aux.SQL.Clear;
   Aux.SQL.Add('Select * from dba.CadClassificacao where I_COD_EMP = ' + CadEmpresaPicture.fieldByName('I_COD_EMP').AsString);
   Aux.open;
   if aux.EOF then
   begin
      AlterarEnabled([AlterarMascara,MascaraOK]);
      AlterarVisible([BotaoAlterar1,BotaoGravar1,BotaoCancelar1, Fechar]);
      CadEmpresaPicture.edit;
      mascaraProdutos.SetFocus;
   end
   else
    Aviso(CT_ClassificacaoDados);
end;

procedure TFConfiguracoesProdutos.MascaraOkClick(Sender: TObject);
begin
AlterarEnabled([AlterarMascara,MascaraOK]);
AlterarVisible([BotaoAlterar1,BotaoGravar1,BotaoCancelar1,Fechar]);
CadEmpresaPicture.Post;
Aux.close;
end;

procedure TFConfiguracoesProdutos.DBEditNumerico2Exit(Sender: TObject);
begin
if not((Sender as TDBEditNumerico).Field.AsInteger in [2,3]) then
   (Sender as TDBEditNumerico).Field.AsInteger := 2;
end;


procedure TFConfiguracoesProdutos.DBEditLocaliza1Select(Sender: TObject);
begin
CodigoTabela.ASelectValida.Clear;
CodigoTabela.ASelectValida.Add(' select I_cod_tab from cadtabelapreco ' +
                                ' where i_cod_emp = ' + CadFiliais.fieldByname('i_cod_emp').asstring +
                                ' and i_cod_tab = @' );
CodigoTabela.ASelectLocaliza.Clear;
CodigoTabela.ASelectLocaliza.Add(' select I_cod_tab from cadtabelapreco '+
                                  ' where i_cod_emp = ' + CadFiliais.fieldByname('i_cod_emp').asstring +
                                  ' and i_cod_tab like ''@%''' +
                                  ' group by i_cod_tab');
end;

procedure TFConfiguracoesProdutos.BitBtn1Click(Sender: TObject);
begin
  DBEditLocaliza1Select(nil);
  CadFiliais.edit;
  CodigoTabela.AAbreLocalizacao;
  CadFiliais.post;
end;

procedure TFConfiguracoesProdutos.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguracoesProdutos.HelpContext);
end;

procedure TFConfiguracoesProdutos.BitBtn2Click(Sender: TObject);
begin
  ETabelaServicoSelect(nil);
  CadFiliais.edit;
  ETabelaServico.AAbreLocalizacao;
  CadFiliais.post;

end;

procedure TFConfiguracoesProdutos.ETabelaServicoSelect(Sender: TObject);
begin
  ETabelaServico.ASelectValida.Clear;
  ETabelaServico.ASelectValida.Add(' select I_cod_tab from cadtabelapreco ' +
                                  ' where i_cod_emp = ' + CadFiliais.fieldByname('i_cod_emp').asstring +
                                  ' and i_cod_tab = @' );
  ETabelaServico.ASelectLocaliza.Clear;
  ETabelaServico.ASelectLocaliza.Add(' select I_cod_tab from cadtabelapreco '+
                                    ' where i_cod_emp = ' + CadFiliais.fieldByname('i_cod_emp').asstring +
                                    ' and i_cod_tab like ''@%''' +
                                    ' group by i_cod_tab');

end;

procedure TFConfiguracoesProdutos.PortaBalancaExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteString('PRODUTO','PORTABALANCA', PortaBalanca.Text);
  ini.free;
  varia.PortaBalanca := PortaBalanca.Text;
end;

procedure TFConfiguracoesProdutos.TipoBalExit(Sender: TObject);
var
  ini : TRegIniFile;
begin
  ini := TRegIniFile.Create('Software\Systec\Sistema');
  ini.WriteInteger('PRODUTO','TIPOBALANCA', TipoBal.ItemIndex );
  ini.free;
  varia.TipoBalanca := TipoBal.ItemIndex;
end;



procedure TFConfiguracoesProdutos.EClassificacaoProdutoSelect(
  Sender: TObject);
begin
  EClassificacaoProduto.ASelectLocaliza.text := 'Select * from CadClassificacao '+
                                                ' where c_nom_Cla like ''@%'''+
                                                ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                                ' and C_Con_Cla  = ''S'''+
                                                ' and C_Tip_Cla = ''P''';
  EClassificacaoProduto.ASelectValida.text := 'Select * from CadClassificacao '+
                                                ' where C_Cod_Cla = ''@'''+
                                                ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                                ' and C_Con_Cla = ''S'''+
                                                ' and C_Tip_Cla = ''P''';
end;

function TFConfiguracoesProdutos.MontaItensPer : string;
begin
   result := '00000000000000';
   if CheckBox1.Checked then
     result[1] :=  '1';
   if CheckBox2.Checked then
     result[2] :=  '1';
   if CheckBox3.Checked then
     result[3] :=  '1';
   if CheckBox4.Checked then
     result[4] :=  '1';
   if CheckBox5.Checked then
     result[5] :=  '1';
   if CheckBox6.Checked then
     result[6] :=  '1';
   if CheckBox15.Checked then
     result[7] :=  '1';
   if CheckBox7.Checked then
     result[8] :=  '1';
   if CheckBox8.Checked then
     result[9] :=  '1';
   if CheckBox9.Checked then
     result[10] :=  '1';
   if CheckBox10.Checked then
     result[11] :=  '1';
   if CheckBox11.Checked then
     result[12] :=  '1';
   if CheckBox12.Checked then
     result[13] :=  '1';
   if CheckBox13.Checked then
     result[14] :=  '1';
   if CheckBox14.Checked then
     result[15] :=  '1';
end;

procedure TFConfiguracoesProdutos.ConfiguraItens(Itens : string);
begin
 try
   if Itens[1] =  '1' then
     CheckBox1.Checked  := true;
   if Itens[2] =  '1' then
     CheckBox2.Checked  := true;
   if Itens[3] =  '1' then
     CheckBox3.Checked  := true;
   if Itens[4] =  '1' then
     CheckBox4.Checked  := true;
   if Itens[5] =  '1' then
     CheckBox5.Checked  := true;
   if Itens[6] =  '1' then
     CheckBox6.Checked  := true;
   if Itens[7] =  '1' then
     CheckBox15.Checked  := true;
   if Itens[8] =  '1' then
     CheckBox7.Checked  := true;
   if Itens[9] =  '1' then
     CheckBox8.Checked  := true;
   if Itens[10] =  '1' then
     CheckBox9.Checked  := true;
   if Itens[11] =  '1' then
     CheckBox10.Checked  := true;
   if Itens[12] =  '1' then
     CheckBox11.Checked  := true;
   if Itens[13] =  '1' then
     CheckBox12.Checked  := true;
   if Itens[14] =  '1' then
     CheckBox13.Checked  := true;
   if Itens[15] =  '1' then
     CheckBox14.Checked  := true;
  except
  end;
end;

procedure TFConfiguracoesProdutos.Button1Click(Sender: TObject);
begin
  MontaItensPer;
end;

procedure TFConfiguracoesProdutos.CFGBeforePost(DataSet: TDataSet);
begin
   CFGC_CFG_VEN.AsString := MontaItensPer;
   CFGC_TIP_CUS.AsString := MontaItensCusto;
end;

procedure TFConfiguracoesProdutos.CFGAfterEdit(DataSet: TDataSet);
begin
   TabSheet4.Enabled := true;
end;

function TFConfiguracoesProdutos.MontaItensCusto : string;
begin
   result := '0000';
   if CheckBox16.Checked then
     result[1] :=  '1';
   if CheckBox17.Checked then
     result[2] :=  '2';
   if CheckBox18.Checked then
     result[3] :=  '3';
   if CheckBox19.Checked then
     result[4] :=  '4';
end;

procedure TFConfiguracoesProdutos.ConfiguraItensCusto(Itens : string);
begin
 try
    if Itens[1] = '1' then
      CheckBox16.Checked  := true;
    if Itens[2] = '2' then
      CheckBox17.Checked  := true;
    if Itens[3] = '3' then
      CheckBox18.Checked  := true;
    if Itens[4] = '4' then
      CheckBox19.Checked  := true;
  except
  end;
end;

procedure TFConfiguracoesProdutos.EditLocaliza1Retorno(Retorno1,
  Retorno2: String);
var
  ini : TRegIniFile;
begin
  if retorno1 <> '' then
  begin
    ini := TRegIniFile.Create('Software\Systec\Sistema');
    ini.WriteInteger('IMPRESSORA','IMPRESSORAREQMATERIAL',StrtoInt(retorno1));
    ini.free;
    varia.TipoImpressoraRomaneio := StrtoInt(retorno1);
  end;
end;

Initialization
{*****************Registra a Classe para Evitar duplicidade********************}
   RegisterClasses([TFConfiguracoesProdutos]);
end.
