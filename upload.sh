dirNames="nemu"
time=$(date)

echo "pulling from git@comfluter.life"
cd PA/ICS_PA
git pull origin master

echo "**********************************************************"
echo "sync to github"
git push github master

echo "**********************************************************"
echo "git commit on CS server"
ssh -p 5227 pa201180078@114.212.10.200 "cd /home/pa201180078/pa_nju ; git add . ; git commit -m 'before sync from comfluter.life'"

for dir in $dirNames
do
    echo $time

    echo "**********************************************************"
    echo "copying to CS server"
    scp -P 5227 -r ./${dir} pa201180078@114.212.10.200:/home/pa201180078/pa_nju/
done

echo "**********************************************************"
echo "test your code!"
ssh -p 5227 pa201180078@114.212.10.200