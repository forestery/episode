# load all project for gitlab API
curl http://{HOST}:{PORT}/api/v4/projects?per_page=100&&page=1 > all 

# make sure the root user's ssh public key is deployed to gitlab server.
# clone git repository with all branches.
cat all | json_pp | grep ssh_url_to_repo | cut -d'"' -f 4 | sort | uniq | xargs -I % echo 'git clone --mirror  %  %/.git' | awk '{split($5,a,"/");split(a[1],b,":");print $1" "$2" "$3" "$4" "b[2]"."a[2]"/.git"; }'  | bash


#cat all | json_pp | grep ssh_url_to_repo | cut -d'"' -f 4 | sort | uniq | xargs -I % echo 'git clone --mirror  %  %' | awk '{split($5,a,":");print $1" "$2" "$3" "$4" "a[2]; }' | awk '{ gsub("/",".",$5); print $1" "$2" "$3" "$4" "$5"/.git" ;}' | bash
#wiki
#cat all | json_pp | grep ssh_url_to_repo | cut -d'"' -f 4 | sort | uniq | awk '{print substr($1,1,length($1)-3)"wiki.git"  }'  | xargs -I % echo 'git clone --mirror  %  %'  | awk '{split($5,a,":");print $1" "$2" "$3" "$4" "a[2]; }' | awk '{ gsub("/",".",$5); print $1" "$2" "$3" "$4" "$5"/.git" ;}' > all2

# config
for d in ./*/ ; do (cd "$d" && git config --unset core.bare && git checkout master ); done

# check result
for d in ./*/ ; do (cd "$d" && pwd && git branch --list ); done




# add a exist_reposity to the gitlab new project.
cd existing_repo
git remote rename origin old-origin
git remote add origin http://{host}:{port}/xxxx.git
git push -u origin --all
git push -u origin --tags
