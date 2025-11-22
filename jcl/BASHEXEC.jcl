//BASHEXEC JOB (ACCT),'Execute Bash',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=BPXBATCH
//STDOUT   DD SYSOUT=*
//STDERR   DD SYSOUT=*
//STDPARM  DD *
sh cd $HOME &&
   mkdir -p temp &&
   echo "blabla" >> temp/output
/*
