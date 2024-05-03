function asarmv8
    aarch64-linux-gnu-as $argv[1] -g -o temp.o
    aarch64-linux-gnu-ld temp.o -o $argv[2]
    rm temp.o
end
