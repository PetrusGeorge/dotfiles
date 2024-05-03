function dbgserverarmv7
    qemu-arm -L /usr/arm-linux-gnu -g 1234 $argv[1]
end
