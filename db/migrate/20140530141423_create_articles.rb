class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.belongs_to :subject

      t.timestamps
    end
  end
end
