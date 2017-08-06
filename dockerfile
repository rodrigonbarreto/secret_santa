FROM ruby:2.3-slim
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick
# setup path
ENV INSTALL_PATH /secret_santa
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# setup path like principal folder
WORKDIR $INSTALL_PATH
# conpy gemfile to container
COPY Gemfile ./
# setuph path for Gems
ENV BUNDLE_PATH /box
#Copy our code to container
COPY . .
