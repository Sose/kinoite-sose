# Custom Fedora Kinoite bootc image

Following Fedora Kinoite 44 currently. 

I don't recommend using this directly. This is a project for learning, a minimal example of a repository for building your own bootc image. 

## Build locally
```bash
podman build -t kinoite-sose .
```

## Nvidia
Rpmfusion should already be installed. Install Nvidia drivers with the following command.
```bash
rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
```
