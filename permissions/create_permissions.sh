#!/bin/bash
# Creates all the permission scripts

cd "$(dirname "$0")" || exit 1

# Create empty scripts
touch 0-iam_betty 1-who_am_i 2-groups 3-new_owner 4-empty 5-execute 6-multiple_permissions 7-everybody \
8-James_Bond 9-John_Doe 10-mirror_permissions 11-directories_permissions 12-directory_permissions \
13-change_group 14-change_owner_and_group 15-symbolic_link_permissions 16-if_only

# Fill in minimal commands for each task

# 0. Switch user to betty (8 chars + newline)
echo "su betty" > 0-iam_betty

# 1. Print effective username
echo "whoami" > 1-who_am_i

# 2. Print groups
echo "groups" > 2-groups

# 3. Change owner of hello to betty
echo "chown betty hello" > 3-new_owner

# 4. Create empty file hello
echo "touch hello" > 4-empty

# 5. Add execute permission to owner of hello
echo "chmod u+x hello" > 5-execute

# 6. Owner+group exec, others read
echo "chmod ug+x,o+r hello" > 6-multiple_permissions

# 7. Everyone execute (no commas)
echo "chmod a+x hello" > 7-everybody

# 8. Owner/group none, others all
echo "chmod 007 hello" > 8-James_Bond

# 9. Mode -rwxr-x-wx
echo "chmod 751 hello" > 9-John_Doe

# 10. Mirror permissions of olleh
echo "chmod --reference=olleh hello" > 10-mirror_permissions

# 11. Add execute permission to all subdirectories
echo "find . -type d -exec chmod a+x {} \;" > 11-directories_permissions

# 12. Create directory with 751
echo "mkdir my_dir && chmod 751 my_dir" > 12-directory_permissions

# 13. Change group to school
echo "chgrp school hello" > 13-change_group

# 14. Change owner to vincent, group to staff for all files/dirs
echo "chown -R vincent:staff ." > 14-change_owner_and_group

# 15. Change owner/group of symbolic link _hello
echo "chown -h vincent:staff _hello" > 15-symbolic_link_permissions

# 16. Change owner to vincent only if guillaume owns it
echo "chown --from=guillaume vincent hello" > 16-if_only

# Make all scripts executable
chmod +x 0-iam_betty 1-who_am_i 2-groups 3-new_owner 4-empty 5-execute 6-multiple_permissions 7-everybody \
8-James_Bond 9-John_Doe 10-mirror_permissions 11-directories_permissions 12-directory_permissions \
13-change_group 14-change_owner_and_group 15-symbolic_link_permissions 16-if_only
