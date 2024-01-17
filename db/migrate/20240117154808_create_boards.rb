class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false, limit: 64
      t.string :author_email, null: false, index: true, limit: 254
      t.jsonb :layout, null: false, default: []
      t.text :layout_html, null: false, default: ""

      t.timestamps
    end
  end
end
