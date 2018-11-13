workflow "Build on push" {
  on = "push"
  resolves = ["pages"]
}

action "pages" {
  uses = "docker://jekyll/minimal:3.8"
}
