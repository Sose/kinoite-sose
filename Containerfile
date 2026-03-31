FROM quay.io/fedora/fedora-kinoite:44

RUN dnf -y remove firefox firefox-langpacks \
    && dnf -y install \
         distrobox \
         https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-44.noarch.rpm \
         https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-44.noarch.rpm \
    && sed -i 's/^enabled=1/enabled=0/' /etc/yum.repos.d/rpmfusion-*-rawhide.repo \
    && sed -i 's/^enabled=1/enabled=0/' /etc/yum.repos.d/rpmfusion-*-updates-testing.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-free.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-free-updates.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo \
    && dnf clean all

CMD ["/sbin/init"]
