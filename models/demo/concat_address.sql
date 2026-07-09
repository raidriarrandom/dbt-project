{{
    config 
    ( 
        materialized = 'table'
    )
}}
SELECT {{ concat_macro('123 Street','Chicago') }} as name 