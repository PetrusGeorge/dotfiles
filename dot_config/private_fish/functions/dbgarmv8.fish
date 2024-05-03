function dbgarmv8
    gdb -q --nh -ex 'set architecture arm64' -ex 'target remote localhost:1234' -ex 'layout split' -ex 'layout regs'
end
