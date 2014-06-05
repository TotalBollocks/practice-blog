class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
    	t.text :content
    	t.belongs_to :article

      t.timestamps
    end
  end
end
