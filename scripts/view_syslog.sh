#! /bin/sh

if [ -z "$TFTPD_SUBDIR" ] 
then 
    TFTPD_SUBDIR=$(ls -1 $TFTPD_DIR | head -1) 
fi 
export TFTPD_SUBDIR 
export TFTPD_USER 

/usr/sbin/in.tftpd -u $TFTPD_USER -v -v -l -c -s -p -R 10690:10699 $TFTPD_DIR/$TFTPD_SUBDIR
touch /var/log/tftpd.log 
rsyslogd 2> /dev/null
echo Available directories
find $TFTPD_DIR/* -type d -print | sort
echo Serving files from  $TFTPD_DIR/$TFTPD_SUBDIR
echo Available files:
ls $TFTPD_DIR/$TFTPD_SUBDIR 
tail -F /var/log/tftpd.log