# get lab-info.md for student guide bravais id
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab-info.md --output /tmp/lab-info.md
###brav_id=$(awk -F '|' "/$LAB_ID/"' {print $2}' /tmp/lab-info.md)

# install nginx license
# ALL licenses from NGINX One (Updated to include NAP DoS repo permission)
set +x
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $LIC_TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-25-2025/nginx-one-eval.{crt,key,jwt}
echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/EXPIRES-April-25-2025/nginx-one-eval.{crt,key,jwt}
set -x
until sudo scp /tmp/nginx-one-eval.crt nginx:/etc/ssl/nginx/nginx-repo.crt || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.key nginx:/etc/ssl/nginx/nginx-repo.key || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.jwt nginx:/etc/nginx/license.jwt || (( count++ > 5 )); do sleep 5; done
