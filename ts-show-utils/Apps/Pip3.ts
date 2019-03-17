import { IApp } from "./"

class Pip3 {
  public developer: IApp[] = [
    {
      exec: "mycli",
      install: "mycli",
    },
    {
      exec: "pgcli",
      install: "pgcli",
    },
    {
      exec: "pockyt",
      install: "pockyt",
    },
  ]

  public media: IApp[] = [
    {
      exec: "image-scraper",
      install: "image-scraper",
    },
    {
      exec: "instagram-scraper",
      install: "instagram-scraper",
    },
  ]

  public network: IApp[] = [
    {
      exec: "awscli",
      install: "awscli",
    },
    {
      exec: "ddgr",
      install: "ddgr",
    },
    {
      exec: "gping",
      install: "pinggraph",
    },
  ]

  public utilities: IApp[] = []

}

export default Pip3
