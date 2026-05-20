{% macro uro_mac(col, scale=2) -%}

    ( ({{ col }}) * 0.86 )::NUMBER(16, {{ scale }})

{%- endmacro %}
