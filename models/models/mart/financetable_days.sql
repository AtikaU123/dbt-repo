{{ config(materialized="table") }}
select *
from {{ ref('finance_days') }}



