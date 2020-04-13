PROCEDURE P_TMRP0010_LAST_READ IS
    ----------------------------------------------------------------------------
    v_trg_table varchar2(30) := 'TMRP0010_LAST_READ';
    ----------------------------------------------------------------------------
    v_src_table_01 varchar2(30) := 'FACT_METER_READ';
    ----------------------------------------------------------------------------
  BEGIN
    gv_proc := 'P_TMRP0010_LAST_READ';
    pl.logger := util.logtype.init(gv_pkg ||'.'||gv_proc);

    pl.drop_table(gv_stg_owner, v_trg_table);

    gv_sql := '
      CREATE TABLE '||gv_stg_owner||'.'||v_trg_table||'
      parallel 32 nologging compress
      AS
      SELECT
        RWN.sp_id,
        RWN.mr_id,
        RWN.READ_DTTM OKUMA,
        RWN.MTR_ID,
        RWN.PREV_READ_DTTM,
