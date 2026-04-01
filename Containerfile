FROM quay.io/fedora/fedora-kinoite:44

RUN dnf -y remove firefox firefox-langpacks \
    && dnf -y install dnf-plugins-core \
    && dnf -y install \
         distrobox \
         https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-44.noarch.rpm \
         https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-44.noarch.rpm \
    && dnf config-manager setopt rpmfusion-free.enabled=1 \
    && dnf config-manager setopt rpmfusion-nonfree.enabled=1 \
    && dnf config-manager setopt rpmfusion-free-updates.enabled=1 \
    && dnf config-manager setopt rpmfusion-nonfree-updates.enabled=1 \
    && dnf config-manager setopt rpmfusion-free-updates-testing.enabled=0 \
    && dnf config-manager setopt rpmfusion-nonfree-updates-testing.enabled=0 \
    && dnf swap -y ffmpeg-free ffmpeg --allowerasing \ 
    && dnf clean all

CMD ["/sbin/init"]
