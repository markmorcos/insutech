class AddSurfaceFinishToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :surface_finish, :string
  end
end
