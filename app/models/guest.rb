require 'csv'
class Guest < ApplicationRecord
  belongs_to :group
  validates :fullname, uniqueness: true, presence: true

  def self.update_csv!
    CSV.open('public/assets/rsvp.csv', 'wb') do |csv|
      csv << ['name', 'attending', 'diet', 'group notes']
      Guest.includes(:group).order(:attending).each do |person|
        csv << [person.fullname, person.attending, person.dietary_restrictions, person.group.notes]
      end
    end
  end
end
