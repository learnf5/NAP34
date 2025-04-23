# update nginx host for the specific lab
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/HTTP/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                   nginx:/etc/nginx/nginx.conf
sudo scp /tmp/nap.orig                                     nginx:/etc/nginx/conf.d/nap.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/POLICY/simplify_requests.json
sudo scp /tmp/simplify_requests.json                       nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/my-default-policy.json
sudo scp /tmp/my-default-policy.json                       nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/SIGNATURES/policy_viol_filetype.json
sudo scp /tmp/policy_viol_filetype.json                    nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/SIGNATURES/{my-filetypes.txt,{local-policy}.json,app-protect-security-updates.key}
sudo scp /tmp/my-filetypes.txt                             nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                            nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/app-protect-security-updates.key             nginx:/home/student/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/LEAKAGE/{uds,user_sig_policy}.json
sudo scp /tmp/user_sig_policy.json                    nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/uds.json                    nginx:/etc/app_protect/conf/nap.d

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/DOS/{{nginx,nap}.WAF,policy_data_guard.json}
sudo scp /tmp/nginx.WAF                                    nginx:/etc/nginx/
sudo scp /tmp/nap.WAF                                      nginx:/etc/nginx/conf.d/
sudo scp /tmp/policy_data_guard.json                       nginx:/etc/app_protect/conf/nap.d/

#On student workstation/jump box
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/DOS/GoodTraffic.sh
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/DOS/BadTraffic.sh
sudo mkdir --parents /home/student/Desktop/Lab_Files/
sudo mv /tmp/GoodTraffic.sh                               /home/student/Desktop/Lab_Files/GoodTraffic.sh
sudo mv /tmp/BadTraffic.sh                                /home/student/Desktop/Lab_Files/BadTraffic.sh
sudo chmod 755 /home/student/Desktop/Lab_Files/GoodTraffic.sh
sudo chmod 755 /home/student/Desktop/Lab_Files/BadTraffic.sh

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/hosts
sudo scp /tmp/hosts nginx:/etc/hosts
