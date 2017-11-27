# pacman-db-sync

A systemd timer and service to assist in staying current.

The timer triggers the service every hour starting 1 minute after boot, by default.

The service runs a bash script which performs the following actions.

- Fetches the latest mirrorlist (for secure US mirrors only)
- Ranks the mirrors
- Synchronizes repository databases

This does NOT perform upgrades.