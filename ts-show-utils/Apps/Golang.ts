import { IApp } from "./"

class Golang {
  public developer: IApp[] = []
  public media: IApp[] = []
  public network: IApp[] = []
  public utilities: IApp[] = [
    {
      exec: "ccat",
      install: "github.com/jingweno/ccat",
    },
    {
      exec: "s",
      install: "github.com/zquestz/s",
    },
    {
      exec: "ytdl",
      install: "github.com/otium/ytdl",
    },
  ]
}

export default Golang
