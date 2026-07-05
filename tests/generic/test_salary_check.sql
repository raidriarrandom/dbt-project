{% test salary_check(model, column_name) %}

SELECT 
    * 
FROM 
    {{ model }}
    WHERE {{ column_name }} > 100000
{% endtest %}