Nate's Dotfiles
===============

Dotfiles to make getting a familiar dev environment up and running easily on any OSX machine.

Installing
----------

1. Clone the repo
2. Install package manager and dependencies with a system-specific script:
	- `brew.sh` for Mac
	- `apt-get.sh` for Ubuntu
3. Copy dotfiles and settings with `bootstrap.sh`
4. Place shared SSH keys in `~/.ssh`
5. Edit the `.extra` file appropriately
6. (Optional) Set up sensible mac defaults with `.macos`

```bash
> git clone git@github.com:tnbeatty/dotfiles.git && cd dotfiles
> ./brew.sh
> ./bootstrap.sh
> cd ~/
> cp /path/to/your/keys ~/.ssh/
> vim .extra
> ./.macos
```

For optional dependencies, there are a set of installer scripts automatically appended to the path. They are all prefixed with `install-` and located in the `bin` directory.

	> install-go-tools


The Standard TNB Toolbox
------------------------

### Themes

- [Solarized8_Dark](https://github.com/lifepillar/vim-solarized8)
- [Solarized (original)](http://ethanschoonover.com/solarized)


Inspired by (and thanks to):
----------------------------

* [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles repo](https://github.com/mathiasbynens/dotfiles)


Todo:
-----

- [X] Solarized theme support
- [X] Complete [.macos defaults](https://mths.be/macos) setup
- [X] Use [Pathogen](https://github.com/tpope/vim-pathogen) for VIM plugins
- [ ] Ubuntu / Linux support
- [ ] Migrate brew installs to a [brewfile](https://github.com/driesvints/dotfiles/blob/master/install.sh)
- [ ] Automate Sublime install and config
- [ ] Add better support for golang to Vim

