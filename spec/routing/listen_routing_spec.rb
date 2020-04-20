require "rails_helper"

RSpec.describe ListenController, type: :routing do
  describe "routing" do
    it "routes to #listen" do
      expect(post: "/listen").to route_to("listen#listen")
    end
  end
end
