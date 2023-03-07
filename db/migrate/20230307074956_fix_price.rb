class FixPrice < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :books, :price, :decimal, :precision => 6, :scale => 2
      end
      dir.down do
        change_column :books, :price, :decimal, :precision => 5, :scale => 2
      end
    end
  end
end
