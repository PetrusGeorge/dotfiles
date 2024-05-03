function dbgarmv7
    gdb -q --nh -ex 'set architecture arm' -ex 'target remote localhost:1234' -ex 'layout split' -ex 'layout regs'
end
