---
layout: default
---

# Orchid - Easy Server Management

**This is a documentation page. For project information please go to the
[project page](https://upvent.codes/orchid)**


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



###### Project reach

| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

### Large image

![Branching](https://guides.github.com/activities/hello-world/branching.png)


### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
