class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name, :null => false, :default => ""
    	t.decimal :price, :null => false, :precision => 2, :default => 1.00
    	t.boolean :active, :null => false, :default => false
    	t.references :category

    	t.timestamps
    end
  end
end
