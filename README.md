<div align="center">
    <h1>Orchid<h1/>
    <img width="200px" src="logo.png">
</div>

Bash script targeted to sysadmins and server managers who wish to save time.

---

> "The second record was called Morningrise"

Orchid was a personal server program originally written in C that tried to
automate (or reduce keystrokes) in common server tasks on Debian based servers,
due to it's unstable nature it crashed and caused a lot of trouble since it had
poorly written C syscalls and code.

UpVent is now taking charge of this program, porting it completely to Bash.

## Overview

Orchid is a Debian/Ubuntu terminal tool written in bash
that lets you interact with common server utilities and applications in hopes
of making the process of preparing, managing and deploying easier for both
sysadmins and day to day Gnu/Linux users. 

Orchid may (or may not) help you in the following ways:

* It lets you easily manage common server managing tasks.
* It works on Debian, Ubuntu and it's derivatives.
* It is easy to extend by developing your own modules.
* It is compatible with most popular stack tools.

## Installation

To install and use Orchid in your system you have to run the following commands

1. Clone the repo, doing this in your home folder is recommended:
`git clone https://github.com/UpVent/orchid.git && cd orchid`

2. To run orchid just use bash or the `./` order to start executing commands:
`./orcd` or `bash orcd`

3. [OPTIONAL] if you want to have Orchid available at all times save the repo in a
hidden folder and add it to your `PATH` variable:

`git clone https://github.com/UpVent/orchid.git && mv orchid .orchid`

Then:

`echo export PATH=$PATH:~/.orchid >> .bashrc`

For now installation should be done manually in your home folder. We are
currently working in the following installation options:

* Via `.deb` package.
* Standalone binary (using `shc`).
* Via apt repository

## Usage

Orchid breeds are invoked using the following steps:

1. Run `orcd` (short for *orchid*) to display all of the breeds (modules)
   available for Orchid.
2. Run `orcd` <breed> or `orcd` <breed> `help` to display the options available
   for any type of breed you need or want to use.
3. Run `orcd` <breed> <option> to execute any option for a given breed.

In Orchid, breeds are small shell script with a separate set of functions that
perform one and only one task most of them should *just work* out of the box by
default since Orchid knows if it is being run in Ubuntu (also Mint) or Debian installations.

**For advanced usage and details please consult the man/ directory for the
project's manpage.**

## Current Breeds (and status)

* Apache2 [Works]
* Virtual [Works]
* NGINX   [Partially works]
* squid   [WIP]
* Django  [WIP]
* storage [Unstable, Tested on Debian]

## DISCLAIMER

This script is still in testing phase, so it's results shouldn't be taken as
granted in any way possible, testing is welcome and after some triage features
will be considered stable and safe to use.

## Project goals

There are a lot of things to do, please consult the [projects](https://github.com/VentGrey/orchid/projects) tab.
