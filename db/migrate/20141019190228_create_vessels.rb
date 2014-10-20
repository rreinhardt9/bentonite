class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :name
      t.float :capacity
      t.boolean :active
      t.belongs_to :winery, index: true

      t.timestamps
    end
  end
end
