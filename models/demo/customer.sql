{{ 
    config 
    (
        materialized = 'table'
    )
}}







with CUSTOMER_SRC AS 
( 
    SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE, 
    COUNTRY, 
    CREATED_AT, 
    CURRENT_TIMESTAMP AS INSERT_DTS 
    FROM {{source('customer', 'CUSTOMER_SRC')}}
)


SELECT * FROM CUSTOMER_SRC 
