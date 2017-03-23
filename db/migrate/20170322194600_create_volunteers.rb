class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :github
      t.string :linked_in

      t.timestamps
    end
  end
end
