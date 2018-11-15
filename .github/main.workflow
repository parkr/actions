workflow "Build on push" {
  on = "push"
  resolves = ["show me my page"]
}

action "pages" {
  uses = "docker://jekyll/jekyll:3.8"
  runs = ["/usr/jekyll/bin/jekyll", "build"]
  env = {
    PATH = "/usr/jekyll/bin:/usr/local/bin:/usr/bin:/bin:/sbin"
  }
  needs = ["setup _site output dir"]
}

action "setup _site output dir" {
  uses = "docker://alpine"
  runs = ["sh", "-c", "mkdir _site && chown 1000:1000 _site"]
}

action "show me my page" {
  uses = "docker://alpine"
  needs = ["pages"]
  runs = "cat _site/index.html"
}
