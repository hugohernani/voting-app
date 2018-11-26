class DropRoles < ActiveRecord::Migration[5.2]
  def change
    drop_table :roles
    drop_table :accounts_roles
  end
end
