terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "cicd-test"

    workspaces {
      name = "gh-actions"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_database" "dev_db" {
  name    = "DEV_DB"
  comment = "Database for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_database" "prod_db" {
  name    = "PROD_DB"
  comment = "Database for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_schema" "demo_schema_demo_db" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_schema" "demo_schema_dev_db" {
  database = snowflake_database.dev_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}

resource "snowflake_schema" "demo_schema_prod_db" {
  database = snowflake_database.prod_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"

  lifecycle {
    ignore_changes = all
  }
}
