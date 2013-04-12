{ Invokable implementation File for TWsPrueba which implements IWsPrueba }

unit WsPruebaImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, WsPruebaIntf,
             sysutils,DateUtils,sqlExpr,SyncObjs;
type

  { TWsPrueba }
  TWsPrueba = class(TInvokableClass, IWsPrueba)
  public
    Procedure Suma(a,b: integer; out result: integer); stdcall;
    Procedure Resta(a,b: integer; out result: integer); stdcall;
    function ConsultaProduccion : trRet_Produccion ;stdcall;
    function ConsultaAsegurado(ParametroPedido: trParametroConsAsegurado): trRet_Asegurado ;stdcall;
  end;

implementation
   uses DMWsvDatos;
var
 dmCP:   TDMWsDatos; //para consulta al datamodulo
 dmCA:   TDMWsDatos;
 CriticalSectionProduccion : TCriticalSection;
 CriticalSectionAsegurado : TCriticalSection;
 Limites_Fila_Consulta : Integer;

function TWsPrueba.ConsultaAsegurado(ParametroPedido: trParametroConsAsegurado): trRet_Asegurado ;stdcall;
var
  ArrayDetp : TArrayDetAsegurado;
  I: Integer;
  Recorrido: Integer;
begin
 try
    CriticalSectionAsegurado.Enter;
    dmCA := TDMWsDatos.Create(nil);
    Result := trRet_Asegurado.Create;
    Limites_Fila_Consulta:=200;
     //dmCA.qryAsegurado.Close;
     //dmCA.qryAsegurado.SQL.Clear;
     //dmCA.qryAsegurado.SQL.Add('select F.codigo O_CODIGO,F.nombre O_NOMBRE,F.cedula O_CI,F.ruc O_RUC,F.comercial O_COMERCIAL from fcodgeneral F ');
     //dmCA.qryAsegurado.SQL.Add('where upper(F.nombre) like ''%'+UpperCase(TRIM(ParametroPedido.NombreAsegurado))+'%'' and F.es_asegurado=''S'' order by 1,2');

     dmCA.qryAsegurado.Params.ParamByName('aseg').AsString:=ParametroPedido.NombreAsegurado;

     //dmCA.qryAsegurado.SQL.Add('select * from WS_CONS_ASEG('''+UpperCase(TRIM(ParametroPedido.NombreAsegurado))+''')');

     dmCA.qryAsegurado.Open;
     Result.CAB_CantFilas := dmCA.qryAsegurado.RecordCount;

     if (dmCA.qryAsegurado.RecordCount>100) then
       Recorrido:=150
     else
       Recorrido:=dmCA.qryAsegurado.RecordCount;


     if not dmCA.qryAsegurado.IsEmpty then
     begin
       SetLength(ArrayDetp,dmCA.qryAsegurado.RecordCount);
       for I := 0 to Recorrido-1 do
       begin
         ArrayDetp[I] := TarrayAsegurado.Create;
         if (TRIM(IntToStr(dmCA.qryAsegurado.FieldByName('O_CI').AsInteger))='') then
          begin
            if (trim(dmCA.qryAsegurado.FieldByName('O_RUC').AsString)='') then
                ArrayDetp[I].DET_DOC :='Sin Documento'
            else
             ArrayDetp[I].DET_DOC :=trim(dmCA.qryAsegurado.FieldByName('O_RUC').AsString)
          end
         else
             ArrayDetp[I].DET_DOC :=trim(IntToStr(dmCA.qryAsegurado.FieldByName('O_CI').AsInteger));
         ArrayDetp[I].DET_Codigo    := dmCA.qryAsegurado.FieldByName('O_CODIGO').AsString;
         ArrayDetp[I].DET_Nombre    := dmCA.qryAsegurado.FieldByName('O_NOMBRE').AsString;
         ArrayDetp[I].DET_Comercial := dmCA.qryAsegurado.FieldByName('O_COMERCIAL').AsString;
         if (Limites_Fila_Consulta <> 0) then
           if I = (Limites_Fila_Consulta-1) then
             Break;
         dmCA.qryAsegurado.Next;
       end;
       Result.DetAsegurado := ArrayDetp ;
     end
 finally
    dmCA.FBCONNECTION.Close;
    dmCA.Free;
    dmCA := nil;
    CriticalSectionAsegurado.Leave;
 end;
end;

function TWsPrueba.ConsultaProduccion : trRet_Produccion ;stdcall;
var
  ArrayDetp : TArrayDetProduccion;
  I: Integer;
begin
 try
    CriticalSectionProduccion.Enter;
    dmCP := TDMWsDatos.Create(nil);
    Result := trRet_Produccion.Create;
    Limites_Fila_Consulta:=200;

    try
     dmCp.qry1.Open;
     Result.CAB_CantFilas := dmCp.qry1.RecordCount;
     if not dmCp.qry1.IsEmpty then
     begin
       SetLength(ArrayDetp,dmCp.qry1.RecordCount);
       for I := 0 to dmCp.qry1.RecordCount-1 do
       begin
         ArrayDetp[I] := TarrayProduccion.Create;
         ArrayDetp[I].DET_Prod_Acumulada := dmCp.qry1o_PROD_ACUM.AsFloat;
         ArrayDetp[I].DET_Prod_Mes       := dmCp.qry1o_PROD_MES.AsFloat;
         ArrayDetp[I].DET_Prod_Meta      := dmCp.qry1o_PROD_META.AsFloat;
         ArrayDetp[I].DET_Prod_Sucursal  := dmCp.qry1o_PROD_SUC.AsString;
         if (Limites_Fila_Consulta <> 0) then
           if I = (Limites_Fila_Consulta-1) then
             Break;
         dmCp.qry1.Next;
       end;
       Result.DET_produccion := ArrayDetp ;
     end else
     begin
       // Result.CAB_CodRetorno := '050';
       //Result.CAB_DesRetorno := 'No existen Registros.';
     end;
    except
     on E : Exception do
     begin
       //Result.CAB_CodRetorno := '999';  {99 Igual a error de programa}
       //Result.CAB_DesRetorno := E.Message;
       //EscriboLOG('Error en Consulta :'+E.Message,True);
     end;
    end;
 finally
    dmCP.FBCONNECTION.Close;
    dmCP.Free;
    dmCP := nil;
    CriticalSectionProduccion.Leave;
 end;
end;

Procedure TWsPrueba.Suma(a,b: integer; out result: integer); stdcall;
begin
  Result := a+b;
end;
Procedure TWsPrueba.Resta(a,b: integer; out result: integer); stdcall;
begin
  Result := a-b;
end;

procedure WsPruebaFactory(out obj: TObject);
{$J+}
const
  iInstance: IWsPrueba = nil;
  instance: TWsPrueba = nil;
begin
  if instance = nil then
  begin
    instance := TWsPrueba.Create;
    instance.GetInterface(IWsPrueba, iInstance)
  end;
  obj := instance
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TWsPrueba, WsPruebaFactory);
   CriticalSectionProduccion := TCriticalSection.Create;
   CriticalSectionAsegurado := TCriticalSection.Create;

finalization
   CriticalSectionProduccion.Free;
   CriticalSectionAsegurado.Free;
end.

