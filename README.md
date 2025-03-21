# signal-rpm-builder

### What is this?
This script downloads Signal Desktop package straight from Signal's official Debian repository, unpacks it and builds a compatible .rpm file that gets automatically installed.

TL;DR: Signal official packages on Fedora.

### Why?
I wrote this because Signal only provides official packages for Debian based systems, the problem is that using Fedora or another rpm based distro, you can only install Signal from third parties (Flatpak and such). Basically I want to get critical software like my browser and messaging apps straight from the source.

### Dependencies
For it to work you need the `alien` and `rpmbuild` tools installed:
`sudo dnf install alien rpmbuild`.

### Updating Signal
For updates, just rerun the script again and it should pull the latest deb and rebuild it.
