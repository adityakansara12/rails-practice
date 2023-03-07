class AddInitialBooks < ActiveRecord::Migration[7.0]
  def up
    5.times do |i|
      # Here author_id: starting with 19 because in author table id column starts also with 19.
      Book.create(author_id: 1 + i, name: "Book #{i}", price: "123.5#{i}".to_f)
    end
  end

  def down
    Book.destroy_all
  end
end
