class CreatePresents < ActiveRecord::Migration[6.1]
  def change
    create_table :presents do |t|

      t.string :title
      t.string :category
      
      t.timestamps
    end
  end
end
