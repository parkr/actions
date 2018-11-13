workflow "Build on push" {
  on = "push"
  resolves = ["pages"]
}

action "pages" {
  uses = "docker://jekyll/jekyll:3.8"
  args = "build"
}
