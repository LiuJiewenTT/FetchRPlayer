# FetchRPlayer
<strong style="color:red">Fetch Remote Player</strong>'s *port* to let them join "my" game. This is using SSH Port  Forwarding. It's like **joining with IPv6** but **not exposing server IP**.

## Notes

1. This project **is designed for Chinese initially**. So the hints and instruction are written in Chinese. To display correctly, the products would ensure the code page to 65001(**UTF-8**).
2. Typically when **playing Minecraft**, the *HostPort* is for remote player who has IPv6 available and the *LocalPort* is the game's LAN Port for LAN Players. In this case, port `25565` is often used as the LAN port, thus is *LocalPort* as well.
3. You may use SSH Local Port Forwarding and set *HostPort* to 22 to **test** if you're ready to connect to the target device(remote player's PC). The command is prepared in the script.
4. You might need to rerun the scripts if the network flops broke the connection.

## Using

The following "Server side" and "Client side" only refer to the game but not this program.

### Server side

Consider `example/example.bat` as a template, copy that file to the same folder as `start.bat` and name in format of `to_[name].bat`. For example, name as "to_ljw.bat" and "to_lcj.bat".

Then, you should edit the `host` variable. In most cases, the remote player has no IPv4 public address but IPv6 instead. If that is IPv6, quote it within `[]`.

Currently the `run.bat` is not enabled. It lacks of the sentence, under line 14, to start: `@start %%~fi`. It's not a problem cause `run.bat` is prepared for multi-players(remote).

**To run the program, there are two ways for now**:

1. The first one, you should set the value of `host` inside the script and start it. 
2. The second, double-click `start.bat` and follow the instruction.

### Client side

Add a server address: `[::1]:25566` for example. The format is: `%HostLocal%:%HostPort%`.

Enjoy! :smiley: