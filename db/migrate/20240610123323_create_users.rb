class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :user_status
      t.string :first_name
      t.string :given_name
      t.integer :age
      t.string :family_role
      t.integer :number_of_kid
      t.boolean :accepted_terms_of_service
      t.boolean :accepted_news_letters
      t.timestamps
    end
  end
end
