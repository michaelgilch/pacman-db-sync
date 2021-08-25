# pacman-db-sync

A systemd timer and service to assist in staying current.

The timer triggers the service every hour starting 1 minute after boot, by default.

The service runs a bash script which simply synchronizes the repository databases.

Historically, it also fetched the latest mirrorlist, but that has been replaced by reflector service and timer.

This does NOT perform upgrades.
