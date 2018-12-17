unit AConfiguracaoCodigoBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Componentes1,  Grids, DBGrids, Tabela, Db,
  DBTables, ExtCtrls, PainelGradiente, Mask, numericos, Buttons, UnCodigoBarra;

Type
  TDados = class
   private
    Tamanho : Integer;
    Nome : string;
    Codigo : String;
  end;

type
  TFConfiguraCodigoBarra = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    CadBarras: TSQL;
    DataBarras: TDataSource;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    ComboBoxColor1: TComboBoxColor;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    numerico1: Tnumerico;
    numerico2: Tnumerico;
    numerico3: Tnumerico;
    numerico4: Tnumerico;
    numerico5: Tnumerico;
    numerico7: Tnumerico;
    Aux: TQuery;
    Label1: TLabel;
    EditColor1: TEditColor;
    GroupBox5: TGroupBox;
    Lista: TListBoxColor;
    PanelColor3: TPanelColor;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BFechar: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DBGridColor1: TDBGridColor;
    CadBarrasC_NOM_BAR: TStringField;
    CadBarrasC_COD_BAR: TStringField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BBAjuda: TBitBtn;
    CadBarrasI_COD_BAR: TIntegerField;
    CadBarrasD_ULT_ALT: TDateField;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxColor1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure numerico1Change(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CadBarrasAfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure CadBarrasBeforePost(DataSet: TDataSet);
  private
    IgnoraCheck : Boolean;
    UnBarra : TCodigoBarra;
    procedure CarregaTamanhos;
    procedure CarregaMascaraBarra;
    procedure AdicionaTipo( tipo, Codigo : string; Tamanho : Integer  );
    procedure ExcluiTipo( tipo : string );
    procedure AlteraTipo( tipo : string; Tamanho : Integer );
    function MontaConfig : String;
    procedure DesaBilitaCheck( check : array of TCheckBox );
    procedure ValidaGravacao;
  public
    { Public declarations }
  end;

var
  FConfiguraCodigoBarra: TFConfiguraCodigoBarra;

implementation

uses APrincipal, FunSql, Funstring, ConstMsg, FunOBjeto, Constantes;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguraCodigoBarra.FormCreate(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  UnBarra := TCodigoBarra.create;
  AbreTabela(CadBarras);
  IgnoraCheck := true;
  CarregaTamanhos;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguraCodigoBarra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FechaTabela(CadBarras);
 UnBarra.destroy;
 Action := CaFree;
end;

{******* carrega os dados na tela, nos checkbox conforme mascara da empresa *** }
procedure TFConfiguraCodigoBarra.CarregaMascaraBarra;
var
  mascara : string;
  Tipo, Tamanho : TStringList;
  laco : integer;
begin
  Mascara := CadBarrasC_COD_BAR.AsString;
  DesaBilitaCheck([CheckBox1,CheckBox2,CheckBox3,CheckBox4,CheckBox5,CheckBox6,CheckBox7] );
  AlterarEnabledDet([CheckBox1,CheckBox2,CheckBox3,CheckBox4,CheckBox5,CheckBox6,CheckBox7], true );
  lista.Clear;
  ComboBoxColor1.ItemIndex := StrToInt(mascara[1]);
  tipo := UnBarra.retornaItem(mascara);
  tamanho := UnBarra.retornaTamanhos(mascara);

  for laco := 0 to Tipo.count - 1 do
    case tipo.Strings[laco][1] of
      'A' : begin CheckBox1.Checked := true; numerico1.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'B' : begin CheckBox2.Checked := true; numerico2.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'C' : begin CheckBox3.Checked := true; numerico3.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'D' : begin CheckBox4.Checked := true; numerico4.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'E' : begin CheckBox5.Checked := true; numerico5.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'F' : begin CheckBox7.Checked := true; numerico7.AValor := StrToInt(Tamanho.Strings[laco]); end;
      'G' : CheckBox6.Checked := true;
    end;
end;

{************** configura a barra conforme tipo escolhido ******************* }
procedure TFConfiguraCodigoBarra.ComboBoxColor1Change(Sender: TObject);
begin
{TipoBarra.Bar_Caption := EditColor1.text;
  case ComboBoxColor1.ItemIndex of
    0 : TipoBarra.Bar_CodeType := EAN_8;
    1 : TipoBarra.Bar_CodeType := EAN_13;
    2 : TipoBarra.Bar_CodeType := CODE128_A;
    3 : TipoBarra.Bar_CodeType := CODE128_B;
    4 : TipoBarra.Bar_CodeType := CODE128_C;
  end;
  MontaConfig;
  ValidaGravacao; }
end;

{ ******************* Carrega os Tamanhos Padrao para alguns itens *********** }
procedure TFConfiguraCodigoBarra.CarregaTamanhos;
begin
  AdicionaSQLAbreTabela(aux, 'select * from cadempresas where i_cod_emp = ' + IntToStr(varia.CodigoEmpresa) );
  numerico3.AValor := Length(Aux.fieldByName('C_PIC_CLA').AsString);
  numerico4.AValor := Length(Aux.fieldByName('C_PIC_PRO').AsString);
  numerico7.AValor := Length(Aux.fieldByName('C_PIC_PRO').AsString);
  FechaTabela(aux);
end;

{ *********** Adiciona Um novo tipo na lista ******************************** }
procedure TFConfiguraCodigoBarra.AdicionaTipo( tipo, Codigo : string; Tamanho : Integer );
var
  Dado : Tdados;
begin
 Dado := TDados.create;
 Dado.Tamanho := Tamanho;
 Dado.Nome := Tipo;
 Dado.Codigo := Codigo;
 Lista.Items.AddObject(tipo + ' ( '+ IntToStr(Tamanho) + ' ) ', dado);
 MontaConfig;
end;

{ *************** esclui un tipo da lista *********************************** }
procedure TFConfiguraCodigoBarra.ExcluiTipo( tipo : string );
var
  laco : Integer;
begin
for laco := 0 to Lista.Items.Count - 1 do
 if TDados(Lista.Items.Objects[Laco]).Nome = tipo then
 begin
   lista.Items.Delete(laco);
   MontaConfig;
   exit;
  end;
end;

{ ****************** altera um tipo de item ********************************** }
procedure TFConfiguraCodigoBarra.AlteraTipo( tipo : string; Tamanho : Integer );
var
  laco : Integer;
begin
for laco := 0 to Lista.Items.Count - 1 do
 if TDados(Lista.Items.Objects[Laco]).Nome = tipo then
 begin
   TDados(Lista.Items.Objects[Laco]).Tamanho := Tamanho;
   Lista.Items.Strings[laco] := tipo + ' ( '+ IntToStr(Tamanho) + ' ) ';
   MontaConfig;
   exit;
  end;
end;

{** quando clicar em um checkbox, configura a lista ************************}
procedure TFConfiguraCodigoBarra.CheckBox1Click(Sender: TObject);
var
  tamanho : Integer;
  Codigo : String;
begin
if  IgnoraCheck then
  if (sender is TCheckBox) then
  begin
    case (sender as TCheckBox).Tag of
      1 : begin Tamanho := Trunc(numerico1.AValor); Codigo := 'A'; end;
      2 : begin Tamanho := Trunc(numerico2.AValor); Codigo := 'B'; end;
      3 : begin
            Tamanho := Trunc(numerico3.AValor); Codigo := 'C';
            if (not (sender as TCheckBox).Checked) and (not Config.CodigoUnicoProduto) then
              CheckBox4.Checked := false;  // sempre que desmarcar desmarca tb produtos e marca o sequencial, caso o codigo do produto naum seja unico
          end;
      4 : begin
            Tamanho := Trunc(numerico4.AValor); Codigo := 'D';
            if (not Config.CodigoUnicoProduto) and (not CheckBox3.Checked) then
                CheckBox3.Checked := true;  // caso naum seja unico tb  marcar a classificacao
            if (not (sender as TCheckBox).Checked) and ( not CheckBox7.Checked ) then
               CheckBox7.Checked := true;   // caso desmarque o pruduto marcar o sequencial
          end;
      5 : begin Tamanho := Trunc(numerico5.AValor); Codigo := 'E'; end;
      6 : begin
            Tamanho := Trunc(numerico7.AValor); Codigo := 'F';
            if ( not (sender as TCheckBox).Checked ) and ( not CheckBox4.Checked ) then
                CheckBox4.Checked := true; // caso desmarcar o sequencial marcar o produto
          end;
      7 : begin
            Tamanho := 0; Codigo := 'G';
            Lista.Clear;
            DesaBilitaCheck([CheckBox1,CheckBox2,CheckBox3,CheckBox4,CheckBox5,CheckBox7] );
            AlterarEnabled([CheckBox1,CheckBox2,CheckBox3,CheckBox4,CheckBox5,CheckBox7]);
            if not CheckBox6.Checked then
              CheckBox4.Checked := true;
          end;
    end;

     if (sender as TCheckBox).Checked then
       AdicionaTipo((sender as TCheckBox).Hint,codigo, Tamanho)
     else
       ExcluiTipo((sender as TCheckBox).Hint);
  end;
  ValidaGravacao;
end;

{*** cria a mascara do codigo de barra que sera gravado na tabela de empresa **}
function TFConfiguraCodigoBarra.MontaConfig : String;
var
  laco : Integer;
  QdadeCaracter : Integer;
begin
QdadeCaracter := 0;
result := '';
result := IntToStr(ComboBoxColor1.itemindex);
  for laco := 0 to Lista.Items.Count - 1 do
  begin
    result := result +  TDados(Lista.Items.Objects[Laco]).Codigo +
              AdicionaCharE('0', IntTostr(TDados(Lista.Items.Objects[Laco]).Tamanho),2);
    QdadeCaracter := QdadeCaracter + TDados(Lista.Items.Objects[Laco]).Tamanho;
  end;

  case ComboBoxColor1.ItemIndex of
    0 : if QdadeCaracter > 7 then Aviso('Código muito grande para utilizar o Tipo EAN 8');
    1 : if QdadeCaracter > 12 then Aviso('Código muito grande para utilizar o Tipo EAN 13');
  end;


  EditColor1.Text := UnBarra.GeraCodigoBarra( result, IntToStr(varia.CodigoEmpresa),
                                           IntToStr(varia.CodigoEmpFil), '01001001', '0001',
                                           '8367637','123','628736451918736');
end;

{******** muda um item de lugar para cima ************************************}
procedure TFConfiguraCodigoBarra.SpeedButton1Click(Sender: TObject);
begin
if lista.ItemIndex <> 0 and -1  then
  lista.Items.Move(lista.ItemIndex, lista.ItemIndex - 1);
lista.ItemIndex := lista.ItemIndex;
lista.SetFocus;
MontaConfig;
end;

{******** muda um item de lugar para baixo ************************************}
procedure TFConfiguraCodigoBarra.SpeedButton2Click(Sender: TObject);
var
  proximo : integer;
begin
proximo := lista.ItemIndex + 1;
if lista.ItemIndex <> lista.Items.Count - 1 and -1  then
  lista.Items.Move(lista.ItemIndex, proximo);
if proximo = 1 then      // configura o focus da lista
  lista.ItemIndex := lista.ItemIndex + 1
else
  lista.ItemIndex := lista.ItemIndex + 2;
lista.SetFocus;
MontaConfig;
end;

{********** quando muda um tamanho altera a lista ************************** }
procedure TFConfiguraCodigoBarra.numerico1Change(Sender: TObject);
begin
if ( sender is Tnumerico) then
 AlteraTipo((sender as Tnumerico).Hint,Trunc((sender as Tnumerico).AValor));
end;

{ ***************** fecha o formulario ************************************** }
procedure TFConfiguraCodigoBarra.BFecharClick(Sender: TObject);
begin
self.close;
end;

{************* desabilita os CheckBox **************************************** }
procedure TFConfiguraCodigoBarra.DesaBilitaCheck( check : array of TCheckBox );
var
  laco : Integer;
begin
  IgnoraCheck := false;
  for laco := 0 to high(check) do
    if check[laco].Checked then
      check[laco].Checked := false;
  IgnoraCheck := true;
end;

{************* verifica se pode ou naum gravar a configuracao da barra ******* }
procedure TFConfiguraCodigoBarra.ValidaGravacao;
begin
if (ComboBoxColor1.text <> '') and (Lista.Items.Count <> 0) then
begin
  BitBtn1.Enabled := true;
  BitBtn2.Enabled := true;
end
else
begin
  BitBtn1.Enabled := false;
  BitBtn2.Enabled := false;
end

end;

{************* Grava a masacara na ttabela de Codigos de Barra *************** }
procedure TFConfiguraCodigoBarra.BitBtn1Click(Sender: TObject);
var
  VpaNomeBarra : string;
begin
  InserirReg(CadBarras);
  if Entrada( 'Nome da Barra', 'Digite o Nome da Barra', VpaNomeBarra, false,FPrincipal.CorFoco.AFundoComponentes, FPrincipal.CorForm.ACorPainel) then
  begin
    CadBarrasI_COD_BAR.AsInteger := ProximoCodigo('Cad_Codigo_barra','i_cod_bar', FPrincipal.BaseDados);
    CadBarrasC_NOM_BAR.AsString := VpaNomeBarra;
    CadBarrasC_COD_BAR.AsString := MontaConfig;
    GravaReg(CadBarras);
    AtualizaSQLTabela(CadBarras);
  end
  else
    CadBarras.cancel;
end;

{********** quando movimenta a grade de empresa configura tela ************** }
procedure TFConfiguraCodigoBarra.CadBarrasAfterScroll(DataSet: TDataSet);
begin
if CadBarrasC_COD_BAR.AsString <> '' then
 CarregaMascaraBarra;
end;

procedure TFConfiguraCodigoBarra.BitBtn2Click(Sender: TObject);
begin
  if ConfirmacaoFormato(CT_RegravarBarra,[cadBarrasC_NOM_BAR.Asstring]) then
  begin
    EditarReg(CadBarras);
    CadBarrasC_COD_BAR.AsString := MontaConfig;
    GravaReg(CadBarras);
    AtualizaSQLTabela(CadBarras);
  end;
end;

procedure TFConfiguraCodigoBarra.BitBtn3Click(Sender: TObject);
begin
if (Confirmacao(CT_DeletaRegistro + CadBarrasC_NOM_BAR.AsString)) and (not CadBarras.IsEmpty) then
begin
  DeletarRegAtual(CadBarras);
  AtualizaSQLTabela(cadbarras);
  ValidaGravacao;
end;
end;

procedure TFConfiguraCodigoBarra.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConfiguraCodigoBarra.HelpContext);
end;

{******************* antes de gravar o registro *******************************}
procedure TFConfiguraCodigoBarra.CadBarrasBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadBarrasD_ULT_ALT.AsDateTime := Date;
end;

Initialization
 RegisterClasses([TFConfiguraCodigoBarra]);
end.

