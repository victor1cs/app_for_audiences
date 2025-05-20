namespace :db do
  desc "Reseta o banco, limpa os dados e recria usuários e audiências com dados fictícios"
  task reset_and_seed: :environment do
    puts "Apagando o banco de dados..."
    Rake::Task['db:drop'].invoke

    puts "Criando o banco de dados..."
    Rake::Task['db:create'].invoke

    puts "Rodando migrations..."
    Rake::Task['db:migrate'].invoke

    require 'faker'

    puts "Criando usuários..."
    10.times do
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: "password",
        password_confirmation: "password",
        cellphone: Faker::PhoneNumber.cell_phone,
        role: %w[guest employee admin].sample,
        oab: Faker::Number.number(digits: 6)
      )
    end

    users = User.all

    puts "Criando audiências..."
    100.times do
      Audience.create!(
        number: Faker::Number.unique.number(digits: 8).to_s,
        state: Faker::Address.state_abbr,
        city: Faker::Address.city,
        address: Faker::Address.street_address,
        date_time: Faker::Time.forward(days: 30, period: :morning),
        price: Faker::Commerce.price(range: 100.0..1000.0),
        expense: Faker::Commerce.price(range: 50.0..500.0),
        status: %w[pendente concluída cancelada].sample,
        user: users.sample,
        notifications: [true, false].sample
      )
    end

    puts "Banco de dados recriado com sucesso!"
  end
end
