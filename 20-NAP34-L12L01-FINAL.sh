# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/DOS/{nginx,nap}.WAF
sudo scp /tmp/nginx.WAF                                    nginx:/etc/nginx/nginx.conf
sudo scp /tmp/nap.WAF                                      nginx:/etc/nginx/conf.d/nap.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TROUBLESHOOT/{nginx,nap}.DoS
sudo scp /tmp/nginx.DoS                                    nginx:/etc/nginx/
sudo scp /tmp/nap.DoS                                      nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/HTTP/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap.orig                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/POLICY/simplify_requests.json
sudo scp /tmp/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/my-default-policy.json
sudo scp /tmp/my-default-policy.json                        nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TUNING/policy_viol_filetype.json
sudo scp /tmp/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/LEAKAGE/{my-filetypes.txt,local-policy.json}
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/LEAKAGE/{{,new-}signature-report.json,app-protect-security-updates.key,{nginx,nap}.WAF}
sudo scp /tmp/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/{,new-}signature-report.json                  nginx:/tmp/
sudo scp /tmp/app-protect-security-updates.key              nginx:/home/student/
sudo scp /tmp/nginx.WAF                                     nginx:/etc/nginx/
sudo scp /tmp/nap.WAF                                       nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp -H "Authorization: token $lic_token" https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/TROUBLESHOOT/{nginx,nap}.DoS
sudo scp /tmp/nginx.DoS                                     nginx:/etc/nginx/
sudo scp /tmp/nap.DoS                                       nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/INTRO/hosts
sudo scp /tmp/hosts nginx:/etc/hosts

# ADDED for new v4.8 course labs
### IS THIS MISSING the curl command to get file from github???????
sudo scp /tmp/nap_files/FINAL/customStrict.json                           nginx:/home/student/Desktop/Lab_Files/customStrict.json
