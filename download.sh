dirNames="nemu"
time=$(date)

for dir in $dirNames
do
    echo $time

    echo "copying from CS server"
    scp -P 5227 -r pa201180078@114.212.10.200:/home/pa201180078/pa_nju/${dir} ./PA/ICS_PA/pa_nju/
done

echo "pushing to git@comfluter.life"
cd PA/ICS_PA
git pull origin
git add .
git commit -m "fetched new code from CS server"
git push origin master
