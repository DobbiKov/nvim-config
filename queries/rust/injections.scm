;; Inject Markdown into Rust doc comments
((line_comment) @comment
 (#match? @comment "^///"))

((block_comment) @comment
 (#match? @comment "^/\\*\\*!"))
