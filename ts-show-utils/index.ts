import * as execa from 'execa'
import * as Listr from 'listr'
import { Apt, Golang, Npm, Pip3 } from "./Apps"

class Tasks {
  async run() {
    return this.BuildTaskGroups(new Apt(), 'sudo apt install')
      .then(() => {
        return this.BuildTaskGroups(new Golang(), 'go get -uv')
      })
      .then(() => {
        return this.BuildTaskGroups(new Npm(), 'npm install -g')
      })
      .then(() => {
        return this.BuildTaskGroups(new Pip3(), 'pip3 install')
      })
  }

  public BuildTaskGroups = async (obj, plan) => {
    return Object.entries(obj).map(async prop => {
      const name = prop[0]
      const tgroup = prop[1]
      const task = {
        name: name,
        tgroup: tgroup
      }
      await this.BuildTasks(task, plan)
    })
  }

  public BuildTasks = async (tgroup, plan) => {
    for (let cmd of tgroup.tgroup) {
      new Listr([
        {
          title: `Is installed: ${cmd.execa}`,
          task: (_, task) => execa('which', [cmd.execa])
            .catch(() => {
              task.skip(`Run: ${plan} ${cmd.install}`)
            })
        }
      ]).run()
    }
    return
  }
}

new Tasks().run()