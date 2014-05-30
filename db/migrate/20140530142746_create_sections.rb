class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
    	t.text :content
    	t.belongs_to :articles

      t.timestamps
    end
  end
end
