class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :cr
      t.string :registration

      t.timestamps
    end
  end
end
