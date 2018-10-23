# sync files to SSH
copy only changed or new files from a local directory to ssh host

The local directory is "www" and also in ssh there is the same directory called "www".

It is thinked for rsync Magento files from local to remote host.

## Usage

Put this script in the home directory, one directory before the "www" folder.

./copy-files.sh daysback filename.txt

es. ./copy-files.sh 30 logfile.txt

Get all files modified in last 30 days in a directory and save the list in "logfile.txt"
