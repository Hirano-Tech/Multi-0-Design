require "rails_helper"

RSpec.describe InfluencersController, type: :controller do
  describe "GET #index" do
    it "Index アクションを表示する。" do
      expect(get :index).to render_template(:index)
    end
  end
end
