class ChangeRatingToFloatInMovies < ActiveRecord::Migration[7.0]
  def change
    change_table :movies do |t|
      t.change :rating, :float
    end
  end
end
