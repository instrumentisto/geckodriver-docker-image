FROM debian:stretch-slim

ARG firefox_ver=69.0
ARG geckodriver_ver=v0.25.0

RUN apt-get update \
    && apt-get install -y \
    wget tar bzip2 \
    # Install dependencies for firefox binary
    `apt-cache depends firefox-esr | awk '/Depends:/{print$2}'` \
    # Install firefox
    && wget -O FirefoxSetup.tar.bz2 "https://ftp.mozilla.org/pub/firefox/releases/${firefox_ver}/linux-x86_64/en-GB/firefox-${firefox_ver}.tar.bz2" \
    && tar xjf FirefoxSetup.tar.bz2 \
    && mv firefox /opt/firefox \
    # Install geckodriver
    && wget https://github.com/mozilla/geckodriver/releases/download/v${geckodriver_ver}/geckodriver-v${geckodriver_ver}-linux64.tar.gz \
    && tar -xvzf geckodriver* \
    && chmod +x geckodriver \
    && mv geckodriver /usr/bin \
    # Provide MPLv2.0 license
    && mkdir -p /usr/share/doc/mpl \
    && wget -O /usr/share/doc/mpl/MPLv2.0.html https://www.mozilla.org/en-US/MPL/2.0/ \
    # Cleanup unnecessary stuff
    && apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["geckodriver", "-b", "/opt/firefox/firefox", "--log", "debug", "--host", "0.0.0.0"]

EXPOSE 4444

