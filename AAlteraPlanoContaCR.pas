unit AAlteraPlanoContaCR;
{          Autor: Sergio Luiz Censi }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, DBTables, Db, DBCtrls, Grids, DBGrids,
  Buttons, Menus, constantes, formularios, PainelGradiente, constMsg,
  Tabela, Componentes1, LabelCorMove, funObjeto, Localizacao, Mask,
  EditorImagem, ImgList, numericos, DBKeyViolation;

type
  TFAlteraPlanoContaCR = class(TFormularioPermissao)
    CadPlano: TQuery;
    Imagens: TImageList;
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    Arvore1: TTreeView;
    EditLocaliza1: TEditLocaliza;
    ConsultaPadrao1: TConsultaPadrao;
    ImageList1: TImageList;
    PanelColor1: TPanelColor;
    BitBtn3: TBitBtn;
    Arvore: TTreeView;
    PanelColor3: TPanelColor;
    Contas: TQuery;
    DataContas: TDataSource;
    GridIndice1: TGridIndice;
    PanelColor4: TPanelColor;
    BLocaliza: TBitBtn;
    BitBtn5: TBitBtn;
    PanelColor5: TPanelColor;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    GBancos: TGridIndice;
    Bancos: TQuery;
    DataBancos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Arvore1Expanded(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Arvore1Collapsed(Sender: TObject; Node: TTreeNode);
    procedure BFecharClick(Sender: TObject);
    procedure ttClick(Sender: TObject);
    procedure EditLocaliza1Select(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    QdadeNiveis : Byte;
    VetorMascara : array [1..6] of byte;
    VetorNo: array [0..6] of TTreeNode;
    VetorNo1: array [0..6] of TTreeNode;
    PrimeiroNo,PrimeiroNo1 : TTreeNode;
    consultar : Boolean;
    ContasReceber : integer;
    Procedure CarregaMascara;
    procedure CarregaClassificacao(VetorInfo : array of byte );
    procedure LocalizaContas;
    procedure ExcluiPlanoCR(CodPlano : string);
    procedure ExcluiPlanoCP(CodPlano : string);
  public
    procedure CarregaConta(ContasReceber : integer);
  end;

type
  TDados = class
    Codigo    : string;
    Descricao : string;
    CreDeb : string;
    TamanhoMascara : string;
end;

type
  TDadosfilial = class
    CodigoEmpFil : integer;
  end;

var
  FAlteraPlanoContaCR : TFAlteraPlanoContaCR;

implementation

uses APrincipal, fundata, funsql, ANovoPlanoConta, funstring, APlanoConta;

{$R *.DFM}


{***********************No fechamento do Formulario****************************}
procedure TFAlteraPlanoContaCR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaTabela(CadPlano);
   Action := CaFree;
end;

{************************Quanto criado novo formulario*************************}
procedure TFAlteraPlanoContaCR.FormCreate(Sender: TObject);
begin
  consultar := true;
  Self.HelpFile := Varia.PathHelp + 'Financeiro.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;


{*********** carrega a mascara do plano de conta ***************************** }
Procedure TFAlteraPlanoContaCR.CarregaMascara;
begin
  FillChar(VetorMascara, SizeOf(VetorMascara), 0);

  CadPlano.sql.Clear;
  CadPlano.sql.Add('Select * from cadempresas where i_cod_emp = ' + IntToStr(varia.CodigoEmpresa) +
                           ' and C_MAS_PLA <> ''0''' );
  CadPlano.open;

  if not CadPlano.EOF then
    varia.MascaraPlanoConta := CadPlano.FieldByName('C_MAS_PLA').AsString  // carrega mascara
  else
  begin
    Aviso(CT_FilialSemMascara);   // caso a mascara seje 0
  end;

  QdadeNiveis := DesmontaMascara(VetorMascara, varia.MascaraPlanoConta);  // busca em constantes
end;


{************************carrega Classificacao*********************************}
procedure TFAlteraPlanoContaCR.CarregaClassificacao(VetorInfo : array of byte);
var
  Dado : TDados;
  no : TTreeNode;
  tamanho, nivel : word;
  codigo :string;
begin
  Arvore.Items.Clear;
  Arvore1.Items.Clear;
  Dado := Tdados.create;
  dado.Codigo := '';
  dado.Descricao := '';
  Dado.CreDeb := '';
  Dado.TamanhoMascara := IntToStr(vetorInfo[0]);

  no := arvore.Items.AddObject(arvore.Selected, 'Plano de Conta de',dado);
  no.ImageIndex:=0;
  no.SelectedIndex:=0;
  PrimeiroNo := no;
  VetorNo[0]:=no;
  Arvore.Update;

  no := arvore1.Items.AddObject(arvore.Selected, 'Plano de Conta para',dado);
  no.ImageIndex:=0;
  no.SelectedIndex:=0;
  PrimeiroNo1 := no;
  VetorNo1[0]:=no;
  Arvore1.Update;

  CadPlano.SQL.Clear;
  CadPlano.SQL.Add(' SELECT * FROM CAD_PLANO_CONTA WHERE I_COD_EMP = ' + IntToStr(varia.CodigoEmpresa) );
  if ContasReceber = 0 then
    CadPlano.SQL.Add(' and C_TIP_PLA = ''C'''   )
  else
    if ContasReceber = 1 then
      CadPlano.SQL.Add(' and C_TIP_PLA = ''D'''   );

  CadPlano.sql.Add(' ORDER BY C_CLA_PLA ');
  CadPlano.Open;

  while not(CadPlano.EOF) do
  begin
    tamanho := VetorInfo[0];
    nivel := 0;
    while length(CadPlano.FieldByName('C_CLA_PLA').AsString)<> tamanho do
    begin
      inc(nivel);
      tamanho:=tamanho+VetorInfo[nivel];
    end;

    codigo := CadPlano.FieldByName('C_CLA_PLA').AsString;

    dado :=  Tdados.create;
    dado.Codigo := Codigo;
    dado.Descricao := CadPlano.FieldByName('C_NOM_PLA').AsString;
    Dado.CreDeb := CadPlano.FieldByName('C_TIP_PLA').AsString;

    if VetorInfo[nivel + 1] <> 0 then
      Dado.TamanhoMascara := IntToStr(tamanho + VetorInfo[nivel+1])
   else
      Dado.TamanhoMascara := IntToStr(tamanho + 4);

    no := Arvore.Items.AddChildObject(VetorNo[nivel], codigo+ ' - '+
                                      CadPlano.FieldByName('C_NOM_PLA').AsString, dado);
    VetorNo[nivel+1]:= no;

    no := Arvore1.Items.AddChildObject(VetorNo1[nivel], codigo+ ' - '+
                                      CadPlano.FieldByName('C_NOM_PLA').AsString, dado);
    VetorNo1[nivel+1]:= no;
    CadPlano.Next;
  end;
  consultar := true;
  arvore.FullCollapse;
  arvore1.FullCollapse;
end;

{ *******************Cada vez que expandir um no*******************************}
procedure TFAlteraPlanoContaCR.Arvore1Expanded(Sender: TObject; Node: TTreeNode);
begin
   node.SelectedIndex:=1;
   node.ImageIndex:=1;
end;

{********************Cada vez que voltar a expanção de um no*******************}
procedure TFAlteraPlanoContaCR.Arvore1Collapsed(Sender: TObject; Node: TTreeNode);
begin
   node.SelectedIndex:=0;
   node.ImageIndex:=0;
end;



{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************************Fecha o Formulario corrente***********************}
procedure TFAlteraPlanoContaCR.BFecharClick(Sender: TObject);
begin
  close;
end;

{*********** localiza uma conta ********************************************* }
procedure TFAlteraPlanoContaCR.ttClick(Sender: TObject);
begin
  EditLocaliza1Select(nil);
  consultar := false;
  EditLocaliza1.AAbreLocalizacao;
  arvore.Selected := PrimeiroNo;
  arvore.Selected.Collapse(true);
  arvore.SetFocus;
  while TDados(arvore.Selected.Data).Codigo <> EditLocaliza1.Text  do
   arvore.Selected := arvore.Selected.GetNext;
  Arvore.SetFocus;
  consultar := true;
end;

{*********** localiza uma conta ********************************************* }
procedure TFAlteraPlanoContaCR.BitBtn5Click(Sender: TObject);
begin
  EditLocaliza1Select(nil);
  consultar := false;
  EditLocaliza1.AAbreLocalizacao;
  arvore1.Selected := PrimeiroNo1;
  arvore1.Selected.Collapse(true);
  arvore.SetFocus;
  while TDados(arvore1.Selected.Data).Codigo <> EditLocaliza1.Text  do
   arvore1.Selected := arvore1.Selected.GetNext;
  Arvore1.SetFocus;
  consultar := true;
end;

{************* select do edit localiza ************************************* }
procedure TFAlteraPlanoContaCR.EditLocaliza1Select(Sender: TObject);
begin
  EditLocaliza1.ASelectValida.clear;
  EditLocaliza1.ASelectValida.Add(' select * from cad_plano_conta '+
                                  ' where c_cla_pla = ''@''' );
  EditLocaliza1.ASelectLocaliza.clear;
  EditLocaliza1.ASelectLocaliza.Add(' select * from cad_plano_conta  ' +
                                    ' where c_nom_pla like ''@%''' );
  if ContasReceber = 0  then
  begin
    EditLocaliza1.ASelectValida.Add(' and C_TIP_PLA = ''C''');
    EditLocaliza1.ASelectLocaliza.Add(' and C_TIP_PLA = ''C''');
  end
  else
    if ContasReceber = 1  then
    begin
      EditLocaliza1.ASelectValida.Add(' and C_TIP_PLA = ''D''');
      EditLocaliza1.ASelectLocaliza.Add(' and C_TIP_PLA = ''D''');
    end;
end;


procedure TFAlteraPlanoContaCR.BitBtn4Click(Sender: TObject);
begin
  if Confirmacao(' Deseja alterar a conta selecionada pertencente ao plano de conta ' +
                 TDados(arvore.Selected.Data).descricao + ' para o ' +
                 TDados(arvore1.Selected.Data).descricao + '?') then
  begin
    if ContasReceber = 0 then
    begin
      ExecutaComandoSql(cadplano, ' update ite_caixa ' +
                                    ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                    ' where lan_Receber = ' + Contas.fieldByName('i_lan_rec').AsString +
                                    ' and emp_fil = ' + Contas.fieldByName('i_emp_fil').AsString );

      ExecutaComandoSql(cadplano, ' update cadcontasareceber ' +
                                  ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                  ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                  ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' +
                                  ' and i_emp_fil = ' + Contas.fieldByName('i_emp_fil').AsString +
                                  ' and i_lan_rec = ' + Contas.fieldByName('i_lan_rec').AsString);
       LocalizaContas;
     end
     else
       if ContasReceber = 1 then
       begin
        if Contas.fieldByName('i_lan_bac').AsInteger <> 0 then
          ExecutaComandoSql(cadplano, ' update movbancos ' +
                                      ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                      ' where i_lan_bac = ' + Contas.fieldByName('i_lan_bac').AsString);

          ExecutaComandoSql(cadplano, ' update ite_caixa ' +
                                        ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                        ' where lan_Pagar = ' + Contas.fieldByName('i_lan_apg').AsString +
                                        ' and emp_fil = ' + Contas.fieldByName('i_emp_fil').AsString );

          ExecutaComandoSql(cadplano, ' update cadcontasapagar ' +
                                      ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                      ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                      ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' +
                                      ' and i_emp_fil = ' + Contas.fieldByName('i_emp_fil').AsString +
                                      ' and i_lan_apg = ' + Contas.fieldByName('i_lan_apg').AsString);
         LocalizaContas;
       end
       else
         if ContasReceber = 2 then
         begin
           if trim(TDados(arvore.Selected.Data).CreDeb) = trim(TDados(arvore1.Selected.Data).CreDeb) then
           begin
             if bancos.fieldByName('i_lan_bac').AsInteger <> 0 then
               ExecutaComandoSql(cadplano, ' update movbancos ' +
                                          ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                          ' where i_lan_bac = ' + bancos.fieldByName('i_lan_bac').AsString);
              LocalizaContas;
           end
           else
             aviso('Tipos de contas diferente, ( Crédito ou Débito ) !! ' );
         end;
   end;
end;


procedure TFAlteraPlanoContaCR.BitBtn1Click(Sender: TObject);begin
  if Confirmacao(' Deseja alterar todas as contas pertencente ao plano de conta ' +
                 TDados(arvore.Selected.Data).descricao + ' para o ' +
                 TDados(arvore1.Selected.Data).descricao + '?') then
  begin
    if ContasReceber = 0 then
    begin
      ExecutaComandoSql(cadplano, ' update ite_caixa ' +
                                  ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                  ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                  ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );

      ExecutaComandoSql(cadplano, ' update cadcontasareceber ' +
                                  ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                  ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                  ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );
      LocalizaContas;
    end
    else
      if ContasReceber = 1 then
      begin
        ExecutaComandoSql(cadplano, ' update ite_caixa ' +
                                    ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                    ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                    ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );

        ExecutaComandoSql(cadplano, ' update movbancos ' +
                                    ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                    ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                    ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );

        ExecutaComandoSql(cadplano, ' update cadcontasapagar ' +
                                    ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                    ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                    ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );
        LocalizaContas;
      end
      else
       if ContasReceber = 2 then
       begin
          ExecutaComandoSql(cadplano, ' update movbancos ' +
                                      ' set c_cla_pla = ''' + TDados(arvore1.Selected.Data).Codigo + '''' +
                                      ' where i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                      ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );
          LocalizaContas;
       end;
  end;
end;

procedure TFAlteraPlanoContaCR.LocalizaContas;
begin
  LimpaSQLTabela(Contas);
  case ContasReceber of
  0 :  begin
         GBancos.Visible := false;
         AdicionaSQLTabela(contas, ' select * from cadcontasareceber cad key join movcontasareceber mov, cadclientes cli');
         AdicionaSQLTabela(contas, ' where cad.i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                   ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' +
                                  ' and cad.i_cod_cli = cli.i_cod_cli ');
         contas.open;
       end;
   1 : begin
         GBancos.Visible := false;
         AdicionaSQLTabela(contas, ' select * from cadcontasapagar cad key join movcontasapagar mov, cadclientes cli ');
         AdicionaSQLTabela(contas, ' where cad.i_cod_emp = ' + Inttostr(varia.CodigoEmpresa) +
                                   ' and c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' +
                                   ' and cad.i_cod_cli = cli.i_cod_cli ');
         contas.open;
       end;
   2 : begin
         LimpaSQLTabela(Bancos);
         GBancos.Visible :=  true;
         AdicionaSQLTabela(Bancos, ' select * from MovBancos ');
         AdicionaSQLTabela(Bancos, ' where c_cla_pla = ''' + TDados(arvore.Selected.Data).Codigo + '''' );
         Bancos.open;
       end;

   end;    
end;

procedure TFAlteraPlanoContaCR.ExcluiPlanoCR(CodPlano : string);
begin
  if confirmacao('Deseja realmente excluir o plano de conta ' + TDados(arvore.Selected.Data).Descricao) then
  begin
    AdicionaSQLAbreTabela(cadplano, ' select * from cadcontasareceber ' +
                                    ' where c_cla_pla = ''' + CodPlano + '''' +
                                    ' and i_cod_emp = ' + IntToStr(varia.CodigoEmpresa));

    if CadPlano.eof then
      AdicionaSQLAbreTabela(cadplano, ' select * from CadContasapagar ' +
                                      ' where c_cla_pla = ''' + CodPlano + '''' +
                                      ' and i_cod_emp = ' + IntToStr(varia.CodigoEmpresa))
    else
    begin
      aviso('Esta conta possui títulos vinculado no contas a receber !!');
      abort;
    end;


    if CadPlano.eof then
      AdicionaSQLAbreTabela(cadplano, ' select * from Ite_caixa ' +
                                      ' where c_cla_pla = ''' + CodPlano + '''' +
                                      ' and i_cod_emp = ' + IntToStr(varia.CodigoEmpresa))
    else
    begin
      aviso('Esta conta possui títulos vinculado no contas a pagar !!');
      abort;
    end;


    if CadPlano.eof then
      AdicionaSQLAbreTabela(cadplano, ' select * from Movbancos ' +
                                      ' where c_cla_pla = ''' + CodPlano + '''' +
                                      ' and i_cod_emp = ' + IntToStr(varia.CodigoEmpresa))
    else
    begin
      aviso('Esta conta possui títulos vinculado no caixa !!');
      abort;
    end;


    if CadPlano.eof then
    begin
       ExecutaComandoSql(CadPlano, ' delete Cad_Plano_conta ' +
                                   ' where c_cla_pla = ''' + CodPlano + '''' +
                                   ' and i_cod_emp = ' + IntToStr(varia.CodigoEmpresa));
       CarregaClassificacao(VetorMascara);
    end
    else
      aviso('Esta conta possui títulos vinculado nos bancos !!');

  end;
end;


procedure TFAlteraPlanoContaCR.ExcluiPlanoCP(CodPlano : string);
begin

end;


procedure TFAlteraPlanoContaCR.BitBtn2Click(Sender: TObject);
begin
  LocalizaContas;
end;

procedure TFAlteraPlanoContaCR.CarregaConta(ContasReceber : integer);
begin
  self.ContasReceber := ContasReceber;
  case ContasReceber of
  0 : begin
        PainelGradiente1.Caption := '   Reestruturação do Plano de Contas (Contas a Receber)   ';
      end;
  1 : begin
       PainelGradiente1.Caption := '   Reestruturação do Plano de Contas (Contas a Pagar)   ';
       GridIndice1.Columns[5].FieldName := 'n_vlr_dup';
      end;
  2 : begin
       PainelGradiente1.Caption := '   Reestruturação do Plano de Contas (Bancos)   ';
       GBancos.Visible := true;
      end;
  end;    
  CarregaMascara;
  CarregaClassificacao(VetorMascara);
  Arvore.Selected := PrimeiroNo;
  self.showmodal;
end;

procedure TFAlteraPlanoContaCR.BitBtn6Click(Sender: TObject);
begin
  FPlanoConta := TFPlanoConta.CriarSDI(application,'',true);
  if ContasReceber = 0 then
    FPlanoConta.CarregaPlanoContas('C')
  else
    if ContasReceber = 1 then
      FPlanoConta.CarregaPlanoContas('D');
  CarregaClassificacao(VetorMascara);
end;

procedure TFAlteraPlanoContaCR.BitBtn7Click(Sender: TObject);
begin
   if (arvore.Selected.Level=0) then
       abort;

   if (Arvore.Selected.HasChildren) then
     begin
       erro(CT_ErroExclusaoClassificaca);
       abort;
   end;

    ExcluiPlanoCR(TDados(arvore.Selected.Data).Codigo)

end;

end.
