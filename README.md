# logtee

`logtee.sh` uses `tee` command to redirect all stdout, stderr to the terminal and a log file.
`logtee.sh` uses `date` command to generate date_time_zone and add it to the log file name.

Put `source logtee.sh` or `. logtee.sh` to include this script.
```bash
#!/bin/bash

source /path/to/logtee/logtee.sh

echo "log this message"
echo "log in stderr" >&2
```

To override the log file path, set LOGTEEPATH env.

In the script file:
```bash
#!/bin/bash

LOGTEEPATH=/path/to/file.log
LOGTEEDATEFORMAT="+%F"
source /path/to/logtee/logtee.sh
...
```

In the command line:
```bash
$ LOGTEEPATH=/path/to/file.log LOGTEEDATEFORMAT="+%F" ./run.sh
```

If `LOGTEEPATH` env is empty, `logtee.sh` uses the name same as the running bash script with `.log` extension, e.g., `run.log` for `run`, `run.sh`
If `LOGTEEDATEFORMAT` env is empty, `logtee.sh` uses `"+%Y%m%d_%H%M%S_%z"` for `date` command. If you do not want to add date/time in the log file name, use `LOGTEEDATEFORMAT="+"`

