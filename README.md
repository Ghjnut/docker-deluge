# docker-deluge
This container installs deluge 1.3.12 and allow you to run `deluged`, 
`deluge-console` and `deluge-web`.

### build container
`./bin/build`

### run deluged daemon
1. create directories
```
./data
	/downloads
		/completed
		/downloading
	/torrents
		/autoadd
		/backup
./config
	/deluge
```
2. create user
`touch config/deluge/auth && echo 'deluge:deluge:10' > config/deluge/auth`

3. start daemon
`./bin/deluged`

4. After this is running you'll have to connect with a client and configure some
settings to point where you need and setup connections.
_user_: deluge
_password_: deluge

```
Downloads
	Download to: /data/downloads/downloading
	Move completed to: /data/downloads/completed
	Auto add .torrents from: /data/torrents/autoadd
	Copy of .torrent files to: /data/torrents/backup

Network
	uncheck 'Use Random Ports' under 'Incoming Ports'
	From: 58946
	To: 58946
```

### run deluge-console
`./bin/deluge-console`

### run deluge-web
`./bin/deluge-web`
