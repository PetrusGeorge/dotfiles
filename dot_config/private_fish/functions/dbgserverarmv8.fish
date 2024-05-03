function dbgserverarmv8
    qemu-aarch64 -L /usr/aarch64-linux-gnu -g 1234 $argv[1]
end
