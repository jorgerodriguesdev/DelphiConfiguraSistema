unit AAlteraAtividadeUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, constMsg, constantes,
  LabelCorMove, Tabela, PainelGradiente, formularios, Componentes1;

type
  TFAlterarAtividade = class(TFormularioPermissao)
    UsuariosS: TQuery;
    UsuariosN: TQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    UsuariosNI_COD_USU: TIntegerField;
    UsuariosNC_NOM_USU: TStringField;
    UsuariosNC_NOM_LOG: TStringField;
    UsuariosNC_SEN_USU: TStringField;
    UsuariosNC_USU_ATI: TStringField;
    UsuariosNC_OBS_USU: TStringField;
    UsuariosND_DAT_MOV: TDateField;
    UsuariosSI_COD_USU: TIntegerField;
    UsuariosSC_NOM_USU: TStringField;
    UsuariosSC_NOM_LOG: TStringField;
    UsuariosSC_SEN_USU: TStringField;
    UsuariosSC_USU_ATI: TStringField;
    UsuariosSC_OBS_USU: TStringField;
    UsuariosSD_DAT_MOV: TDateField;
    PainelGradiente1: TPainelGradiente;
    UsuariosNI_EMP_FIL: TIntegerField;
    UsuariosSI_EMP_FIL: TIntegerField;
    PanelColor1: TPanelColor;
    Label1: TLabel;
    DBGridColor1: TDBGridColor;
    Ativa: TSpeedButton;
    Desativa: TSpeedButton;
    DBGridColor2: TDBGridColor;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    UsuariosSD_ULT_ALT: TDateField;
    UsuariosND_ULT_ALT: TDateField;
    procedure AtivaClick(Sender: TObject);
    procedure DesativaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlterarAtividade: TFAlterarAtividade;
  arrasto : boolean;

implementation

uses APrincipal;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFAlterarAtividade.FormCreate(Sender: TObject);
begin
arrasto := false;
UsuariosN.Params[0].Value := Varia.CodigoEmpFil;
UsuariosS.Params[0].Value := Varia.CodigoEmpFil;
UsuariosN.open;
UsuariosS.open;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFAlterarAtividade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
UsuariosN.close;
UsuariosS.close;
Action := CaFree;
end;

{ ******************* Ativa o Usuario para S ********************************* }
procedure TFAlterarAtividade.AtivaClick(Sender: TObject);
begin
if Not UsuariosN.EOF then
begin
   UsuariosN.Edit;
   UsuariosNC_USU_ATI.Value := 'S';
   UsuariosND_ULT_ALT.AsDateTime := date;
   UsuariosN.Post;
   UsuariosS.close;
   UsuariosS.open;
   UsuariosN.close;
   UsuariosN.open;
end;
end;

{ ******************** Desativa o Usuario par N ****************************** }
procedure TFAlterarAtividade.DesativaClick(Sender: TObject);
begin
if Not UsuariosS.EOF then
begin
   UsuariosS.Edit;
   UsuariosSC_USU_ATI.Value := 'N';
   UsuariosSD_ULT_ALT.AsDateTime := date;
   UsuariosS.Post;
   UsuariosS.close;
   UsuariosS.open;
   UsuariosN.close;
   UsuariosN.open;
end;
end;

{ ******************** Ativa Usuario ***************************************** }
procedure TFAlterarAtividade.DBGrid2DblClick(Sender: TObject);
begin
AtivaClick(sender);
end;

{ ******************** Desativa Usuario ************************************** }
procedure TFAlterarAtividade.DBGrid1DblClick(Sender: TObject);
begin
DesativaClick(sender);
end;

{ ********************* Fechar o formulario ********************************** }
procedure TFAlterarAtividade.BitBtn1Click(Sender: TObject);
begin
FAlterarAtividade.Close;
end;

{ ********************* Configura a cor do form ****************************** }
procedure TFAlterarAtividade.FormShow(Sender: TObject);
begin
self.Color := FPrincipal.CorForm.ACorPainel;
end;



Initialization
 RegisterClasses([TFAlterarAtividade]);
end.
