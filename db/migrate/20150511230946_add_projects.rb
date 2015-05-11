class AddProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |p|
      p.column(:name, :string)
      p.column(:done, :boolean)
      p.timestamps()
    end
    create_table :employees_projects, id: false do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
    end
  end
end
