unit AGrupos;
{          Autor: Sergio Luiz Censi
    Data Criação: 01/04/1999;
          Função: Cadastrar um novo
  Data Alteração: 01/04/1999;
    Alterado por: Rafael Budag
Motivo alteração: - Adicionado os comentários e o blocos nas rotinas, e realizado
                    um teste - 01/04/199 / Rafael Budag
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, Grids, DBGrids, Tabela, StdCtrls, Mask,
  DBCtrls, Db, BotaoCadastro, Buttons, DBTables, Componentes1,
  DBKeyViolation, constantes, Localizacao;

type
  TFGrupos = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    DatacadGrupos: TDataSource;
    MoveBasico1: TMoveBasico;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoAlterar1: TBotaoAlterar;
    BotaoExcluir1: TBotaoExcluir;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    BotaoFechar1: TBotaoFechar;
    Label1: TLabel;
    Label2: TLabel;
    DBEditColor2: TDBEditColor;
    GridIndice1: TGridIndice;
    Label3: TLabel;
    Codigo: TDBFilialColor;
    CodFil: TDBEditColor;
    ProximoCodigoFilial: TProximoCodigoFilial;
    Bevel1: TBevel;
    CadGrupos: TSQL;
    CadGruposI_EMP_FIL: TIntegerField;
    CadGruposI_COD_GRU: TIntegerField;
    CadGruposC_NOM_GRU: TStringField;
    Consulta: TLocalizaEdit;
    Label4: TLabel;
    ValidaGravacao1: TValidaGravacao;
    BBAjuda: TBitBtn;
    CadGruposD_ULT_ALT: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadGruposAfterInsert(DataSet: TDataSet);
    procedure CadGruposBeforePost(DataSet: TDataSet);
    procedure CadGruposAfterPost(DataSet: TDataSet);
    procedure CadGruposAfterEdit(DataSet: TDataSet);
    procedure GridIndice1Ordem(Ordem: String);
    procedure CodFilChange(Sender: TObject);
    procedure CadGruposAfterCancel(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
  private
    procedure ConfiguraConsulta( acao : Boolean);
  public
    { Public declarations }
  end;

var
  FGrupos: TFGrupos;

implementation

uses APrincipal, ANovaFilial;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFGrupos.FormCreate(Sender: TObject);
begin
   Codigo.ACodFilial := Varia.CodigoFilCadastro;
   Self.HelpFile := Varia.PathHelp + 'MaConfSistema.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   cadGrupos.SQL.clear;
   cadGrupos.sql.Add('Select * from CadGrupos' +
                     ' Where I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) );
   cadGrupos.sql.Add(' Order by I_COD_GRU ' );
   cadGrupos.Open;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cadGrupos.close;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações das Tabelas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{ ******************* Apos a Inserção de um novo grupo, configura filial ***** }
procedure TFGrupos.CadGruposAfterInsert(DataSet: TDataSet);
begin
   codFil.Field.Value := Varia.CodigoEmpFil;
   Codigo.ProximoCodigo;
   Codigo.ReadOnly := False;
   ProximoCodigoFilial.execute('cadGrupos','I_EMP_FIL',Varia.CodigoEmpFil);
   ConfiguraConsulta(false);
end;

{********Verifica se o codigo ja foi utilizado por algum usuario da rede*******}
procedure TFGrupos.CadGruposBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadGruposD_ULT_ALT.AsDateTime := Date;
  if CadGrupos.State = dsinsert then
     Codigo.VerificaCodigoRede;
end;

{*********************Coloca o campo chave em read-only************************}
procedure TFGrupos.CadGruposAfterEdit(DataSet: TDataSet);
begin
   Codigo.ReadOnly := True;
   ConfiguraConsulta(false);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****** configura a consulta, caso edit ou insert enabled = false *********** }
procedure TFGrupos.ConfiguraConsulta( acao : Boolean);
begin
   Consulta.Enabled := acao;
   GridIndice1.Enabled := acao;
   Label4.Enabled := acao;
end;

{******************************Atualiza a tabela*******************************}
procedure TFGrupos.CadGruposAfterPost(DataSet: TDataSet);
begin
   CadGrupos.Close;
   CadGrupos.Open;
   ConfiguraConsulta(true);
end;

{ *************  Altera a order by da consulta ****************************** }
procedure TFGrupos.GridIndice1Ordem(Ordem: String);
begin
Consulta.AOrdem := Ordem;
end;

{************  valida gravacao do formulario ******************************** }
procedure TFGrupos.CodFilChange(Sender: TObject);
begin
if CadGrupos.State in [ dsInsert, dsEdit ] then
  ValidaGravacao1.execute;
end;

{*********** apos o cancelamento da operacao da tabela *********************** }
procedure TFGrupos.CadGruposAfterCancel(DataSet: TDataSet);
begin
  ConfiguraConsulta(true);
end;

procedure TFGrupos.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FGrupos.HelpContext);
end;

Initialization
 RegisterClasses([TFGrupos]);
end.
 