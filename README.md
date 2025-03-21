# signal-rpm-builder

I wrote this because Signal only provides official packages for Debian based systems, the problem is that using Fedora or another rpm based distro, you can only install Signal from third parties (Flatpak and such).

This script downloads the latest .deb package straight from signal.org's official Debian repository, unpacks it and builds a compatible .rpm file that gets automatically installed.

For it to work you need the `alien` and `rpmbuild` tools installed: `sudo dnf install alien rpmbuild`.

For updates, just rerun the script again and it should pull the latest deb and rebuild it.
