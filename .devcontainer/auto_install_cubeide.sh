#!/usr/bin/expect -df

spawn /tmp/stm32cubeide-installer.sh

# spawn ./test33.sh
set timeout 120
expect {
    "More" {
        send "\r\n";  
        exp_continue;
    }
    "STLinkServer" {
        send -- "Y\r\n"
        exp_continue;
    }
    "install dir" {
        send -- "\n"
        exp_continue;
    }
    "Segger J-Link" {
        send -- "Y\n"
        exp_continue;
    }
    "I DO NOT ACCEPT (N)" {
        sleep 5;
        send "y\r\n";
        exp_continue;
    }
}