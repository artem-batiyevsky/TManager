require 'rails_helper'

RSpec.describe "TManagers", type: :request do
  describe "GET /tasks" do
    it "show some" do
      visit tasks_path
      page.should have_content 'have a sleep'
    end
  end
end
