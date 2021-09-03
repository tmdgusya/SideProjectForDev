FROM debian

EXPOSE 3000

RUN apt-get update
RUN apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
RUN apt-get install git-core

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

RUN source ~/.bashrc

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN rbenv install 3.0.2
RUN rbenv global 3.0.2

RUN git clone https://github.com/tmdgusya/SideProjectForDev.git

# TODO Mysql2 error
RUN apt-get install libmariadb-dev

RUN SideProjectForDev/api-server/bundle install

ENTRYPOINT [ "SideProjectForDev/api-server/bin/rails server -e production"]
