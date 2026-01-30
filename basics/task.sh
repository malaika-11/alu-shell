#!/bin/bash

# Task 2
echo -e "#!/bin/bash\ncd ~" > 2-bring_me_home
chmod +x 2-bring_me_home

# Task 3 - long format listing
echo -e "#!/bin/bash\nls -l" > 3-listfiles
chmod +x 3-listfiles

# Task 4 - hidden files long format
echo -e "#!/bin/bash\nls -la" > 4-listmorefiles
chmod +x 4-listmorefiles

# Task 5 - numeric IDs, long format, hidden
echo -e "#!/bin/bash\nls -lan" > 5-listfilesdigitonly
chmod +x 5-listfilesdigitonly

# Task 6 - create directory in /tmp
echo -e "#!/bin/bash\nmkdir -p /tmp/my_first_directory" > 6-firstdirectory
chmod +x 6-firstdirectory

# Task 7 - move file betty to /tmp/my_first_directory
echo -e "#!/bin/bash\nmv /tmp/betty /tmp/my_first_directory/" > 7-movethatfile
chmod +x 7-movethatfile

# Task 8 - delete file betty
echo -e "#!/bin/bash\nrm -f /tmp/my_first_directory/betty" > 8-firstdelete
chmod +x 8-firstdelete

# Task 9 - delete directory /tmp/my_first_directory
echo -e "#!/bin/bash\nrm -rf /tmp/my_first_directory" > 9-firstdirdeletion
chmod +x 9-firstdirdeletion

# Task 10 - go back to previous directory
echo -e "#!/bin/bash\ncd -" > 10-back
chmod +x 10-back

# Task 11 - lists in current, parent, /boot
echo -e '#!/bin/bash\nls -la .\nls -la ..\nls -la /boot' > 11-lists
chmod +x 11-lists

# Task 12 - file type
echo -e '#!/bin/bash\nfile /tmp/iamafile' > 12-file_type
chmod +x 12-file_type

# Task 13 - symbolic link to /bin/ls
echo -e '#!/bin/bash\nln -s /bin/ls __ls__' > 13-symbolic_link
chmod +x 13-symbolic_link

# Task 14 - copy HTML files to parent if newer
echo -e '#!/bin/bash\ncp -u *.html ../' > 14-copy_html
chmod +x 14-copy_html

# Task 15 - move uppercase files to /tmp/u
echo -e '#!/bin/bash\nmv [A-Z]* /tmp/u' > 15-lets_move
chmod +x 15-lets_move

# Task 16 - delete all Emacs backup files ending with ~
echo -e '#!/bin/bash\nrm -f *~' > 16-clean_emacs
chmod +x 16-clean_emacs

# Task 17 - create welcome/to/school directory tree
echo -e '#!/bin/bash\nmkdir -p welcome/to/school' > 17-tree
chmod +x 17-tree

