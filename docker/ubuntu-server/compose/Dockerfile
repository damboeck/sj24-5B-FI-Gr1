# Dockerfile für ein Ubuntu 22.04-Image mit nano

# Basis-Image festlegen: Ubuntu 22.04
FROM ubuntu:24.04

# Maintainer-Information (optional)
LABEL maintainer="5bhet@htlstp.at"

# Update der Paketliste und Installation von nano
RUN apt-get update -y && \
    apt-get install -y nano &&  \
    apt-get clean -y

# Standardbefehl: Startet eine Bash-Shell
CMD ["bash"]