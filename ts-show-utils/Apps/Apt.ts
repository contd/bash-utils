import { IApp } from "./"

class Apt {
  public developer: IApp[] = [
    {
      exec: "docker",
      install: "docker",
    },
    {
      exec: "jq",
      install: "jq",
    },
    {
      exec: "mycli",
      install: "mycli",
    },
    {
      exec: "pgcli",
      install: "pgcli",
    },
  ]

  public media: IApp[] = [
    {
      exec: "convert",
      install: "convert",
    },
    {
      exec: "imgp",
      install: "imgp",
    },
    {
      exec: "ffmpeg",
      install: "ffmpeg",
    },
    {
      exec: "gifsicle",
      install: "gifsicle",
    },
    {
      exec: "HandBrakeCLI",
      install: "HandBrakeCLI",
    },
    {
      exec: "pandoc",
      install: "pandoc",
    },
    {
      exec: "pdftohtml",
      install: "pdftohtml",
    },
  ]

  public network: IApp[] = [
    {
      exec: "curl",
      install: "curl",
    },
    {
      exec: "ifstat",
      install: "ifstat",
    },
    {
      exec: "iftop",
      install: "iftop",
    },
    {
      exec: "iptraf",
      install: "iptraf",
    },
    {
      exec: "nmap",
      install: "nmap",
    },
    {
      exec: "nmon",
      install: "nmon",
    },
    {
      exec: "rsync",
      install: "rsync",
    },
    {
      exec: "speedtest-cli",
      install: "speedtest-cli",
    },
    {
      exec: "wget",
      install: "wget",
    },
    {
      exec: "youtube-dl",
      install: "youtube-dl",
    },
    {
      exec: "vtop",
      install: "util-vserver",
    },
  ]

  public utilities: IApp[] = [
    {
      exec: "asciinema",
      install: "asciinema",
    },
    {
      exec: "awk",
      install: "awk",
    },
    {
      exec: "colordiff",
      install: "colordiff",
    },
    {
      exec: "gpg2",
      install: "gpg2",
    },
    {
      exec: "lnav",
      install: "lnav",
    },
    {
      exec: "openssl",
      install: "openssl",
    },
    {
      exec: "pandoc",
      install: "pandoc",
    },
    {
      exec: "progress",
      install: "progress",
    },
    {
      exec: "rename",
      install: "rename",
    },
    {
      exec: "unzip",
      install: "unzip",
    },
    {
      exec: "xsel",
      install: "xsel",
    },
  ]

}

export default Apt
