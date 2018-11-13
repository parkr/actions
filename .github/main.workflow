workflow "Build on push" {
  on = "push"
  resolves = [
    "pages"
  ]
}

action "pages" {
  uses = "docker://jekyll/jekyll:3.8"
  runs = ["/usr/jekyll/bin/jekyll", "build"]
  env = {
    PATH = "/usr/jekyll/bin:/usr/local/bin:/usr/bin:/bin:/sbin"
  }
  needs = ["docker://alpine"]
}

action "docker://alpine" {
  uses = "docker://alpine"
  runs = ["bash", "-c", "mkdir /github/workspace/_site && chown 1000:1000 /github/workspace/_site"]
 }
