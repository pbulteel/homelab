# © Broadcom. All Rights Reserved.
# The term “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
# SPDX-License-Identifier: BSD-2-Clause

/*
    DESCRIPTION:
    Ubuntu Server 24.04 LTS build variables.
    Packer Plugin for VMware vSphere: 'vsphere-iso' builder.
*/

//  BLOCK: variable
//  Defines the input variables.

// proxmox Credentials

variable "proxmox_api_url" {
  type        = string
  description = "The fully qualified domain name or IP address of the Proxmox Server instance."
}

variable "proxmox_api_token_id" {
  type        = string
  description = "The username to login to the proxmox Server instance."
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "The password for the login to the proxmox Server instance."
  sensitive   = true
}

variable "proxmox_insecure_skip_tls_verify" {
  type        = bool
  description = "Do not validate proxmox Server TLS certificate."
}

// proxmox Settings

variable "node" {
  type        = string
  description = "The name of the target proxmox host."
  default     = ""
}

variable "vsphere_network" {
  type        = string
  description = "The name of the target vSphere network segment."
}

variable "vsphere_folder" {
  type        = string
  description = "The name of the target vSphere folder."
  default     = ""
}

variable "proxmox_resource_pool" {
  type        = string
  description = "The name of the target proxmox resource pool."
  default     = ""
}

variable "vsphere_set_host_for_datastore_uploads" {
  type        = bool
  description = "Set this to true if packer should use the host for uploading files to the datastore."
  default     = false
}

// Virtual Machine Settings

variable "vm_guest_os_language" {
  type        = string
  description = "The guest operating system lanugage."
  default     = "en_US"
}

variable "vm_guest_os_keyboard" {
  type        = string
  description = "The guest operating system keyboard input."
  default     = "us"
}

variable "vm_guest_os_timezone" {
  type        = string
  description = "The guest operating system timezone."
  default     = "UTC"
}

variable "vm_guest_os_family" {
  type        = string
  description = "The guest operating system family. Used for naming."
  default     = "linux"
}

variable "vm_guest_os_name" {
  type        = string
  description = "The guest operating system name. Used for naming."
}

variable "vm_guest_os_version" {
  type        = string
  description = "The guest operating system version. Used for naming."
}

variable "vm_guest_os_type" {
  type        = string
  description = "The guest operating system type, also know as guestid."
}

variable "vm_guest_os_cloudinit" {
  type        = bool
  description = "Enable cloud-init for the guest operating system."
  default     = false
}

variable "vm_firmware" {
  type        = string
  description = "The virtual machine firmware."
  default     = "efi-secure"
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type."
  default     = "sata"
}

variable "vm_cdrom_count" {
  type        = string
  description = "The number of virtual CD-ROMs remaining after the build."
  default     = 1
}

variable "vm_cpu_count" {
  type        = number
  description = "The number of virtual CPUs."
  default     = 2
}

variable "vm_cpu_cores" {
  type        = number
  description = "The number of virtual CPUs cores per socket."
  default     = 1
}

variable "vm_cpu_hot_add" {
  type        = bool
  description = "Enable hot add CPU."
  default     = false
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB."
  default     = 2048
}

variable "vm_mem_hot_add" {
  type        = bool
  description = "Enable hot add memory."
  default     = false
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB."
  default     = 40960
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence."
  default     = ["pvscsi"]
}

variable "vm_disk_thin_provisioned" {
  type        = bool
  description = "Thin provision the virtual disk."
  default     = true
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type."
  default     = "vmxnet3"
}

variable "common_vm_version" {
  type        = number
  description = "The vSphere virtual hardware version."
}

variable "common_tools_upgrade_policy" {
  type        = bool
  description = "Upgrade VMware Tools on reboot."
  default     = true
}

variable "common_remove_cdrom" {
  type        = bool
  description = "Remove the virtual CD-ROM(s)."
  default     = true
}

// Template and Content Library Settings

variable "common_template_conversion" {
  type        = bool
  description = "Convert the virtual machine to template. Must be 'false' for content library."
  default     = false
}

variable "common_content_library_enabled" {
  type        = bool
  description = "Import the virtual machine into the vSphere content library."
  default     = true
}

