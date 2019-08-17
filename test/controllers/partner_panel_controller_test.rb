require 'test_helper'

class PartnerPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_panel_index_url
    assert_response :success
  end

end
