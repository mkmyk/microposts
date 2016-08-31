class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      
      # foreign_ken: usersテーブルに存在するidのみuser_idに入る。
      t.references :user, index: true, foreign_key: true
      
      t.text :content

      t.timestamps null: false
      
      # 投稿を指定ユーザーで絞り込んだ後、作成時間で検索や並び替えを行う複合インデックス
      t.index [:user_id, :created_at]
    end
  end
end
