class RemoveRecruitingUserIdFromBandRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :band_requests, :recruiting_user_id, :bigint
  end
end
