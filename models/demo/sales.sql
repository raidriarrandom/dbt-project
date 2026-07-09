with sales_source as (
      SELECT
          SALE_ID,
          SALE_DATE,
          CUSTOMER_ID,
          PRODUCT_ID,
          QUANTITY,
          TOTAL_AMOUNT,
          CREATED_AT,
          CURRENT_TIMESTAMP AS INSERT_DTS
      FROM {{ source('sales', 'SALES_SRC') }}

      {% if is_incremental() %}
      where CREATED_AT > (select max(CREATED_AT) from {{ this }})
      {% endif %}
  )

  select * from sales_source