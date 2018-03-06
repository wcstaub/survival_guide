class ResourcesSubjects < ActiveRecord::Migration[5.1]
  def change
		create_table :resources_subjects, :id => false do |t|
	  t.integer :resource_id
	  t.integer :subject_id
   	end
  end
end
