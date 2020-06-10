class AddPortToScale < ActiveRecord::Migration[5.2]
  def change
    add_reference :scales, :port, foreign_key: true
  end
end
