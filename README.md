# wallpaper-selector

Quickshell-based wallpaper selector UI for dynamic (Wallpaper Engine) and static wallpapers.

This fork is tuned to work cleanly with a Nix/Home Manager setup where the QML app is packaged declaratively and scripts are wrapped by the host system.

## Nix-oriented setup notes

- The app is designed to run from `~/.config/quickshell/wallpaper` (copied there by Home Manager activation).
- `ffmpegPath` defaults to `ffmpeg` (PATH lookup), which matches Nix-wrapped runtime launchers.
- Script calls use `bash` from PATH instead of hardcoded `/bin/bash`.
- Theme colors are read from DMS output at `~/.config/hypr/dms/colors.conf`.
- Static wallpaper default folder is `~/wallpapers`.
- Dynamic workshop folder default is `~/games/SteamLibrary/steamapps/workshop/content/431960/`.
- Mature/Questionable content is filtered out and the `:sus` toggle is removed in this fork.

## Running manually

If you are not using Nix packaging, you can still use the upstream-style setup:

```bash
git clone https://github.com/skamprogiannis/wallpaper-selector.git
cd wallpaper-selector
./setup.sh
```

For Nix users, prefer packaging/activation from your flake and run via your wrapper command.

## Keyboard and interaction

- Arrow keys, mouse drag, and wheel: navigate the grid.
- `/` enters search mode (slash-first search).
- `:` enters command mode.
- `h` / `l`: move selection left / right when search is not focused.
- `f` (or `Ctrl+F`): toggle selected wallpaper as favorite.
- `m`: toggle selected wallpaper in playlist queue.
- `p`: start/stop playlist playback.
- `J` / `K`: move selected queued item down / up.
- `Shift` + click: add/remove hovered wallpaper from playlist.
- `Shift` + `Enter`: start/stop playlist when items exist.
- `Enter` or double click: apply selected wallpaper.
- `Esc` or clicking outside: close help/suggestions/window.

## Commands

- `:help` / `:h`
  - Open command help overlay.

- `:static` / `:s`
  - Toggle static-only filter.

- `:dynamic` / `:d`
  - Toggle dynamic-only filter.

- `:favorite` / `:f`
  - Toggle favorites-only filter.

- `:rename <name>` / `:rn <name>`
  - Rename highlighted wallpaper label.

- `:rename` / `:rn`
  - Clear custom renamed label for highlighted wallpaper.

- `:gif`
  - Toggle animated GIF preview playback.

- `:playlist <minutes>` / `:pl <minutes>`
  - Set playlist interval in minutes.

- `:playlist` / `:pl`
  - Toggle playlist filter (show playlist items only).

- `:playlistshuffle` / `:pls`
  - Toggle playlist shuffle mode.

- `:playlist clear` / `:playlist c` / `:pl clear` / `:pl c`
  - Clear playlist and stop active playlist mode.

- `:random` / `:r`
  - Apply a random dynamic wallpaper.

- `:randomstatic` / `:rs`
  - Apply a random static wallpaper.

- `:randomfav` / `:rf`
  - Apply a random favorited wallpaper.

- `:export <filter>` / `:ex <filter>`
  - Export matching dynamic wallpapers as Steam Workshop URLs to `exported-wallpapers.txt`.

- `:setfolder <path>` / `:sf <path>`
  - Set dynamic wallpaper base folder.

- `:setstatic <path>` / `:ss <path>`
  - Set static wallpaper folder.

- `:setthumb <path>` / `:st <path>`
  - Set thumbnail cache folder and rebuild cache pathing.

- `:setffmpeg <path>`
  - Set ffmpeg binary path used for thumbnail extraction.

- `:clearcache` / `:cc`
  - Remove thumbnail cache and regenerate.

- `:reload` / `:rl`
  - Reload wallpaper folders and metadata.

- `:sort <mode>`
  - Sort results by one of: `default`, `name`, `recent`, `favorite`, `random`.
  - Short aliases: `d`, `n`, `r`, `f`.

- `:open` / `:o`
  - Open highlighted wallpaper's Steam Workshop page.

- `:id`
  - Copy highlighted wallpaper ID/folder tail to clipboard.

- `:tag <name>`
  - Toggle filter by tag name.

- `:tag`
  - Clear current tag filter.
