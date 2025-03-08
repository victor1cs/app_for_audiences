namespace :db do
    desc "Popula o banco de dados com usuários e audiências"
    task seed: :environment do
      require 'faker'
  
      # Criando usuários
      puts "Criando usuários..."
      10.times do
        User.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "password",
          cellphone: Faker::PhoneNumber.cell_phone,
          admin: [true, false].sample,
          oab: Faker::Number.number(digits: 6)
        )
      end
  
      users = User.all
  
      # Criando audiências
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
  
      puts "Banco de dados populado com sucesso!"
    end
  end
  