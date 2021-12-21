local present1, icons = pcall(require, "nvim-web-devicons")
if not present1 then
   return
end

local present2,colors = pcall(require, "nvoid.colors")
if not present2 then
   return false
end

icons.setup {
   override = {
      html = {
         icon = " ",
         color = colors.pink,
         name = "html",
      },
      sh = {
          icon  = " ",
          color = colors.grey,
          name = "sh"
      },
      md = {
          icon  = " ",
          color = colors.blue,
          name = "md"
      },
      zsh = {
          icon  = " ",
          color = colors.grey,
          name = "zsh"
      },
      fish = {
          icon  = " ",
          color = colors.grey,
          name = "fish"
      },
      c = {
         icon = " ",
         color = colors.blue,
         name = "c",
      },
      h = {
         icon = " ",
         color = colors.purple,
         name = "c",
      },
      css = {
         icon = " ",
         color = colors.blue,
         name = "css",
      },
      js = {
         icon = " ",
         color = colors.yellow,
         name = "js",
      },
      ts = {
         icon = "ﯤ ",
         color = colors.teal,
         name = "ts",
      },
      kt = {
         icon = "󱈙 ",
         color = colors.orange,
         name = "kt",
      },
      png = {
         icon = " ",
         color = colors.purple,
         name = "png",
      },
      jpg = {
         icon = " ",
         color = colors.purple,
         name = "jpg",
      },
      jpeg = {
         icon = " ",
         color = colors.purple,
         name = "jpeg",
      },
      mp3 = {
         icon = " ",
         color = colors.fg,
         name = "mp3",
      },
      mp4 = {
         icon = " ",
         color = colors.fg,
         name = "mp4",
      },
      out = {
         icon = " ",
         color = colors.fg,
         name = "out",
      },
      Dockerfile = {
         icon = " ",
         color = colors.cyan,
         name = "Dockerfile",
      },
      rb = {
         icon = " ",
         color = colors.pink,
         name = "rb",
      },
      vue = {
         icon = "﵂ ",
         color = colors.green,
         name = "vue",
      },
      py = {
         icon = " ",
         color = colors.cyan,
         name = "py",
      },
      toml = {
         icon = " ",
         color = colors.blue,
         name = "toml",
      },
      lock = {
         icon = " ",
         color = colors.red,
         name = "lock",
      },
      zip = {
         icon = " ",
         color = colors.yellow,
         name = "zip",
      },
      xz = {
         icon = " ",
         color = colors.yellow,
         name = "xz",
      },
      deb = {
         icon = " ",
         color = colors.red,
         name = "deb",
      },
      rpm = {
         icon = " ",
         color = colors.orange,
         name = "rpm",
      },
      lua = {
         icon = " ",
         color = colors.blue,
         name = "lua",
      },
   },
}
