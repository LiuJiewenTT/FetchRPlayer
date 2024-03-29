# FetchRPlayer
<strong style="color:red">Fetch Remote Player</strong>s' *port*s to let them join "my" game. This is using SSH Port Forwarding feature. It's like **joining with IPv6** but **not giving server's IP**(not completely hidden). It's abbreviation is just the "FRP" and it's ok to regard it as a simple basic FRP alternative **for really trusted friends**. If you're **not** able to trust some people, **remember to apply security measures**.

> If there's anything I said is wrong, please tell me and I will try to correct it.

> For better reading experience, especially from mobile devices, please go to the html version of this [link(online)](https://liujiewentt.github.io/FetchRPlayer/docs/) ([download for offline](https://github.com/LiuJiewenTT/FetchRPlayer/archive/refs/heads/docs_only.zip)).

## OS Supported

- [x] Windows (Current Branch)
- [ ] Linux (In the future; not started yet.)

## Docs in Language

- [x] English
- [ ] [Chinese](README_zh-cn.md)

## Notes

> If you don't want to read these, [click here to jump to the next section](#Using).

1. This project **is designed for Chinese initially**. So the hints and instruction are written in Chinese. To display correctly, the products would ensure the code page to 65001(**UTF-8**).

2. Typically when **playing Minecraft**, the *HostPort* is for remote player who has IPv6 available and the *LocalPort* is the game's LAN Port for LAN Players. In this case, port `25565` is often used as the LAN port, thus is *LocalPort* as well.

3. You may use SSH Local Port Forwarding and set *HostPort* to 22 to **test** if you're ready to connect to the target device(remote player's PC). The command is prepared in the script.

4. You **might need to rerun** the scripts if the network flops broke the connection.

5. This technique can hide the server's IP from players literally, but it cannot hide from advanced users by using some methods and commands. So **don't lay too much expectation on the "Hidden IP" feature**. *But it's a good idea to forwarding **random ports** to players* by simply modify the scripts. <span style="color:red">That's to say, every remote player can be given a port differently and randomly.</span> By doing so, your security will be improved in some sense.

6. **If you**, the one who open a server, **have no IPv6 address**, you should consider reconfiguring your network, including adjusting routers' settings, asking ISP for help and using IPv6 over IPv4 technologies. There are lots of methods, the most outstanding one is "Teredo". For more information, you need to search by yourself.

7. Using this product means *remote players should have OpenSSH Server installed in the computers and giving your Pubkey(public key) to the remote players*. (Unless you use MSS:A strategy.)

8. For the strategies and security suggestions, view [Security_Suggestions.md](Security_Suggestions.md).

   > Strategies: DMSS, MSS:A, MSS:S, DAES, DAES-Extended, traps.

## Using

- The following "Server side" and "Client side" only refer to the game but not this program.
- The programs are **only required on servers**. Remote players don't need to do anything except setting the server address to connect to in their applications, for example, games.
- **GNU GPL** license doesn't mean you have to publish your codes unless you include the codes in your product which is for publish and redistribute. So you have limitless freedom to use this.

### Server side

Consider `example/example.bat` as a template, copy that file to the same folder as `start.bat` and name in format of `to_[name].bat`. For example, name as "to_ljw.bat" and "to_lcj.bat".

Then, you should edit the `host` variable. In most cases, the remote player has no IPv4 public address but IPv6 instead. If that is IPv6, quote it within `[]`.

Currently the `run.bat` is not enabled. It lacks of the sentence, under line 14, to start: `@start "%%~fi"`. It's not a problem cause `run.bat` is prepared for multi-players(remote).

**To run the program, there are two ways for now**:

1. The first one, you should set the value of `host` inside the script and start it. 
2. The second, double-click `start.bat` and follow the instruction.

### Client side

Add a server address: `[::1]:25566`, for example. The format is: `%HostLocal%:%HostPort%`.

Enjoy! :smiley: