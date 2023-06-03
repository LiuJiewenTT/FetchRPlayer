# FetchRPlayer
<strong style="color:red">Fetch Remote Player</strong>s' *port*s to let them join "my" game. This is using SSH Port Forwarding feature. It's like **joining with IPv6** but **not exposing server IP**(not completely hidden). It's abbreviation is just the "FRP" and it's ok to regard it as a simple basic FRP alternative **for really trusted friends**. If you're **not** able to trust some people, **remember to apply security measures**.

> If there's anything I said is wrong, please tell me and I will try to correct it.

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
6. You should give servers' pubkeys to remote players and ask them to authorize the keys if you use key authentication. To be honest, **you really should use key authentication** unless the remote player is willing to give you an account's password and you're willing to enter that every time.
7. Unless you use Local Port Forwarding, as is the **MSS:A** mentioned below, who can join is determined by you. **You start/enable whose script in local, then who will be able to join.** In facts, in the case of MSS:A, you can determine as well, but that is in another method to control.
8. To protect your game from being joined without management/authentication and comes and goes freely, don't open the game port in firewall. That's to say, the port for direct LAN game should never be exposed to public.
9. **If you**, the one who open a server, **have no IPv6 address**, you should consider reconfiguring your network, including adjusting routers' settings, asking ISP for help and using IPv6 over IPv4 technologies. There are lots of methods, the most outstanding one is "Teredo". For more information, you need to search by yourself.
10. <strong style="background:black; color:blue">If you're encountering <span style="color:red">DDoS attacks</span>, read the 5th above.</strong> 
    1. **Player Management(Cleaning): You should make the system to change to a new IPv6 address instead of going down/offline. And you should protect your ports. To find out the spy, I advise you to apply "binary search" by dividing players to different groups and giving different ports on a newly configured IPv6 address. If all ports are scanned and attacked, don't give IPv6 address to more than one group in the same period/stage. Besides, this has inspired me an idea about "distributed": "Distributed Mid-Server Strategy"(DMSS, mentioned in the followings).** 
    2. Connection Optimization Option: Most people in China should have the IPv6 access from home networks and mobile hotspots, if not, consider "Teredo" servers as mentioned in the 6th point. I know that it's not easy to maintain a IPv4 server, but you may **try sharing your teredo server with someone like you and form a small group: you join together. If the owner got attacked and had have to spend lots of money on protection, it's time to call police.** In this strategy, a teredo server is always optional and can be given up and most players should not be affected at all. 
       (This is about traditional IPv4-based attacks. But not all attacks based on IPs and there are attacks regarding IPv6. So this is kind of redundancy. As time goes, this would have smaller and smaller effects as there will be more and more IPv6 attacks.)
    3. Most OS does not enable the feature of temporary IPv6 address, so it will work for a long time that banning a IPv6 address. But don't lay too much expectation on this point. 
    4. **About firewall**: if you can, void external network accessing common ports, including <del>`<del>`</del>22,<del>`</del>`</del> 23, 80, 443, etc., and only local devices are allowed. You may leave some other port for ssh. Change or close some ports can usually decrease the affect of some types of DDoS attacks. But it's the best that you have some firewall directed against DDoS.
    5. **Distributed Mid-Server Strategy (DMSS)**: You should apply **MSS:A** or **MSS:S** (mentioned below). Never tell all players all the ports but tell by group. This is a management preference and is good for keep a spy-less network. If one mid-server is being attacked and cannot work properly, the players using other mid-servers would not be affected.
