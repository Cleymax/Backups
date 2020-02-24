# McBackups

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)

## About <a name = "about"></a>
The need for backup is paramount in the event of a major technical problem. This script allows you to make a daily, weekly backup of a folder.

## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See **installing** for notes on how to deploy the project on a live system.

### Prerequisites
Just to be able to run bash files and to be on linux os
If you don't have cron installed run `apt-get install cron`

### Installing
Clone the projet in a folder.
```
git clone https://github.com/Cleymax/McBackups.git McBackups
```
Configuring the different variables in the script

Add in the cron the execution of the script.
```
crontab -e
```
And get in:
```
30 4 * * * sh /usr/local/bin/backup.sh <serverName> <server uuid or folder name>
```
This line allows you to launch the backup script every day at 4:30 a.m.
Don't forget to change the path where you cloned the project.

And finally to save enter:
```
service cron restart
```
In your terminal. (for Debian & Ubuntu
