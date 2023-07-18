# Neovim Component Generator Plugin

This is a Neovim Lua plugin that generates React component files with associated tests.

## Installation

1. Install Neovim with Lua support.
2. Install [Packer](https://github.com/wbthomason/packer.nvim), a plugin manager for Neovim.
3. To install with packer add the following line: 

   ```lua
   use {'rodsnts/component_generator'}
## Usage

Once the plugin is installed, you can use the `:GenerateComponent` command in Neovim to open a text box. Enter the desired component name in the text box and press Enter. The plugin will then generate a `.tsx` file with a React component and a corresponding `.test.tsx` file with a basic test. The generated files will be placed in the `components/{componentName}` directory relative to the current working directory.
