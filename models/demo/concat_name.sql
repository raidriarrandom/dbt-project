{{
    config 
    ( 
        materialized = 'table'
    )
}}
SELECT {{ concat_macro('John','Smith') }} as name 
