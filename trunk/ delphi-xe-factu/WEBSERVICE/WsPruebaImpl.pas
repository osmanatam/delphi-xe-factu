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
  end;

implementation
   uses DMWsvDatos;
var
 dmCP:   TDMWsDatos; //para consulta al datamodulo
 CriticalSectionProduccion : TCriticalSection;
 Limites_Fila_Consulta : Integer;

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
         ArrayDetp[I].DET_Prod_Acumulada := dmCp.qry1PROD_ACUM.AsFloat;
         ArrayDetp[I].DET_Prod_Mes       := dmCp.qry1PROD_MES.AsFloat;
         ArrayDetp[I].DET_Prod_Meta      := dmCp.qry1PROD_META.AsFloat;
         ArrayDetp[I].DET_Prod_Sucursal  := dmCp.qry1PROD_SUC.AsString;
         //if (Limites_Fila_Consulta <> 0) then
           //if I = (Limites_Fila_Consulta-1) then
            // Break;
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

finalization
   CriticalSectionProduccion.Free;
end.

