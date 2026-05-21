{% macro compare(col1, col2) -%}

    abs(({{col1}} / 0.86) - {{col2}})

{%- endmacro %}
