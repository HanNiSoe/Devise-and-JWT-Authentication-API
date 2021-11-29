class AddJtiToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :jti, :string, null: false
    add_index :companies, :jti, unique: true
  end
end
