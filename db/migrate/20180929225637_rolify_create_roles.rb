class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:accounts_roles, :id => false) do |t|
      t.references :account
      t.references :role
    end
    
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:accounts_roles, [ :account_id, :role_id ])
  end
end
