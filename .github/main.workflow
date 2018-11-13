workflow "Build on push" {
  on = "push"
  resolves = ["pages"]
}

action "pages" {
  uses = "docker://jekyll/jekyll:3.8"
  runs = ["/usr/jekyll/bin/jekyll", "build"]
  env = {
    PATH = "/usr/jekyll/bin:/usr/local/bin:/usr/bin:/bin:/sbin"
  }
}
