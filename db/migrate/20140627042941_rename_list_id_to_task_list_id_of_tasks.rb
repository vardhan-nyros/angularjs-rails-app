class RenameListIdToTaskListIdOfTasks < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :list_id, :task_list_id
  end
end
