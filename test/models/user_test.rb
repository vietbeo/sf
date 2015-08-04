require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(user_name: "vietlh", email: "vietlh@fsoft.com.vn",
          password: "foobar", password_confirmation: "foobar")
  end
  
  test "should user valid" do
    assert @user.valid?
  end
  
  test "should set corrent user name" do
    assert_equal("vietlh",@user.user_name)
  end

  test "should set corrent email" do
    assert_equal("vietlh@fsoft.com.vn",@user.email)
  end

  test "should user_name format correct" do
    @user1 = User.new(user_name: "contain space", email: "a@bc.com",
    password: "foobar", password_confirmation: "foobar")
    assert_not @user1.valid?
  end

  test "should user_name unique" do
    @duplicate_user = User.new(user_name: "vietlh", email: "d@ef.com",
    password: "foobar", password_confirmation: "foobar")
    @user.save
    @duplicate_user.save
    p 'user name : ' + @duplicate_user.user_name
    assert_not @duplicate_user.valid?
  end

  test "should user_name unique with case sensitive" do
    @duplicate_user = User.new(user_name: "VIETLH", email: "d@ef.com",
    password: "foobar", password_confirmation: "foobar")
    @user.save
    @duplicate_user.save
    assert_not @duplicate_user.valid?
  end

  test "should email unique with case sensitive" do
    @duplicate_user = User.new(user_name: "VIETLH", email: "VIETLH@FSOFT.COM.VN",
    password: "foobar", password_confirmation: "foobar")
    @user.save
    @duplicate_user.save
    assert_not @duplicate_user.valid?
  end

  test "should incorrect email format fail" do
    @u1 = User.new user_name: "test_email", email: "hell @d.c", 
    password: "foobar", password_confirmation: "foobar"
    assert_not @u1.valid?
  end
  
  test "should email has corrent for mat pass" do
    @u1 = User.new user_name: "test_email", email: "21hell12@d21.co",
    password: "foobar", password_confirmation: "foobar"
    assert @u1.valid?
  end
  
  test "email and password should presence" do
    @u1 = User.new user_name:"", email: ""
    @u1.save
    assert_not @u1.valid?
  end

  #============== Test Password =====================
  test "password should be present (non-blank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
