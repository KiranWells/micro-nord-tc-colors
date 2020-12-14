# Micro Nord Colors

A [Nord](https://www.nordtheme.com/) colorscheme port for the [Micro](https://micro-editor.github.io/index.html) editor.

## Features

`nordsetup`: A command that sets up the colorscheme files.  
`nord-tc`: A truecolor dark theme  
`nord-16`: A 16-color dark theme  
`nord-tc-light`: A truecolor light theme  
`nord-16-light`: A 16-color light theme  

## FAQ (useful info)

### Why are the themes not showing up?

**IMPORTANT**

Due to the way micro currently works (or at least my understanding of it), you will need to run the `nordsetup` command once after installation to move the colorscheme files to the correct location. This will manually create the colorschemes directory and move all four themes over.

After running this command, you can optionally remove the nord colors plugin, and the colorschemes should remain. After updating the plugin, you will need to run the command again; if the theme files are unchanged, remove them and run the command again.

### Why do the colors look off?

The truecolor schemes require micro to be started with the environment variable "MICRO_TRUECOLOR" equal to 1 or true. For these, make sure you do:

```sh
MICRO_TRUECOLOR=1 micro
```

The 16-color schemes require the terminal to have the nord color scheme installed. See the [Nord ports page](https://www.nordtheme.com/ports) for config files for your terminal.

### Why is there no transparency?

For transparency to work, you need transparency enabled in your terminal, a compositor (possibly), and one of the 16-color versions enabled. The way it works is that the 16-color themes have no background color, defaulting to the terminal's native background.

### Why do the light colorschemes look bad?

I did my best to convert the dark schemes to a usable light scheme, but it is difficult to work with the Nord colors in light themes. You can edit the files yourself in the `.config/micro/colorschemes` directory, and if you think you have improved it, make a pull request on the [GitHub page.](https://github.com/KiranWells/micro-nord-tc-colors/)
