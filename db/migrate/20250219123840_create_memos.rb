class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.text :content, null: false
      t.timestamps
    end
  end
end
