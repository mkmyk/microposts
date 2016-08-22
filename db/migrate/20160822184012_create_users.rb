class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false

      t.index :email, unique: true #indexは検索しやすいよう並べ替えてくれる。重複がなく、検索頻繁なカラムに適す。
    end
  end
end
