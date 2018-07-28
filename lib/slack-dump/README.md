# slack-dump
Generate an export of Channel, Private Group and / or Direct Message history and export it as a ZIP file compatible with Slack's import tool.

## Usage

```
$ slack-dump -h

NAME:
   slack-dump - export channel and group history to the Slack export format include Direct message

USAGE:
   main [global options] command [command options] [arguments...]
   
VERSION:
   1.1.1
   
AUTHOR(S):
   Joe Fitzgerald <jfitzgerald@pivotal.io> Sunyong Lim <dicebattle@gmail.com> Yoshihiro Misawa <myoshi321go@gmail.com> 
   
COMMANDS:
     help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --token value, -t value   a Slack API token: (see: https://api.slack.com/web) [$SLACK_API_TOKEN]
   --output value, -o value  Output directory path. Default: current directory path
   --help, -h                show help
   --version, -v             print the version

```

### Export All Channels And Private Groups

```
$ slack-dump -t=YOURSLACKAPITOKENISHERE
```

### Export Specific Channels And Private Groups

```
$ slack-dump -t=YOURSLACKAPITOKENISHERE channel-name-here privategroup-name-here another-privategroup-name-here
```
