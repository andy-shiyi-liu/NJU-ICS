dirNames="nemu"
time=$(date)

for dir in $dirNames
do
    echo $time

    echo "copying from CS server"
    scp -P 5227 -r pa201180078@114.212.10.200:/home/pa201180078/pa_nju/${dir} ./PA/ICS_PA/pa201180078/pa_nju/

    echo "login to comfluter.life and commit"
    ssh ubuntu@comfluter.life
    cd /home/ubuntu/work/ICS_PA
    git add .
    git commit -m "Backup before download: ${date}"
    exit

    echo "copying to comfluter.life"
    scp -r ./PA/ICS_PA/pa201180078/pa_nju/${dir} ubuntu@comfluter.life:/home/ubuntu/work/ICS_PA/
done