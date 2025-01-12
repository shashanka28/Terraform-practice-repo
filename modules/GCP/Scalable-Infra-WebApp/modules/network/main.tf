resource "google_compute_network" "default" {
  name                    = "prod-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name          = "prod-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.default.id
}


///  Use multiple subnets in your VPC for distributing traffic across different regions or availability zones. This ensures redundancy and scalability /////////


resource "google_compute_subnetwork" "subnet_1" {
  name          = "prod-subnet-1"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.default.id
}




resource "google_compute_subnetwork" "subnet_2" {
  name          = "prod-subnet-2"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.default.id
}




resource "google_compute_global_address" "lb_ip" {
  name = "prod-lb-ip"
}
/// Allocates a static IP address for your application. This IP is the entry point for external traffic ///



resource "google_compute_global_forwarding_rule" "default" {
  name       = "prod-forwarding-rule"
  ip_address = google_compute_global_address.lb_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.default.self_link
}
/// Listens for traffic on the assigned IP address and port, and forwards requests to the target HTTP proxy ///



resource "google_compute_url_map" "default" {
  name            = "prod-url-map"
  default_service = google_compute_backend_service.default.self_link
}
/// Defines routing rules to send traffic to the appropriate backend service ///

resource "google_compute_target_http_proxy" "default" {
  name   = "prod-http-proxy"
  url_map = google_compute_url_map.default.self_link
}
/// Acts as a bridge between the forwarding rule and the URL map, determining where to route the traffic based on URL paths ///




resource "google_compute_backend_service" "default" {
  name        = "prod-backend-service"
  health_checks = [google_compute_health_check.default.self_link]

  backend {
    group = google_compute_instance_group.default.self_link
  }
}
/// Manages traffic distribution to backend resources (e.g., instance groups) and monitors their health using a health check ///





