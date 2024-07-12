class CreateMessage < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content, null: false, limit: 255
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
