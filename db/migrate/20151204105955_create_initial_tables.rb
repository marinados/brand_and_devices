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
      t.string :series

      t.timestamps
    end

    create_table :devices_users do |t|
      t.references :device
      t.references :user
    end

    create_table :updates do |t|
      t.references :device
      t.text :comment

      t.timestamps
    end

    create_table :requests do |t|
      t.references :user
      t.references :device
      t.date :end_date

      t.timestamps
    end
  end
end
