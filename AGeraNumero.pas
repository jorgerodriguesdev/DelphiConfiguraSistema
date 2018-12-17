unit AGeraNumero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Componentes1, LabelCorMove, Spin, ExtCtrls, Buttons,
  PainelGradiente;

type
  TFGeraNumero = class(TForm)
    EditColor1: TEditColor;
    Label1: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label5: TLabel;
    SpinEdit1: TSpinEdit;
    EditColor2: TEditColor;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    EditColor3: TEditColor;
    Button2: TButton;
    Label7: TLabel;
    EditColor4: TEditColor;
    PainelGradiente1: TPainelGradiente;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeraNumero: TFGeraNumero;

implementation

uses unRegistro, funhardware,APrincipal;
{$R *.DFM}

{****************** gera numero de registro ********************************* }
procedure TFGeraNumero.Button1Click(Sender: TObject);
var
  registro : TRegistro;
begin
registro := TRegistro.create;
EditColor2.Text := registro.GeraRegistro(SpinEdit1.value, EditColor1.Text, IntToStr(RadioGroup1.itemIndex));
EditColor4.Text := registro.GeraSerieLista('C:\');
registro.free;
end;

{************* na criacao do formulario ************************************** }
procedure TFGeraNumero.FormCreate(Sender: TObject);
begin
Label4.Caption := NumeroSerie('C:\');
EditColor1.Text := NumeroSerie('C:\');
end;

{********** chave para limpar o registro *********************************** }
procedure TFGeraNumero.Button2Click(Sender: TObject);
var
  registro : TRegistro;
begin
registro := TRegistro.create;
EditColor3.Text := registro.GeraChaveLimpaRegistro;
registro.free;
end;

{ *************** fecha formulario ****************************************** }
procedure TFGeraNumero.BitBtn2Click(Sender: TObject);
begin
self.close;
end;

{************** quando destroy o formulario ******************************** }
procedure TFGeraNumero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//action := cafree;
end;

end.
