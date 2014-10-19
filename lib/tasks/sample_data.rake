namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, :migrate, :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    10.times do
      User.create!(email: Faker::Internet.email,
                    name: Faker::Name.name,
                password: 'password')
    end

    User.all.each do |user|
      user.wineries.create!(name: "#{Faker::Address.street_name} Winery")
    end
  end
end
