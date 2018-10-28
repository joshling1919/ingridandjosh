require 'csv'
namespace :import do
  task guests: :environment do
    students = Hash.new { |k,v| k[v] = Array.new }

    CSV.foreach(Rails.root.join('lib', 'assets', 'guests.csv')) do |row|
      row.each do |guest|
        next if guest.nil?
        p guest
      end
    end
    p "Done importing!"
  end
end
