dirNames="nemu kernel"
time=$(date)

cd ..

# echo "commit and push on ubuntu@comfluter.life"
# echo $time
# ssh ubuntu@comfluter.life "cd /home/ubuntu/work/ICS_PA ; git add . ; git commit -m 'CHECKPOINT: before upload to CS server' ; git push origin master"


echo "**********************************************************"
echo $time
echo "pulling from git@comfluter.life"
cd PA/ICS_PA
git pull origin master

# echo "**********************************************************"
# echo $time
# echo "sync to github"
# git push github master

echo "**********************************************************"
echo "git commit on CS server"
ssh -p 5227 pa201180078@114.212.10.200 "cd /home/pa201180078/pa_nju ; git add . ; git commit -m 'CHECKPOINT: before sync from comfluter.life'"

for dir in $dirNames
do
    echo "**********************************************************"
    echo $time
    echo "copying to CS server: dir $dir"
    scp -P 5227 -r ./${dir} pa201180078@114.212.10.200:/home/pa201180078/pa_nju/
done

echo "**********************************************************"
echo "**                     All Done!                        **"
echo "**********************************************************"

echo "test your code!"
ssh -p 5227 pa201180078@114.212.10.200

