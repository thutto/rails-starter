class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :noteText
      t.boolean :archived

      t.timestamps
    end
  end
end
