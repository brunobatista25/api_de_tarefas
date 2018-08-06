require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { address: @contact.address, age: @contact.age, city: @contact.city, email: @contact.email, last_name: @contact.last_name, name: @contact.name, phone: @contact.phone, state: @contact.state } }, as: :json
    end

    assert_response 201
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address: @contact.address, age: @contact.age, city: @contact.city, email: @contact.email, last_name: @contact.last_name, name: @contact.name, phone: @contact.phone, state: @contact.state } }, as: :json
    assert_response 200
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response 204
  end
end
