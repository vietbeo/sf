require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test "email split successfully" do
    @e = "vietlh@fsoft.com.vn"
    account = extract_username @e
    assert_equal "vietlh", account    
  end
  
  test "email split not successfully" do
    @e = "vietlh@fsoft.com.vn"
    account = extract_username @e
    assert_not_equal "vietlh1", account    
  end
  
end
