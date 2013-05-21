class Addcolumnventetoproducts < ActiveRecord::Migration
  def change
  	add_column :products, :vente, :boolean
  end
end
