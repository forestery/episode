# load all project for gitlab API
curl http://{HOST}:{PORT}/api/v4/projects?per_page=1000 > all 

# make sure the root user's ssh public key is deployed to gitlab server.
# clone git repository with all branches.
cat all | json_pp | grep ssh_url_to_repo | cut -d'"' -f 4 | sort | uniq | xargs -I % echo 'git clone --mirror  %  %/.git' | awk '{split($5,a,"/");split(a[1],b,":");print $1" "$2" "$3" "$4" "b[2]"."a[2]"/.git"; }'  | bash

# config
for d in ./*/ ; do (cd "$d" && git config --unset core.bare && git checkout master ); done

# check result
for d in ./*/ ; do (cd "$d" && pwd && git branch --list ); done

