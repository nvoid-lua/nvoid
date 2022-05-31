require("nvim-gps").setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = " ", -- Classes and class-like objects
    ["function-name"] = " ", -- Functions
    ["method-name"] = " ", -- Methods (functions inside class-like objects)
    ["container-name"] = "⛶ ", -- Containers (example: lua tables)
    ["tag-name"] = "炙", -- Tags (example: html tags)
  },

  languages = {
    -- Some languages have custom icons
    ["json"] = {
      icons = {
        ["array-name"] = " ",
        ["object-name"] = " ",
        ["null-name"] = "[] ",
        ["boolean-name"] = "ﰰﰴ ",
        ["number-name"] = "# ",
        ["string-name"] = " ",
      },
    },
    ["latex"] = {
      icons = {
        ["title-name"] = "# ",
        ["label-name"] = " ",
      },
    },
    ["norg"] = {
      icons = {
        ["title-name"] = " ",
      },
    },
    ["toml"] = {
      icons = {
        ["table-name"] = " ",
        ["array-name"] = " ",
        ["boolean-name"] = "ﰰﰴ ",
        ["date-name"] = " ",
        ["date-time-name"] = " ",
        ["float-name"] = " ",
        ["inline-table-name"] = " ",
        ["integer-name"] = "# ",
        ["string-name"] = " ",
        ["time-name"] = " ",
      },
    },
    ["verilog"] = {
      icons = {
        ["module-name"] = " ",
      },
    },
    ["yaml"] = {
      icons = {
        ["mapping-name"] = " ",
        ["sequence-name"] = " ",
        ["null-name"] = "[] ",
        ["boolean-name"] = "ﰰﰴ ",
        ["integer-name"] = "# ",
        ["float-name"] = " ",
        ["string-name"] = " ",
      },
    },
    ["yang"] = {
      icons = {
        ["module-name"] = " ",
        ["augment-path"] = " ",
        ["container-name"] = " ",
        ["grouping-name"] = " ",
        ["typedef-name"] = " ",
        ["identity-name"] = " ",
        ["list-name"] = "﬘ ",
        ["leaf-list-name"] = " ",
        ["leaf-name"] = " ",
        ["action-name"] = " ",
      },
    },
  },

  separator = " > ",
  depth = 0,
  depth_limit_indicator = "..",
}
