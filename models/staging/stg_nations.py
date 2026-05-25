import pandas as pd

def model(dbt, session):

    df = dbt.source("src", "nations")

    result = df.select(
        df["n_nationkey"].alias("nation_id"),
        df["n_regionkey"].alias("region_id"),
        df["n_name"].alias("name"),
        df["n_comment"].alias("comments")
    )

    return result
   