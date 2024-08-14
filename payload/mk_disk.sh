rm -f ./disk.img

dd if=/dev/zero of=./disk.img bs=1M count=256
mkfs.ext2 ./disk.img

mkdir -p ./mnt
sudo mount ./disk.img ./mnt

sudo cp -rf ../../busybox/output_riscv64/* ./mnt/

sudo mkdir -p ./mnt/lib
sudo mkdir -p ./mnt/tmp
sudo mkdir -p ./mnt/proc
sudo mkdir -p ./mnt/dev
sudo mkdir -p ./mnt/testcases
sudo mkdir -p ./mnt/opt
sudo mkdir -p ./mnt/btp

sudo cp -r ../../lkmodel/btp/etc ./mnt/
sudo cp -r ../../lkmodel/btp/build/riscv64/sbin/ ./mnt/btp/
sudo cp ../../lkmodel/btp/syscalls ./mnt/opt/
sudo cp ../../lkmodel/btp/btp_tests ./mnt/opt/
sudo cp ../../dash/src/dash ./mnt/btp/sbin/

sudo rm ./mnt/sbin/init
sudo cp ./mnt/btp/sbin/init ./mnt/sbin/init

sudo cp -f ../../ltp/build_riscv64/testcases/bin/mmap[[:digit:]]* ./mnt/testcases/

sudo cp /usr/riscv64-linux-gnu/lib/ld-linux-riscv64-lp64d.so.1 ./mnt/lib/
sudo cp /usr/riscv64-linux-gnu/lib/libc.so.6 ./mnt/lib/
sudo cp /usr/riscv64-linux-gnu/lib/libm.so.6 ./mnt/lib/
sudo cp /usr/riscv64-linux-gnu/lib/libresolv.so.2 ./mnt/lib/

ls -l ./mnt/lib
ls -l ./mnt/testcases
ls -l ./mnt/opt
ls -l ./mnt/etc
ls -l ./mnt/

sudo umount ./mnt
rm -rf ./mnt
