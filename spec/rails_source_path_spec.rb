RSpec.describe RailsSourcePath do
  it "has a version number" do
    expect(RailsSourcePath::VERSION).not_to be nil
  end
end

class RailsSourcePathsController < ActionController::Base
  include RailsSourcePath
  rails_source_path_entry_actions :entry

  def entry; end
end

RSpec.describe RailsSourcePathsController, type: :controller do
  before do
    class MyApplication < Rails::Application; end
    MyApplication.routes.draw do
      root to: 'rails_source_paths#root'
      match '/entry' => 'rails_source_paths#entry', via: :get
      match '/leave' => 'rails_source_paths#leave', via: :get
    end
  end

  it 'calls before_action' do
    # get :entry
    # expect(controller).to receive(:set_rails_source_path)
  end
end
