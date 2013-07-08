class ChangeNameTableComprador < ActiveRecord::Migration
  def change
  	rename_table :comprador, :compradors
  end

end
