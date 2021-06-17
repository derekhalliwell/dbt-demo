{% macro test_is_large_num(model, column_name) %}

with validation as (

    select
        {{ column_name }} as numerical_field

    from {{ model }}

),

validation_errors as (

    select
        numerical_field

    from validation

    where numerical_field > 100000

)

select count(*)
from validation_errors

{% endmacro %}