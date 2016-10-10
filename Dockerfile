FROM ashtreecc/android:24.4.1

MAINTAINER Andrew Nash "akahadaka@gmail.com"

# Specially for SSH access and port redirection
ENV ROOTPASSWORD android

# Expose ADB, ADB control and VNC ports
EXPOSE 22
EXPOSE 5037
EXPOSE 5554
EXPOSE 5555
EXPOSE 5900

# Install Android System Image(s)

RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | $ANDROID_HOME/tools/android update sdk --filter sys-img-x86_64-google_apis-23 --no-ui --all

# Create fake keymap file
RUN mkdir /usr/local/android-sdk/tools/keymaps && \
    touch /usr/local/android-sdk/tools/keymaps/en-us

VOLUME /src
WORKDIR /src

