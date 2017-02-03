class AddTypeKeyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :tipo, :boolean, :presence => true
  end
end
