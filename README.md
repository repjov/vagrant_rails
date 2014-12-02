## Rails envaroment
For start:
- please create `vagrant` folder and put there your project
- change variables `provisions/vars/main.yml`
- change variables `Vagrantfile`

In order to start your project run `vagrunt up` first time and if will need to change only provisions use `vagrant provision`.

In order to connect to server use `vagrant ssh`

*rails project here run following: connect to server -> go to project folder -> `rails s`-> site will be available by URL `http://{your_url}:3000`*