div align="center">

</div>
<p align="Center">
<img src="assets/udroid-logo.png" height="300" >
</p>
<p align="Center">
<img src="assets/badge-bash.svg">
<img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103">
</p>

<p align="Center">
<img src="https://www.codefactor.io/repository/github/randomcoderorg/ubuntu-on-android/badge">
</p>

<div align="center">

![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fudroid-download-counter-api.vercel.app%2Fcur_count&query=%24.downloads&style=flat-square&label=Installs%20since%20Aug%202023)

</div>

<p href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2FRandomCoderOrg%2Fubuntu-on-android" align=center><img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2FRandomCoderOrg%2Fubuntu-on-android&label=%F0%9F%A5%B3VISITORS&labelColor=%23ffff00&countColor=%23263759" /><p>

<!-- ![Banner Image](assets/banner.jpg "A Image on Ubuntu-on-android running mate desktop on smartphone") -->

<h2 align="Center">Ubuntu on android</h2>

ubuntu-on-android is yet another utility allowing you to install pre-configured ubuntu with gui, development tools, and software on top of android without root via PRoot and Termux. Check the [disclaimer](md/desclaimer.md) before starting. 


[![Support Server](https://img.shields.io/discord/892727774828199976?color=blue&label=join%20%23udroid&logo=discord&logoColor=white&style=for-the-badge)](https://discord.gg/h7wZ9BfbU9)


codename = `udroid`

## Installation


Before you install, please read the [wiki](https://udroid-rc.gitbook.io/) and [disclaimer](md/desclaimer.md). To install stable release of `udroid` filesystem run

```bash
. <(curl -Ls https://bit.ly/udroid-installer)
```

**for fresh termux installation**

```bash
apt update && apt upgrade -y
. <(curl -Ls https://bit.ly/udroid-installer)
```

**To install just the `udroid` tool**

```bash
apt update && apt upgrade -y
apt install git -y
git clone https://github.com/RandomCoderOrg/fs-manager-udroid
cd fs-manager-udroid
bash install.sh
udroid install jammy:xfce4
```

For advanced usage, check [this.](https://github.com/RandomCoderOrg/fs-manager-udroid/blob/main/README.md)



## Showcase


**->** `ubuntu:xfce4`
![udroid xfce4](assets/jammy_xfce4.png)


## Contribution
> ### Contributors/

![People](https://raw.githubusercontent.com/RandomCoderOrg/misc-worflows/main/metrics.plugin.people.repository.svg)

> ### Contributing

Contributions are always welcome! We appreciate any type of contribution, not only code. For example, you can help the wiki shape up. Any changes to this repository/code should be submitted as a pull request, with well explained description.



## Licence

MIT
Copyright © 2024 lynux67

