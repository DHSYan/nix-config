{ ... }:
{
  # virtualization
  virtualization.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # virtualisation.vmware.host.enable = true;
  users.extraGroups.vboxusers.members = [ "tzen" ];
  virtualization.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
