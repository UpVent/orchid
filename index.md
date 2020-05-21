---
layout: default
---

# Orchid - Easy Server Management

**This is a documentation page. For project information please go to the
[project page](https://upvent.codes/orchid)**


> Disclaimer: Orchid is what you can call a "Server Management Swiss Knife"
> and should not be confused with the same capabilities of server automation
> software like Ansible or control panels like Webmin. Orchid is just for
> reducing the most common steps in server applications setup, quick
> management and deploy.

Orchid is a script written in *closest possible* POSIX bash. This script aims
to provide an easy way to manage, create, destroy or deploy common server
applications. Orchid also lets you compile kernels and provides basic hardening
fot common depoyed applications.

## "The second record was called Morningrise"

Orchid was a personal server program originally written in C that tried to automate (or reduce keystrokes) in common server tasks on Debian based servers, due to it's unstable nature it crashed and caused a lot of trouble since it had poorly written C syscalls and code.

UpVent is now taking charge of this program, porting it completely to Bash.

## Project layout

Orchid works in a modular way, since all of the "breeds" mentioned are
really detachable separate bash files that can be modified, added or
deleted without any problem as long as the bash syntax is correct.

Orchid has the current layout

```
.
├── LICENSE
├── README.md
├── breeds
│   ├── module1
│   ├── module2
│   └── module3
├── lib
│   └── requiem
├── logo.png
├── man
│   └── orcd
└── orcd
```

Let's cover the following files and directories in short to understand
the orchid project structure:

* `LICENSE`: Is the license file of the project. It is the GPL-2 License.
* `README.md`: This is the markdown file you saw at the GitHub repository!
* `breeds/*`: This is a directory where modules are added into. Just create
a new file without the `.sh` extension and it should be ready to go.
* `lib/*`: This is a directory where libraries should be placed.
* `lib/requiem`: Requiem is a library where common functions amongst
*all modules* are created. Functions such as dependencies, privilege
checks and validators for modules in Orchid.
* `logo.png`: Should we **Really** explain this?
* `man/orcd`: Here is the project manpage.
* `orcd`: Main orchid bash program.


## How does Orchid auto-detects modules? Why is it so small?

Believe it or not Orchid is a 38-line only project. That's it.
Just 38 lines of Bash code to make this awesome server swiss knife.

All the magic happens within this function which searches and
indexes the current modules (breeds) under the `breeds/` directory.

```bash
    for i in "${OPATH}"/breeds/*; do
        [ ! -L "$i" -a -f "$i" ] && echo "            ${i##*/}"
    done

    [ "${OPTIONS}" == "help" ] && exit 0 || exit 1
   
}

OPTIONS=$1; shift;

[ ! -f "${OPATH}/breeds/${OPTIONS}" ] && use
"${OPATH}"/breeds/"${OPTIONS}" "$@"
```

This keeps orchid as a **Very** lightweight program and
the slow tasks can be assigned to the modules instead
such as installing, setting up or quick-managing server
side software.


## Current Modules

| Image        | Name          | Capabilities |
|:-------------|:------------------|:------|
| ![Apache Logo](https://cdn.iconscout.com/icon/free/png-256/apache-8-1174973.png)| good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

