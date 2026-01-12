{pkgs, lib, ...}:
{
    config.vim = let p = pkgs.vimPlugins; in {
    # Enable custom theming options
        theme.enable = true;
        theme.base16-colors = {
            base00= "#1c1213";
            base01= "#3a2425";
            base02= "#563837";
            base03= "#6d4745";
            base04= "#8b5d57";
            base05= "#a87569";
            base06= "#c58d7b";
            base07= "#e3a68c";
            base08= "#c24f57";
            base09= "#a63650";
            base0A= "#f28171";
            base0B= "#806c61";
            base0C= "#6b6566";
            base0D= "#684c59";
            base0E= "#a63650";
            base0F= "#893f45";
        };
        theme.name = "base16";

        utility.icon-picker.enable = true;

        # Lualine
        statusline.lualine = {
            enable = true;
            theme = "base16";
            icons.enable = true;

        };

        # Enable Treesitter
        treesitter.enable = true;

        assistant.copilot = {
          enable = true;
          cmp.enable = true;
        };

        lsp = {
          enable = true;
        };

        options.tabstop = 4;
        options.termguicolors = true;
        options.shiftwidth = 0;

        startPlugins = [
          "base16"
          "cmp-luasnip"
          "cmp-nvim-lsp"
          "copilot-cmp"
          "copilot-lua"
          "friendly-snippets"
          "indent-blankline-nvim"
          "lualine-nvim"
          "luasnip"
          "nvim-cmp"
          "nvim-web-devicons"
          "nvim-surround"
          "nvim-tree-lua"
          "comment-nvim"
          "nvim-lspconfig"
          "undotree"
          "telescope"
          "plenary-nvim"
        ];

        # Other options will go here. Refer to the config
        # reference in Appendix B of the nvf manual.
        # ...
        extraPlugins = {
            nvim-tree-lua = {
                package = p.nvim-tree-lua;
                setup = ''
                    vim.g.loaded_netrw = 1
                    vim.g.loaded_netrwPlugin = 1

                    local function my_on_attach(bufnr)
                      local api = require('nvim-tree.api')

                      local function opts(desc)
                        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                      end

                      -- Default mappings
                      api.config.mappings.default_on_attach(bufnr)

                      -- Custom mappings
                      vim.keymap.set('n', '<leader>t', api.tree.toggle, opts('Toggle Tree'))
                    end
                    require('nvim-tree').setup {
                      on_attach = my_on_attach,
                      filters = {
                        dotfiles = false,
                      },
                      view = {
                        width = 30,
                        side = 'left',
                      },
                    }

                    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle File Explorer" })
                '';
              };
              telescope-nvim = {
                package = p.telescope-nvim;
                setup = ''
                    local builtin = require("telescope.builtin")
                    vim.keymap.set('n', '<leader>pf', function()
                      builtin.find_files({hidden = true});
                    end, {desc = "Find Files using Telescope"})
                    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Find Git Files using Telescope"})
                    vim.keymap.set('n', '<leader>ps', function ()
                      builtin.grep_string({search = vim.fn.input("Grep > ") });
                    end, { desc = "Grep for a string using Telescope"})
                '';
            };
        };
    };
}
