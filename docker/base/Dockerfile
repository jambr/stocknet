FROM fedora:23

# Get pre-reqs
RUN dnf -y update && \
    dnf -y install wget

# Add the epel repo
RUN cd /tmp && \
    wget -q http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm && \
    rpm -ivh epel-release-7-7.noarch.rpm && \
    dnf -y update && \ 
    rm epel-*
