class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :categories do |t|
      t.string :label

      t.timestamps
    end

    create_table :devices do |t|
      t.string :name
      t.text :description
      t.references :category

      t.timestamps
    end
  end
end
