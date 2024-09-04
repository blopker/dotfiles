## dotfiles

My dot files.

## install

Run:

```
git clone https://github.com/blopker/dotfiles.git ~/.dotfiles && make -C ~/.dotfiles
```

Then run the OS specific script in either `linux` or `osx`

## symlinks

Any file can be symlinked by adding it and the place to symlink to the `symlinks` file, then running `make install_symlinks`.
