{
  config,
  inputs,
  ...
}: {
  services.udev = {
    # For realtime-privileges
    # rw access to /dev/cpu_dma_latency to prevent CPUs from going into idle state
    extraRules = ''
      KERNEL=="cpu_dma_latency", GROUP="realtime"
    '';
  };
}
