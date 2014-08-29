require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite3'
)

class CreateBooksTable < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :page
      t.datetime :publish_date

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

CreateBooksTable.new.up