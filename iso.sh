#!/bin/bash

iso() {

    set -- gnome
    menu 'select a desktop' desktop $@
    curl -so ~/make-iso.sh https://raw.githubusercontent.com/0free/GentooLinux/systemd/make-iso.sh
    ash ~/make-iso.sh
    rm ~/make-iso.sh

}
