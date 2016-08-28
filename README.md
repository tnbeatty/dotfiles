Nate's Dotfiles
===============

Dotfiles to make getting a familiar dev environment up and running
easily on any OSX machine.

Installing
----------

1. Clone the repo
2. Install [Homebrew](http://brew.sh/) and packages with `brew.sh`
3. Copy dotfiles and settings with `bootstrap.sh`
4. Place shared SSH keys in `~/.ssh`
5. Edit the `.extra` file appropriately
6. Set up sensible mac defaults with `.macos`

	> git clone git@github.com:tnbeatty/dotfiles.git && cd dotfiles
	> ./brew.sh
	> ./bootstrap.sh
	> cd
	> cp /path/to/your/keys ~/.ssh/
	> vim .extra
	> ./.macos

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
- [ ] Migrate brew installs to a [brewfile](https://github.com/driesvints/dotfiles/blob/master/install.sh)
- [ ] Automate Sublime install and config
- [ ] Add better support for golang to Vim
