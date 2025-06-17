resource "google_compute_network" "custom_vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "name" {
  name = "${var.vpc_name}-private-subnet"
  ip_cidr_range = var.private_subnet_cidr
  region = var.region
  network = google_compute_network.custom_vpc.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "public_subnet" {
  name = "${var.vpc_name}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  region = var.region
  network = google_compute_network.custom_vpc.id
}

resource "google_compute_router" "nat_router" {
  name = "${var.vpc_name}-router"
  region = var.region
  network = google_compute_network.custom_vpc.id
}

resource "google_compute_router_nat" "nat_config" {
  name = "${var.vpc_name}-nat"
  router = google_compute_router.nat_router.name
  region = var.region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "name" {
  name = "allow-internal"
  network = google_compute_network.custom_vpc_name

  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }

  source_ranges = ["10.0.0.0/8"]
  direction = "INGRESS"
  priority = 65534
}

resource "google_compute_firewall" "allow_ssh" {
  name = "allow-ssh"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
    source_ranges = var.ssh_source_ranges
    direction = "INGRESS"
    priority = 1000
}