FROM ruby:3.4.2

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Define o diretório de trabalho
WORKDIR /app

# Copia o Gemfile e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Expõe a porta do servidor Rails
EXPOSE 3000

# Comando padrão para rodar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
