# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Limit

CONFIG += sailfishapp

SOURCES += src/Limit.cpp

OTHER_FILES += qml/Limit.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/Limit.spec \
    rpm/Limit.yaml \
    translations/*.ts \
    Limit.desktop \
    qml/pages/HelpPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/DejaVuSansMono.ttf \
    qml/pages/limit.py \
    rpm/Limit.changes \
    qml/pages/SettingsPage.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/Limit-de.ts

