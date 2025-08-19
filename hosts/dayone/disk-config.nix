# Example to create a bios compatible gpt partition
{ lib, ... }:
{
  disko.devices = {
    disk = {
      sda = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02";
            };
            esp = {
              name = "ESP";
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              name = "root";
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };

      #   disk2 = {
      #     device = "/dev/sda";
      #     type = "disk";
      #     content = {
      #       type = "gpt";
      #       partitions = {
      #         drive = {
      #           name = "drive1";
      #           size = "100%";
      #           content = {
      #             type = "filesystem";
      #             format = "ext4";
      #             mountpoint = "/mnt/drive1";
      #           };
      #         };
      #       };
      #     };
      #   };
      #   disk3 = {
      #     device = "/dev/sdb";
      #     type = "disk";
      #     content = {
      #       type = "gpt";
      #       partitions = {
      #         drive = {
      #           name = "drive2";
      #           size = "100%";
      #           content = {
      #             type = "filesystem";
      #             format = "ext4";
      #             mountpoint = "/mnt/drive2";
      #           };
      #         };
      #       };
      #     };
      #   };
      #   disk4 = {
      #     device = "/dev/sdd";
      #     type = "disk";
      #     content = {
      #       type = "gpt";
      #       partitions = {
      #         drive = {
      #           name = "drive3";
      #           size = "100%";
      #           content = {
      #             type = "filesystem";
      #             format = "ext4";
      #             mountpoint = "/mnt/drive3";
      #           };
      #         };
      #       };
      #     };
      #   };
    };
  };
}
