# My dotfiles
## Robert Haines

### Usage

To install the dotfiles in `$HOME` run `make` in the root of this repository.

If you have any sensitive information (for example access keys, etc) you can put them in a file called `$HOME\.extra` and the `.bash_profile` in this setup will pull it in automatically. *Do not check in `.extra`!*

### Software/package specific notes

#### RVM: Ruby Version Manager

[RVM][rvm] integration is included in these dotfiles so when installing it you don't need to edit `.bash_profile` or `.bashrc`. To stop this happening automatically, install RVM like this:

```
\curl -sSL https://get.rvm.io | bash -s stable -- --ignore-dotfiles
```

See the [RVM installation instructions][rvminstall] for more details.

### Licence

BSD. See LICENCE for details.

[rvm]: https://rvm.io/
[rvminstall]: https://rvm.io/rvm/install
