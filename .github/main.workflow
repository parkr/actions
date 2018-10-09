workflow "Build on push" {
  on = "push"
  resolves = ["pages"]
}

action "pages" {
  uses = "fried-oreos/pages@master"
  secrets = ["GITHUB_TOKEN"]
}
