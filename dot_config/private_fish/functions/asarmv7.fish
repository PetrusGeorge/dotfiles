function asarmv7
    arm-linux-gnu-as $argv[1] -g -o temp.o
    arm-linux-gnu-ld temp.o -o $argv[2]
    rm temp.o
end
