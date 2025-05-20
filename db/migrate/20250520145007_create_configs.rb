class CreateConfigs < ActiveRecord::Migration[7.2]
  def change
    create_table :configs do |t|
      t.json :parameter

      t.timestamps
    end
  end
end
