require 'active_record'
require 'date'

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
  def initBookInfos
    puts "\n0. 蔵書データベースの初期化"
    print "初期化しますか？(Y/yなら削除を実行します)："
    yesno = gets.chomp.upcase
    if /^Y$/ =~ yesno
      CreateBooksTable.down
      CreateBooksTable.new.up
      puts "\nデータベースを初期化しました。"
    else
      puts "初期化しませんでした。"
    end
  end

  def addBookInfo
    puts "\n1. 蔵書データの登録"
    print "蔵書データを登録します。"
    print "\n"
    print "タイトル: "
    title = gets.chomp
    print "著者名: "
    author = gets.chomp
    print "ページ数: "
    page = gets.chomp.to_i
    print "発刊年: "
    year = gets.chomp.to_i
    print "発刊月: "
    month = gets.chomp.to_i
    print "発刊日: "
    day = gets.chomp.to_i
    publish_date = Date.new(year, month, day)

    Book.create(
      title: "#{title}",
      author: "#{author}",
      page: page,
      publish_date: publish_date
      )
  end

  def listAllBookInfo
    puts "\n2. 蔵書データの表示"
    print "蔵書データを表示します。"
    puts "\n-----------------------"
    Book.all.each do |i|
      puts "書籍名: #{i.title}"
      puts "著者名: #{i.author}"
      puts "ページ数: #{i.page}ページ"
      puts "発刊日: #{i.publish_date}"
      puts "-----------------------"
    end
  end

  def run
    while true
      print "
  0. 蔵書データベースの初期化
  1. 蔵書データの登録
  2. 蔵書データの表示
  9. 終了
  番号を選んでください(0,1,2,9)："
      num = gets.chomp
      case
        when num == '0'
          initBookInfos
        when num == '1'
          addBookInfo
        when num == '2'
          listAllBookInfo
        when num == '9'
          puts "\n終了しました。"
          break;
        else
      end
    end
  end
end


book = Book.new
book.run
