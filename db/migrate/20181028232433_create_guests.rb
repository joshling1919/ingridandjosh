class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :fullname, null: false, index: true
      t.boolean :attending
      t.string :dietary_restrictions
      t.belongs_to :group, index: true
      t.timestamps
    end
  end
end
