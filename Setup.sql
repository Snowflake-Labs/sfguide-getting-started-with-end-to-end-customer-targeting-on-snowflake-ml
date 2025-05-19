USE ROLE ACCOUNTADMIN;
create database if  not exists ML_MODELS;

create schema   if  not exists  ML_MODELS.DS;
create schema if not exists ML_MODELS.FEATURE_STORE;
create schema if not exists ML_MODELS.ML_REGISTRY;


create warehouse if not exists  DS_W WAREHOUSE_SIZE = MEDIUM;
create stage if not exists ML_MODELS.DS.MODEL_OBJECT   ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');


CREATE ROLE if not exists FR_SCIENTIST;

grant usage on database ML_MODELS to role FR_SCIENTIST;

grant all on schema ML_MODELS.DS to role FR_SCIENTIST;
grant all on schema ML_MODELS.FEATURE_STORE to role FR_SCIENTIST;
grant all on schema ML_MODELS.ML_REGISTRY to role FR_SCIENTIST;


grant usage on warehouse ML_FS_WH to role FR_SCIENTIST;
grant read on stage  ML_MODELS.DS.MODEL_STAGE  to role FR_SCIENTIST;
grant write on stage  ML_MODELS.DS.MODEL_STAGE  to role FR_SCIENTIST;





CREATE OR REPLACE WAREHOUSE SNOWPARK_OPT_WH  WITH
  WAREHOUSE_SIZE = 'MEDIUM'
  WAREHOUSE_TYPE = 'SNOWPARK-OPTIMIZED';