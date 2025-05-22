require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main/",
    },
  },
    templates = {
    folder = "5 - Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  new_notes_location = "notes_subdir",
    note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.title)
    return path:with_suffix(".md")
  end,
  wiki_link_func = "use_alias_only",
})
