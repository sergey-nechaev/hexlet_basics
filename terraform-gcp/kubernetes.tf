resource "kubernetes_secret" "cloudsql_db_credentials" {
  depends_on = ["google_container_cluster.hexlet_basics"]
   "metadata" {
       name = "cloudsql-db-credentials"
   }


   data {
       username = "${var.db_username}"
       password = "${var.db_password}"
   }
 }


resource "kubernetes_secret" "cloudsql_instance_credentials" {
  depends_on = ["google_container_cluster.hexlet_basics"]
	metadata {
		name = "cloudsql-instance-credentials"
	}
	data {
		credentials.json = "${base64decode(google_service_account_key.cloudsql_proxy.private_key)}"
	}
}

