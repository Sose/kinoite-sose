FROM quay.io/fedora/fedora-kinoite:44

RUN rpm-ostree override remove firefox firefox-langpacks \
    && rpm-ostree install distrobox \
    && rpm-ostree cleanup -m

CMD ["/sbin/init"]