11. Using this product means *remote players should have OpenSSH Server installed in the computer and giving your Pubkey(public key) to the remote players*. (Unless you use the advanced solution mentioned in the followings)
    To obtain their trust, you may do these:
    1. Publish your codes to run. You can refer to here if you did not change anything on them. 
    2. **Divided Account Environment Strategy**: Carefully configure read/write/execute(rwx) accesses and give this product a single account with the files holding rights of 600, or even 400. The account's keys, including private key and public key, should not be accessible for other users.
    3. If they still not trust you, here is **an advanced solution (Mid-Server Strategy: Acceptor)**: 
       1. Prepare a server as an agent or a swapper and we call it as "mid-server". If you do this, you can regard the mid-server as the one to be published and to be protected from attacks and never give your server's address.
       2. *Mid-server should have SSH Server and remote players should have SSH Client*.
       3. You redirect logins to a mid-server, they login to the mid-server by themselves using scripts or whatever. That is to say, all of you need to log into a mid-server with keys. You can ban a player by simply removing his pubkey from `authorized_keys` or banning his IPv6 address for some period. You come with the port and he should come to the port prepared by you. 
       4. In this strategy, you can have **many mid-server** if you are able to do this and **the server address is hid completely** as long as you make the server to log into the mid-server with IPv4 and <del>LAN address</del>(at least not public IPv4 address). You might disable password authentication of ssh in the meanwhile. 
       5. Don't authorize mid-server's pubkey on your server to protect yourself. You don't need to give any key to anyone in this solution.
       6. **DAES-Extended**(<span style="color:grey">Optional</span>): mid-servers can be applied with **DAES (Divided Account Environment Strategy)** as well. Here are some additional measures:
          1. Additional measure, 1st: prepare an players' exclusive account for them to log in. It's suggested not to give out password and disable password authentication of ssh.
          2. Additional measure, 2nd-v1: set the `authorized_keys` to `400`(requires account to have no rights of sudoers/administrators). To modify the content, you should use sudoers/administrators identities doing "`chmod`, etc." with external network disconnected. 
          3. Additional measure, 2nd-v2(<span style="color:red">Recommended</span>): set the `authorized_keys` to another user owned, e.g.: root. The command to configure this can be: `chown root:root authorized_keys`. Give read access to "other": `chmod o+r authorized_keys` (It seems to have 'r' by default in Linux).
          4. By doing the additional measures above, **no spy can add new spies to the authorized list**. (Remember to restart the `sshd` service.)
       7. (<span style="color:grey">Optional</span>): The logged-in users can see mid-servers' MAC addresses. If you can, this problem can be solved by applying **DAES** and forbid/trap `ifconfig`, etc.. But it's **complex**, I don't want to talk about it further. 
       8. This solution has a problem: what if remote player don't use port for him but that for some other one? **So** if you use this solution, don't keep same ports opened for too long and don't open too many ports for games **excepts traps. (Record source IP to the traps and ban them for a long time.)** 
    4. For those **who had leaked** something and need a new machine, here is a solution (**MMS:S**):
       1. Prepare a "mid-server", then apply this product on the mid-server instead. You may apply **MMS:A (Mid-Server Strategy: Acceptor)**. If you don't let others to log in to the mid-server but keep the Remote Port Forwarding all along the way with no matter if the rests of **MMS:A** got applied or not, it's called **MMS:S (Mid-Server Strategy: Sender/Simple)**. The full version of MSS:S is based on original product and should have DAES and traps mentioned in MSS:A as they are highly recommended measures.
       2. Use Remote Port Forwarding Feature of SSH to publish your game port to the mid-server.
       3. You should give mid-servers' pubkeys to remote players and ask them to authorize the keys. You should not authorize mid-servers' pubkeys on your servers or any other devices. Remote players will not be able to log into mid-servers and hence see no MAC addresses.
12. Additional Security Suggestions concerning IPv6:
    1. Don't use EUI-64 to generate your IPv6 address! If not sure, never expose it! The IPv6 address derived from it can be inferred about your MAC address.

## Using

- The following "Server side" and "Client side" only refer to the game but not this program.
- The programs are **only required on servers**. Remote players don't need to do anything except setting the server address to connect to in their applications, for example, games.
- **GNU GPL** license doesn't mean you have to publish your codes unless you include the codes in your product which is for publish and redistribute. So you have unlimited freedom to use this.

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