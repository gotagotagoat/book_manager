require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

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

class Book < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/' do
  @name = params[:str]
  erb :index
end

get '/list' do
  @book_columns = Book.column_names[0..4]
  @book_list = Book.all
  erb :list
end

post '/entry' do
  Book.create(
    :title => params[:title],
    :author => params[:author],
    :page => params[:page],
    :publish_date => params[:publish_date]
    )
  redirect '/list'
end

get '/entry' do
  erb :entry
end

post '/delete_or_edit' do
  @book_columns = Book.column_names[0..4]
  id = params[:operation].to_s.gsub(/@.*/, "")
  if params[:operation] == nil
    erb :noselected
  elsif params[:operation] =~ /delete/
    @value = Book.find(id)
    erb :delete
  elsif params[:operation] =~ /edit/
    @value = Book.find(id)
    erb :edit
  end
end

post '/deleted' do
  Book.where(:id => params[:id]).delete_all
  redirect '/list'
end

post '/editted' do
  Book.find(params[:id]).update_attributes(
    :title => params[:title],
    :author => params[:author],
    :page => params[:page],
    :publish_date => params[:publish_date]
    )
  redirect '/list'
end

get '/init' do
  erb :init
end

post '/init' do
  CreateBooksTable.down
  CreateBooksTable.new.up
  erb  :inited
end

get '/retrieve_title' do
  erb :retrieve_title
end

post '/retrieve_title' do
  @result = Book.where("title = ?", params[:title]).pluck(:id, :title, :author, :page, :publish_date)[0]
  if @result == nil
    erb :noresult
  else
    erb :retrieved
  end
end

get '/retrieve_author' do
  erb :retrieve_author
end

post '/retrieve_author' do
  @result = Book.where("author = ?", params[:author]).pluck(:id, :title, :author, :page, :publish_date)[0]
  if @result == nil
    erb :noresult
  else
    erb :retrieved
  end
end

get '/noresult' do
  erb :noresult
end
