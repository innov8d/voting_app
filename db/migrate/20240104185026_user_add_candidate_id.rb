class UserAddCandidateId < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.integer :candidate_id
    end
  end
end
