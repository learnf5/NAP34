# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/LEAKAGE/nginx.conf
sudo scp /tmp/nginx.conf                                    nginx:/etc/nginx/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/ATTACK/nap.conf
sudo scp /tmp/nap.conf                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/HTTP/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap.orig                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/POLICY/simplify_requests.json
sudo scp /tmp/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/my-default-policy.json
sudo scp /tmp/my-default-policy.json                        nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/ATTACK/{policy_viol_filetype.json,my-filetypes.txt,local-policy.json}
sudo scp /tmp/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/LEAKAGE/{uds.json,user_sig_policy.json}
sudo ssh nginx mkdir --parents /home/student/Desktop/Lab_Files/
sudo scp /tmp/uds.json                                      nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/user_sig_policy.json                          nginx:/etc/app_protect/conf/nap.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/hosts
sudo scp /tmp/hosts nginx:/etc/hosts
