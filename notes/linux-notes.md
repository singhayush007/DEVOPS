# Linux Notes (DevOps learning)

Setup: AWS EC2 (Ubuntu, `t3.micro`, Sydney) + Mac terminal se SSH.

## 1. Basics
| Command | Kaam |
|---|---|
| `pwd` | Abhi kaun se folder me |
| `ls -la` | Files (hidden bhi) |
| `cd`, `cd ..`, `cd ~` | Folder badlo |
| `mkdir`, `touch` | Folder / file banao |
| `rm`, `rm -r` | File / folder hatao (recycle bin nahi!) |
| `mv`, `cp` | Move / copy |
| `cat`, `less` | File padho |

- `~` = home folder (`/home/ubuntu`), `.` = abhi ka folder, `..` = parent.
- Absolute path `/` se shuru, relative path abhi ke folder se.
- Prompt: `$` normal user, `#` root.

## 2. Users, groups, sudo
- `sudo useradd -m user`, `sudo passwd user`, `sudo su - user`
- Group: `sudo groupadd g`, `sudo usermod -aG g user` (`-a` zaroori), `groups user`
- Files: `/etc/passwd` (users), `/etc/group` (groups)
- `sudo` = ek command root ki power se. `sudoers` = rule book (`visudo` se edit).
- Root se kaam nahi karte, `sudo -i` jab zarurat ho.

## 3. Permissions
- `rwx` = read(4) write(2) execute(1), teen log: owner, group, others.
- `chmod 755 f`, `chmod +x script.sh`, `chown user:group f`
- Folder par `x` = andar ja sakte ho.
- Common: `755` scripts, `644` files, `600` private keys.
- `umask` = nayi file ki default permission (bada umask = kam permission).
- ACL: `getfacl f`, `setfacl -m u:user:r f`, `setfacl -x u:user f`.

## 4. Text tools
- `grep "text" file` (`-i`, `-n`, `-c`, `-v`, `-r`)
- `awk '{print $1}'`, `NR` = line number, `$NF` = last column
- `head`, `tail`, `tail -f`, `xargs`
- Pipe `|`: ek command ka output doosre ko.

## 5. SSH aur scp
- `ssh-keygen -t ed25519` -> public key server ki `~/.ssh/authorized_keys` me.
- `ssh ubuntu@PUBLIC_IP`
- `scp file ubuntu@IP:~/folder/` (Mac -> server), `scp ubuntu@IP:~/f .` (server -> Mac)
- Public IP Stop/Start ke baad badalta hai.

## 6. Shell scripting
- Pehli line `#!/bin/bash`, `chmod +x`, `./script.sh`
- Variable: `name="x"` (`=` ke paas space nahi), `$(command)`
- Arguments: `$1 $2 $# $@`
- `if [ -f "$file" ]; then ... fi` (`[ ]` ke andar space)
- `for i in 1 2 3; do ... done`
- Function: `greet() { echo "Hi $1"; }`
- Quotes dono taraf same type; quote khula ho to `Ctrl + C`.

## 7. Processes
- `ps aux`, `top`, `kill PID`, `kill -9 PID`
- `cmd &` background, `jobs`, `Ctrl + Z` pause, `Ctrl + C` band
- `nohup cmd &` terminal band ho tab bhi chale.

## 8. systemctl (services)
- systemd = manager, systemctl = uska control command.
- `status`, `start`, `stop`, `restart`, `reload`
- `enable` / `disable` = reboot ke baad auto-start (start/stop abhi ke liye).
- Prod me apps service banake chalate hain taaki crash/reboot par chalti rahein.

## 9. Logs
- `/var/log/` (`syslog`, `auth.log`, `nginx/access.log`, `nginx/error.log`)
- `sudo tail -f file` live, `journalctl -u nginx -n 10`
- Kuch toota to pehle log padho.

## 10. Cron
- `crontab -e` (job likho), `crontab -l` (dekho)
- Format: `minute ghanta tareekh mahina din command`
- `*/5 * * * *` har 5 minute, `0 9 * * *` roz 9 baje
- Output log me: `>> file.log 2>&1`, poora path do.

## 11. Networking
- `ip a` (IP), `ping -c 4 host`, `ss -tulpn` (open ports), `curl -I url`
- IP = address, port = darwaza (22 SSH, 80 HTTP, 443 HTTPS), DNS = naam -> IP.
- Service chalu = port khula. AWS me firewall = Security Group.

## 12. find, tar, rsync
- `find ~ -name "*.sh"`, `find / -name x 2>/dev/null`
- `tar -czf b.tar.gz folder` (pack), `tar -xzf b.tar.gz -C dest` (kholo), `tar -tf` (list)
- `rsync -av src/ dest/` sirf badli hui files copy karta hai.

## Meri galtiyan (yaad rakhne ke liye)
- Command me typo ya space chhootna (`cat/etc/group`, `if[`).
- Mac aur server ka terminal mix karna (prompt dekho!).
- Vim me `i` dabaye bina paste karna.
- Quote mismatch se `>` prompt me atakna.

## Projects
- `disk_stats.sh`: server health report (date, uptime, users, disk, RAM, top processes)
- `server_report.sh`: greeting, uptime, last logins, disk, RAM, top CPU
