FROM quay.io/fedora/fedora-kinoite:44

#RUN rpm-ostree override remove firefox firefox-langpacks \
#    && rpm-ostree install distrobox \
#    && rpm-ostree cleanup -m

RUN dnf rm -y firefox firefox-langpacks \
    && dnf install -y distrobox

# Add rpmfusion by default
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-44.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-44.noarch.rpm \
    && dnf -y remove rpmfusion-free-release rpmfusion-nonfree-release \
    && dnf -y install rpmfusion-free-release rpmfusion-nonfree-release \
    && sed -i 's/^enabled=1/enabled=0/' /etc/yum.repos.d/rpmfusion-*-rawhide.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-free.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-free-updates.repo \
    && sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo \
    && sed -i 's/^enabled=1/enabled=0/' /etc/yum.repos.d/rpmfusion-*-updates-testing.repo

CMD ["/sbin/init"]
