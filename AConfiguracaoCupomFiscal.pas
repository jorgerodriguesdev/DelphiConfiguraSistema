unit AConfiguracaoCupomFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Componentes1, ExtCtrls, PainelGradiente, UnECF, ComCtrls, Spin,
  Buttons, Mask, numericos, Db, DBTables;

type
  TFConfiguraCupomFiscal = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    GroupBox4: TGroupBox;
    BitBtn5: TBitBtn;
    EditColor1: TEditColor;
    GroupBox5: TGroupBox;
    BitBtn6: TBitBtn;
    MemoColor1: TMemoColor;
    maisinfo: TSpeedButton;
    Label5: TLabel;
    GroupBox6: TGroupBox;
    AlicotasICMS: TListBoxColor;
    numerico1: Tnumerico;
    BitBtn7: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    AlicotasISS: TListBoxColor;
    numerico2: Tnumerico;
    BitBtn9: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn8: TBitBtn;
    Label11: TLabel;
    ICMS: TQuery;
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure maisinfoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     ECF : TECF;
     procedure ConfigHorarioVerao;
     procedure ConfigBotoesReducao;
  public
    { Public declarations }
  end;

var
  FConfiguraCupomFiscal: TFConfiguraCupomFiscal;

implementation

uses APrincipal,constantes, constMsg, funBases, funstring, fundata;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFConfiguraCupomFiscal.FormCreate(Sender: TObject);
begin
   ECF := TECF.criar( self, FPrincipal.BaseDados );
   if ECF.AbrePorta then
   begin
     ConfigHorarioVerao;
     ConfigBotoesReducao;
     AlicotasICMS.Items := ECF.RetornaAlicotasICMS(true);
     AlicotasISS.Items :=  ECF.RetornaAlicotasICMS(false);
     CheckBox1.Checked := ECF.ValoreArredondados;
     EditColor1.Text := ECF.RetornaUnidadeMonetaria;
   end;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConfiguraCupomFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ECF.FecharPorta;
 if ECF <> nil then
  ECF.Free;
 Action := CaFree;
end;

{ ********************** configura o horario da impressora ****************** }
procedure TFConfiguraCupomFiscal.ConfigHorarioVerao;
begin
  if ECF.RetornaVariaveis( 17 )[6] = '1' then
    label5.Caption := 'Entra Horário de Verão'
  else
    label5.Caption := 'Saída Horário de Verão';
end;

{********** permite ou naum modificar dados da impressora ******************** }
procedure TFConfiguraCupomFiscal.ConfigBotoesReducao;
begin
  if StrToInt(ECF.RetornaVariaveis( 27 )) = 0 then
  begin
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn7.Enabled := true;
    BitBtn9.Enabled := true;
    CheckBox1.Enabled := true;
    end
    else
    begin
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn9.Enabled := false;
    CheckBox1.Enabled := false;
  end;
end;

{*************** prg da moeda *********************************************** }
procedure TFConfiguraCupomFiscal.BitBtn5Click(Sender: TObject);
begin
  if EditColor1.Text <> '' then
    ECF.PrgMoeda(EditColor1.Text);
end;

{ ********************** Mundanca do horario de verao ************************ }
procedure TFConfiguraCupomFiscal.BitBtn6Click(Sender: TObject);
begin
  ECF.MudaHorarioVerao;
  ConfigHorarioVerao;
end;

{ *************** Mostra informações sobre a impressora fiscal ************* }
procedure TFConfiguraCupomFiscal.maisinfoClick(Sender: TObject);
var
  aux, data, hora : string;
  dataMov : TdateTime;
begin
  maisinfo.Down := true;
  MemoColor1.Lines.Clear;
  memocolor1.Lines.Add(' Número de Série : ' + ECF.RetornaVariaveis( 0 ));
  memocolor1.Lines.Add(' Número de Reduções : ' + ECF.RetornaVariaveis( 9 ));
  memocolor1.Lines.Add(' Número de Intervenções Técnicas : ' + ECF.RetornaVariaveis( 10 ));
  memocolor1.Lines.Add(' Número do Caixa : ' + ECF.RetornaVariaveis( 14 ));
  memocolor1.Lines.Add(' Número da Loja : ' + ECF.RetornaVariaveis( 15 ));
  memocolor1.Lines.Add(' Moeda Atual : ' + ECF.RetornaVariaveis( 16 ));
  aux := ECF.RetornaVariaveis( 26 );
  data := DateToStr(MontaDataTexto(copy(aux,1,6), true));
  hora := MontaHoraTexto(copy(aux,7,length(aux)));
  memocolor1.Lines.Add(' Data/Hora Ultima Redução : ' + data + ' - ' + hora );
  aux := ECF.RetornaVariaveis( 23 );
  data := DateToStr(MontaDataTexto(copy(aux,1,6), true));
  hora := MontaHoraTexto(copy(aux,7,length(aux)));
  memocolor1.Lines.Add(' Data/Hora da Impressora : ' + data + ' - ' + hora );
  memocolor1.Lines.Add(' Número Ultimo Cupom : ' + ECF.NumeroCupom);
  DataMov := MontaDataTexto(ECF.RetornaVariaveis( 27 ), true);
  if DataMov < StrToDate('01/01/1954') then
    memocolor1.Lines.Add(' Ultimo Movimento : 00/00/00')
  else
    memocolor1.Lines.Add(' Ultimo Movimento : ' + DatetoStr(dataMov));
  maisinfo.Down := false;
end;

{*********** altera a alicota do icms ************************************** }
procedure TFConfiguraCupomFiscal.BitBtn7Click(Sender: TObject);
begin
  ECF.InseriAlicota(numerico1.AValor, true);
  AlicotasICMS.Items :=  ECF.RetornaAlicotasICMS( true );
  ECF.AdicionaAlicotasTabela(ECF.RetornaVariaveis(0),varia.TipoImpressoraECF);
end;

{*********** altera a alicota do issqn ************************************** }
procedure TFConfiguraCupomFiscal.BitBtn9Click(Sender: TObject);
begin
  ECF.InseriAlicota(numerico2.AValor, false);
  AlicotasISS.Items :=  ECF.RetornaAlicotasICMS( false );
  ECF.AdicionaAlicotasTabela(ECF.RetornaVariaveis(0),varia.TipoImpressoraECF);
end;

{************* fecha o formualario ****************************************** }
procedure TFConfiguraCupomFiscal.BitBtn8Click(Sender: TObject);
begin
  close;
end;

{************* arredonda casas deciamis ************************************* }
procedure TFConfiguraCupomFiscal.CheckBox1Click(Sender: TObject);
begin
  ECF.Arredondar(CheckBox1.Checked);
end;

{************ acerta a tabela de alicotas de icms *************************** }
procedure TFConfiguraCupomFiscal.BitBtn1Click(Sender: TObject);
begin
 ECF.AdicionaAlicotasTabela(ECF.RetornaVariaveis(0),varia.TipoImpressoraECF);
end;


procedure TFConfiguraCupomFiscal.Button1Click(Sender: TObject);
begin
 aviso( ecf.RetornaVariaveis(145));
end;

Initialization
 RegisterClasses([TFConfiguraCupomFiscal]);
end.
