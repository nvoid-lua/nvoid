local present, colorizer = pcall(require, "colorizer")
if present then
  colorizer.setup({ "*" }, {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = false,
    rgb_fn = false,
    hsl_fn = false,
    css = false,
    css_fn = false,
    mode = "background",
  })
end
