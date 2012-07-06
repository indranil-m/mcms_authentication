class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :mcms_plugins do |t|
      t.string :role_module
      t.boolean :role_read
      t.boolean :role_create
      t.boolean :role_update
      t.boolean :role_destroy
      t.boolean :role_manage
      t.belongs_to :role
      t.timestamps
    end
  end
end
