# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/nginx.conf
sudo scp /tmp/nginx.conf nginx:/etc/nginx/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/POLICY/nap.conf
sudo scp /tmp/nap.conf   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/HTTP/{nginx,nap}.orig
sudo scp /tmp/nginx.orig nginx:/etc/nginx/
sudo scp /tmp/nap.orig   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/POLICY/simplify_requests.json
sudo scp /tmp/simplify_requests.json nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/my-default-policy.json
sudo scp /tmp/my-default-policy.json nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/policy_{transparent,viol_{http,evasion,filetype}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion,filetype}}.json nginx:/etc/app_protect/conf/nap.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/hosts
sudo scp /tmp/hosts nginx:/etc/hosts
