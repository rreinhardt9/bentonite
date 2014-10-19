class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
