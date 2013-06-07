create or alter procedure AAA_OCULTA_DESOCULTA_ELEMTS (
    I_NOMBRE_SP char(10) character set UNICODE_FSS,
    I_SIOCULTA_NOOCULTA char(1))
returns (
    O_INFO char(300))
as
declare variable V_SP_ID smallint;
declare variable V_SP_SRC blob sub_type 1 segment size 80;
begin
  /* Procedure Text */


for SELECT
 A.RDB$PROCEDURE_ID,
 A.RDB$PROCEDURE_SOURCE
 FROM rdb$procedures A
 WHERE
 rtrim(upper(A.RDB$PROCEDURE_NAME))=rtrim(upper(:i_nombre_sp))
 into :v_sp_id,:v_sp_src
do begin
 if (:i_sioculta_nooculta='S') then
  begin
        if (not exists(select * from figuana b where b.id=:v_sp_id)) then
         begin
           insert into figuana(id,sp_src) values (:v_sp_id,:v_sp_src);
           o_info='Se insertó iguana, se oculto sp: '||rtrim(upper(:i_nombre_sp));
         end
        else o_info='Necesita restaurar : '||rtrim(upper(:i_nombre_sp))||' para poder modificar';
    select fe.texto_oculto FROM fempresa fe into :v_sp_src;
    update rdb$procedures set rdb$procedure_source = :v_sp_src
     where rtrim(upper(RDB$PROCEDURE_NAME))=rtrim(upper(:i_nombre_sp));
  end
 else if (:i_sioculta_nooculta='N') then
  begin
     if (exists(select * from figuana b where b.id=:v_sp_id)) then
      begin
           select first 1 figuana.sp_src from figuana where figuana.id=:v_sp_id
             into :v_sp_src;
           update rdb$procedures
             set rdb$procedure_source = :v_sp_src
             where rtrim(upper(RDB$PROCEDURE_NAME))=rtrim(upper(:i_nombre_sp));
           delete from figuana where figuana.id=:v_sp_id;
           o_info='Se escribio nuevamente el sp: '||rtrim(upper(:i_nombre_sp));
      end
      else o_info='No se realzizó accion alguna al sp: '||rtrim(upper(:i_nombre_sp));
  end
  else o_info='Error sp: '||rtrim(upper(:i_nombre_sp));
end
 if (rtrim(upper(:o_info))='') then
     o_info='No existe el SP!!!';
 suspend;
end
