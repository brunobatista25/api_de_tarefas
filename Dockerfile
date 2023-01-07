# Usando uma imagem do ruby 
FROM ruby:3.1.3

# Instalando dependências
RUN apt-get update && \
    apt-get install -y gnupg build-essential wget unzip sudo curl

ENV APP_HOME /app \
    HOME /root
# Criando a pasta app
WORKDIR $APP_HOME
# Copiando o Gemfile pra pasta app
COPY Gemfile* $APP_HOME/

RUN gem install bundler
# Intalando as gems
RUN bundle install

# Copiando o projeto para pasta app
COPY . $APP_HOME
RUN bundle exec rake db:migrate
EXPOSE 3000

#CMD ./start-dev.sh
CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0","-p","3000"]