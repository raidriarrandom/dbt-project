{{
      config(
          materialized = 'table'
      )
  }}
  
  with session_source as (
      select
          a.SESSION_ID,
          a.USER_ID,
          a.BROWSER,
          a.DEVICE_TYPE,
          b.country_name as country_name,
          b.continent as continent,
          b.currency as currency,
          a.START_TIME,
          a.END_TIME,
          a.PAGES_VISITED,
          CURRENT_TIMESTAMP AS INSERT_DTS
      from {{ source('session', 'SESSION_SRC') }} a
      left join {{ ref('country_code') }} b
          on a.COUNTRY_CODE = b.country_code
  )
  
  select * from session_source
  
