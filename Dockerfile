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
RUN (echo y | $ANDROID_HOME/tools/android update sdk --no-ui --filter sys-img-x86_64-google_apis-22 --all)

# Create fake keymap file
RUN mkdir $ANDROID_HOME/tools/keymaps && \
    touch $ANDROID_HOME/tools/keymaps/en-us

VOLUME /src
WORKDIR /src

