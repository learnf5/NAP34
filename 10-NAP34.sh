# Sorry for my mistake (Vicki June 21, 2025) - I left nap.conf and nap.orig on the NGINX base VM
# So I'll remove it for all NGINX labs from this script
# The MV NAP class labs do require the nap.conf file but Labs1-3 don't start with lab 4 nap.conf which is what is on the base VM
# so remove nap.conf and nap.orig from base image and then in the actual lab script 20-NAP34-xxx the appropriate file will be loaded
sudo ssh nginx sudo rm /etc/nginx/conf.d/nap.{conf,orig}

# install 30 day nginx one trial licenses from Salesforce - EXPIRES May 22, 2025
set +x
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-one-eval.{crt,key,jwt}
echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-one-eval.{crt,key,jwt}
set -x
until sudo scp /tmp/nginx-one-eval.crt nginx:/etc/ssl/nginx/nginx-repo.crt || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.key nginx:/etc/ssl/nginx/nginx-repo.key || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.jwt nginx:/etc/nginx/license.jwt || (( count++ > 5 )); do sleep 5; done
