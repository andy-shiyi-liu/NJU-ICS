dirNames="log"
time=$(date)

cd ..

for dir in $dirNames
do
    echo $time

    echo "copying from CS server: dir $dir"
    scp -P 5227 -r pa201180078@114.212.10.200:/home/pa201180078/pa_nju/${dir} ./PA/ICS_PA/
done

echo "**********************************************************"

echo "pushing to git@comfluter.life"
cd PA/ICS_PA
echo "pwd: ${pwd}"
git add .
git commit -m "CHECKPOINT: fetched new code from CS server"
git pull origin master
git push origin master

echo "**********************************************************"
echo "**                     All Done!                        **"
echo "**********************************************************"
