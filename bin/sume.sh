#!/usr/bin/expect

spawn sudo su
expect "password for qingmin:" {
	send "qingmin\r"
}
interact
