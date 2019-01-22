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

workflow "Echo without newline and see what happens" {
  on = "push"
  resolves = ["docker://alpine:3.8-1"]
}

action "docker://alpine:3.8" {
  uses = "docker://alpine:3.8"
  runs = "echo"
  args = "-n hello world"
}

action "docker://alpine:3.8-1" {
  uses = "docker://alpine:3.8"
  needs = ["docker://alpine:3.8"]
  runs = "cat"
  args = "/etc/passwd"
}