variable "common_content_library" {
  type        = string
  description = "The name of the target vSphere content library, if enabled."
  default     = null
}

variable "common_content_library_ovf" {
  type        = bool
  description = "Export to content library as an OVF template."
  default     = true
}

variable "common_content_library_destroy" {
  type        = bool
  description = "Delete the virtual machine after exporting to the content library."
  default     = true
}

variable "common_content_library_skip_export" {
  type        = bool
  description = "Skip exporting the virtual machine to the content library. Option allows for testing/debugging without saving the machine image."
  default     = false
}

// OVF Export Settings

variable "common_ovf_export_enabled" {
  type        = bool
  description = "Enable OVF artifact export."
  default     = false
}

variable "common_ovf_export_overwrite" {
  type        = bool
  description = "Overwrite existing OVF artifact."
  default     = true
}

// Removable Media Settings

variable "common_iso_content_library_enabled" {
  type        = bool
  description = "Import the guest operating system ISO into the vSphere content library."
  default     = false
}

variable "common_iso_content_library" {
  type        = string
  description = "The name of the target vSphere content library for the guest operating system ISO."
}

variable "common_iso_datastore" {
  type        = string
  description = "The name of the target vSphere datastore for the guest operating system ISO."
}

variable "iso_datastore_path" {
  type        = string
  description = "The path on the source vSphere datastore for the guest operating system ISO."
}

variable "iso_file" {
  type        = string
  description = "The file name of the guest operating system ISO."
}

variable "iso_content_library_item" {
  type        = string
  description = "The vSphere content library item name for the guest operating system ISO."
}

// Boot Settings

variable "common_data_source" {
  type        = string
  description = "The provisioning data source. One of `http` or `disk`."
}

variable "common_http_ip" {
  type        = string
  description = "Define an IP address on the host to use for the HTTP server."
  default     = null
}

variable "common_http_port_min" {
  type        = number
  description = "The start of the HTTP port range."
}

variable "common_http_port_max" {
  type        = number
  description = "The end of the HTTP port range."
}

variable "vm_boot_order" {
  type        = string
  description = "The boot order for virtual machines devices."
  default     = "disk,cdrom"
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait before boot."
  default     = "5s"
}

variable "common_ip_wait_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP address response."
}

variable "common_ip_settle_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP to settle down."
  default     = "5s"
}

variable "common_shutdown_timeout" {
  type        = string
  description = "Time to wait for guest operating system shutdown."
}

// Communicator Settings and Credentials

variable "build_username" {
  type        = string
  description = "The username to login to the guest operating system."
  sensitive   = true
}

variable "build_password" {
  type        = string
  description = "The password to login to the guest operating system."
  sensitive   = true
}

variable "build_password_encrypted" {
  type        = string
  description = "The encrypted password to login the guest operating system."
  sensitive   = true
}

variable "build_key" {
  type        = string
  description = "The public key to login to the guest operating system."
  sensitive   = true
}

variable "communicator_proxy_host" {
  type        = string
  description = "The proxy server to use for SSH connection. (Optional)"
  default     = null
}

variable "communicator_proxy_port" {
  type        = number
  description = "The port to connect to the proxy server. (Optional)"
  default     = null
}

variable "communicator_proxy_username" {
  type        = string
  description = "The username to authenticate with the proxy server. (Optional)"
  default     = null
}

variable "communicator_proxy_password" {
  type        = string
  description = "The password to authenticate with the proxy server. (Optional)"
  sensitive   = true
  default     = null
}

variable "communicator_port" {
  type        = number
  description = "The port for the communicator protocol."
  default     = 22
}

variable "communicator_timeout" {
  type        = string
  description = "The timeout for the communicator protocol."
  default     = "30m"
}

// Ansible Credentials

variable "ansible_username" {
  type        = string
  description = "The username for Ansible to login to the guest operating system."
  sensitive   = true
}

variable "ansible_key" {
  type        = string
  description = "The public key for Ansible to login to the guest operating system."
  sensitive   = true
}

// HCP Packer Settings

variable "common_hcp_packer_registry_enabled" {
  type        = bool
  description = "Enable the HCP Packer registry."
  default     = false
}
// Additional Settings

variable "additional_packages" {
  type        = list(string)
  description = "Additional packages to install."
  default     = []
}
