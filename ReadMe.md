# My dotfiles and other $HOME configuration
## Robert Haines

### Setup

To install these files in `$HOME` run `make` in the root of this repository. You can install just the dotfiles with `make dots` and just the bin files with `make bins`. The `$HOME/bin` directory will be created if needs be.

If you have any sensitive information (for example access keys, etc) you can put them in a file called `$HOME\.extra` and the `.bash_profile` in this setup will pull it in automatically. You can create a file called `dot/extra` in this repository directory and it will be installed with the other dotfiles. ***Do not check in `.extra` or `dot/extra`!***

### Items in the `bin` directory

#### Docker executable wrappers

These are needed for the executables in docker images to work correctly. They are required in situations where programs need to be run outside of a fully initialised shell environment, e.g. `p4merge` being called from `git mergetool`.

Current wrappers are: `anaconda`, `jekyll`, `mencoder`, `p4merge`, `xnview`.

#### docker-cleanup

A convenience script to clean up old/stale containers and images.

#### progress

For each line of input (stdin) output a 'dot'. This is useful for monitoring the progress of a long running operation, without seeing all of its output streaming past.

The 'dot' can be specified as the first parameter but defaults to '.'. If you want to use a character that has special significance in a shell environment  - such as `#`, `&`, `|`, `*`, `\`, and so on - then use quotes, e.g. '`*`'.

*Usage:*
```shell
$ some-script-with-lots-of-output | progress [dot]
```

### Software/package specific notes

#### npm: Node Package Manager

[npm][npm] is set up so that global packages are installed in the `~/.node` directory by default. `~/.node/bin` is also added to `PATH` once it exists.

### Licence

BSD. See LICENCE for details.

[npm]: https://www.npmjs.com/
