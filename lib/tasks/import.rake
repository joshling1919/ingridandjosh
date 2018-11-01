require 'csv'
namespace :import do
  task guests: :environment do
    students = Hash.new { |k,v| k[v] = Array.new }

    CSV.foreach(Rails.root.join('lib', 'assets', 'guests.csv')) do |row|
      group = Group.create!
      row.each do |guest|
        next if guest.nil?
        begin
          Guest.create!(
            fullname: guest,
            group: group
          )
          p "Created #{guest}"
        rescue StandardError
          p "There was an issue creating #{guest}."
        end
      end
    end
    p 'Done importing!'
  end
end
 