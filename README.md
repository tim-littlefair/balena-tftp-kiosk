## balena-tftp-kiosk

A simple TFTP appliance designed for remote management using the Balena framework.

### How to use this
1. Sign up for an account at balena.io install the balena CLI tool and read the balena documentation.
2. Create an application on balena.io with an appropriate name.  For example, if you are called Joan, you might create an application called joans-tftp-kiosk.
3. Clone this repository.
4. Create a file called default.zip file containing the payloads you wish your TFTP server to offer to clients, and copy it into the 'payloads' subdirectory of the working copy of the repository.  Note that the .gitignore file causes files in this directory to be ignored by version control as they are your private content, not part of the kiosk framework.
5. From the top directory of the working copy run the commands:
```
balena login
```
then
```
balena push joans-tftp-kiosk
```
6. Follow the Balena documentation to create an SD card which can be put into a RPi or other compatible device to serve the files in the zip file.
7. Any .zip file in the 'payloads' directory will be copied into the kiosk and will be available for serving, but if files are to be served from a zip file other than one called 'default.zip', the Balena web console must be used to set the variable TFTDP_SUBDIR to the basename of the .zip file.

### Balena resources
https://balena.io/

https://dashboard.balena-cloud.com/signup

http://balena.io/docs/learn/getting-started/
