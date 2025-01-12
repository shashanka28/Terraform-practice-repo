resource "google_sql_database_instance" "default" {
  name             = "prod-database"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}



