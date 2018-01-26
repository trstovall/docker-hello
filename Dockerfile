
# docker image build -t hello:latest .; docker image prune -f; docker image rm alpine

from alpine as stage0
copy hello.asm /root/
run apk update \
    && apk add nasm binutils \
    && cd /root \
    && nasm -f elf64 hello.asm \
    && ld -s -o hello hello.o

from scratch
copy  --from=stage0 /root/hello /
cmd ["/hello"]
