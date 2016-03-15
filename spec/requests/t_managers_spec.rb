require 'rails_helper'

RSpec.describe "TManagers", type: :request do
  describe "GET /tasks" do
    before do
      @task = Task.create   :task => 'have a sleep'
    end
    it "show some" do
            visit tasks_path
      page.should have_content 'have a sleep'
    end

    it "crates a new task" do
      visit tasks_path
      fill_in "Task", :with => 'go to work'
      click_button 'Create Task'
      current_path.should == tasks_path
      page.should have_content 'go to work'
      save_and_open_page
    end
  end

  describe "PUT /tasks" do
    it "edit a task" do
      visit tasks_path
      click_link 'Edit'
      current_path.should == edit_task_path(@task)
      page.should have_content 'have a sleep'
      fill_in 'Task', :with => 'updated task'
      click_button 'Updated task'
      page.should have_content 'updated task'
    end

  end
end
