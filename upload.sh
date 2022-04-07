dirNames="nemu"
time=$(date)

echo "pulling from git@comfluter.life"
cd PA/ICS_PA
git pull origin

echo "git commit on CS server"
ssh -p 5227 pa201180078@114.212.10.200 "cd /home/pa201180078/pa_nju ; git add . ; git commit -m 'before sync from comfluter.life'"

for dir in $dirNames
do
    echo $time

    echo "copying to CS server"
    scp -P 5227 -r ./${dir} pa201180078@114.212.10.200:/home/pa201180078/pa_nju/
done