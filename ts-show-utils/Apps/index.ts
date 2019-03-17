import Apt from './Apt'
import Golang from './Golang'
import Npm from './Npm'
import Pip3 from './Pip3'

export interface IApp {
  exec: string;
  install: string;
}

export interface IAppGroup {
  developer: IApp[]
  media: IApp[]
  network: IApp[]
  utilities: IApp[]
}

export {
  Apt,
  Golang,
  Npm,
  Pip3
}

