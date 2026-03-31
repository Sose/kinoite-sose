FROM quay.io/fedora/fedora-kinoite:44

#RUN rpm-ostree override remove firefox firefox-langpacks \
#    && rpm-ostree install distrobox \
#    && rpm-ostree cleanup -m

RUN dnf rm -y firefox firefox-langpacks \
    && dnf install -y distrobox

# Add rpmfusion by default
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-44.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-44.noarch.rpm

CMD ["/sbin/init"]
