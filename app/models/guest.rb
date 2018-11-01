require 'csv'
class Guest < ApplicationRecord
  belongs_to :group
  validates :fullname, uniqueness: true, presence: true
  def self.to_csv!
    CSV.generate(headers: true) do |csv|
      csv << ['group', 'name', 'attending', 'diet', 'group notes']
      Guest.includes(:group).order(:attending, :group_id).each do |person|
        csv << [person.group_id, person.fullname, person.attending, person.dietary_restrictions, person.group.notes]
      end
    end
  end
end
