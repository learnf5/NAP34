# update lab environment
sudo ssh nginx test -e /etc/nginx/conf.d/default.conf && sudo ssh nginx rm /etc/nginx/conf.d/default.conf
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/{nginx,nap}.conf
sudo scp /tmp/nginx.conf nginx:/etc/nginx/
sudo scp /tmp/nap.conf   nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/hosts
sudo scp /tmp/hosts nginx:/etc/hosts
