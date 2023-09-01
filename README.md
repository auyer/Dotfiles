# dotfiles

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

Run `stow` to symlink everything or just select what you want

```bash
stow lvim -t ~ # creates symlinks for lvim configs
```

Or eveything
```bash
stow */ -t ~ # Everything (the '/' ignores the README)
```

## Adopting new dotfiles

1. create a folder with the name of the app, and the structure of the config files
Ex: `.config/starship.toml`
Becomes:
```bash
mkdir -p starship/.config/
touch starship/.config/starship.toml
stow starship -t ~ --adopt
```
