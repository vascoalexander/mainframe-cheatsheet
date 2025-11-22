/* SYNCGIT - Sync Git COBOL files to PDS */
repo_dir = '/u/userid/git/myrepo'
target_pds = 'MYHLQ.COBOL.SOURCE'

/* Git pull */
address syscall "chdir" repo_dir
address sh "git pull origin main"

/* Find COBOL files */
address sh "ls src/cobol/*.cbl > /tmp/cobol_files.txt"

/* Process each file */
address syscall "readfile /tmp/cobol_files.txt" "files."
do i = 1 to files.0
  parse var files.i filepath

  /* Extract member name */
  parse var filepath . '/' member '.cbl'
  member = translate(member) /* uppercase */

  /* Copy to PDS with conversion */
  src = filepath
  tgt = "'"target_pds"("member")'"

  address sh "iconv -f ISO8859-1 -t IBM-1047" src "| cp /dev/stdin" tgt

  say "Copied" member "to" target_pds
end

say "Sync completed"
