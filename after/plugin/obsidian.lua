require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main/",
    },
  },
    templates = {
    folder = "5 - Templates",
    date_format = "%d-%m-%Y",
    time_format = "%M:%H",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  notes_subdir = "8 - Inbox",
  new_notes_location = "notes_subdir",
    note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.title)
    return path:with_suffix(".md")
  end,
  wiki_link_func = "use_alias_only",
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local date_table = os.date("*t", os.time())
    local date_str = string.format("%d-%d-%d", date_table.year, date_table.month, date_table.day)

    local out = { id = note.id, aliases = note.aliases, tags = note.tags, created = date_str }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
})
