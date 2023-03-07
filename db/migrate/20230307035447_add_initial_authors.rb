class AddInitialAuthors < ActiveRecord::Migration[7.0]
  def up
    15.times do |i|
      Author.create(first_name: "FirstName #{i + 1}", last_name: "LastName #{i + 5}", date_of_birth: Date.parse('2001-11-01'),
                    email: "Author#{i}.k@simformsolutions.com")
    end
  end

  def down
    Author.destroy_all
  end
end
