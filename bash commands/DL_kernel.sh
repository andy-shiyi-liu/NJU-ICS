time=$(date)

cd ..

echo "remake on CS server"
ssh -p 5227 pa201180078@114.212.10.200 "cd /home/pa201180078/pa_nju/kernel ; make clean ; make"

echo "**********************************************************"

echo $time
echo "copying from CS server: file $dir"
scp -P 5227 pa201180078@114.212.10.200:/home/pa201180078/pa_nju/kernel/kernel* ./PA/ICS_PA/kernel

echo "**********************************************************"

echo "upload to git@comfluter.life"

scp -r ./PA/ICS_PA/kernel/kernel* ubuntu@comfluter.life:/home/ubuntu/work/ICS_PA/kernel

echo "**********************************************************"

echo "Re-generate objdump file"
ssh ubuntu@comfluter.life "cd /home/ubuntu/work/ICS_PA/ ; ./scripts/objdump4nemu-i386 -d kernel/kernel | tee kernel/kernel_objdump.log"

echo "**********************************************************"
echo "**                     All Done!                        **"
echo "**********************************************************"

sleep 60