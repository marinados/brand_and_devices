class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestaps
    end

    create_table :categories do |t|
      t.string :label
    end

    create_table :devices do |t|
      t.string :name
      t.text :description
      t.references :category
    end
  end
end
