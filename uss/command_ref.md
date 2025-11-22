### Check Codepage
```bash
locale charmap
```

### Show Tag
```bash
chtag -p /u/user/myfile
```

### Show Autoconvert Status
```bash
echo $_BPXK_AUTOCVT
```

### Available Codepages
```bash
iconv -l | grep IBM
```

### Check z/OS Version
```
uname -a
```

### Check Autoconvert
```bash
export _BPXK_AUTOCVT=ON
echo "Test" > /tmp/test.txt
cp /tmp/test.txt "//'IHRE.TEST.PDS(TEST)'"
```