class AddProjectimageToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :projectimage, :string
  end
end
