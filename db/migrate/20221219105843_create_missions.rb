class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string "name"
      t.belongs_to :scientist, foreign_key: true
      t.belongs_to :planet, foreign_key: true
      
      t.timestamps
    end
  end
end
