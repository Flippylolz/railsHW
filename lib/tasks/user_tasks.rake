namespace :user_tasks do
  require 'csv'

  desc 'import records from CSV'
  task import: :environment do
    CSV.foreach('database.csv', headers: true) do |row|
      user_hash = row.to_hash
      user = User.where(email: user_hash['email'])
      if user.present?
        ap user.first.assign_attributes(user_hash)
      else
        ap User.create!(user_hash)
      end
    end
  end

  desc 'export records to CSV'
  task export: :environment do
    File.open('database.csv', 'wb') do |row|
      headers = %w(first_name last_name username
                   password email birthday)
      row << CSV.generate_line(headers)
      User.all.each do |user|
        row << CSV.generate_line([user.first_name, user.last_name, user.username,
                                  user.password, user.email,
                                  user.birthday])
      end
    end
  end

end
