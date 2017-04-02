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
     CSV.open('database.csv','wb') do |row|
       row << User.column_names
       User.all.each do |result|
         row << result.attributes.values_at(*User.column_names)
       end
     end
  end

end
