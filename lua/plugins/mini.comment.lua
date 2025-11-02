return {
  {
    "nvim-mini/mini.comment",
    opts = {
      -- remap all the comment toggles to “\”
      mappings = {
        -- operator-pending & visual: “\{motion}” or visual “\” toggles comment
        comment = "\\\\",
        -- normal-mode “\” toggles the current line
        comment_line = "\\\\",
        -- visual-mode “\” toggles the selection
        comment_visual = "\\\\",
        -- you can disable the textobject if you don’t need it
        textobject = "",
      },
    },
  },
}
