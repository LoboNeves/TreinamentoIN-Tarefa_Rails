class CreateClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :classes do |t|
      t.string :initials
      t.string :day_of_the_week
      t.string :time
      t.string :status

      t.timestamps
    end
  end
end
