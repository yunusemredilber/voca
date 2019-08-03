class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :appellation
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :partners, :email, unique: true
  end
end
