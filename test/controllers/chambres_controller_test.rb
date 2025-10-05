require "test_helper"

class ChambresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chambre = chambres(:one)
  end

  test "should get index" do
    get chambres_url
    assert_response :success
  end

  test "should get new" do
    get new_chambre_url
    assert_response :success
  end

  test "should create chambre" do
    assert_difference("Chambre.count") do
      post chambres_url, params: { chambre: { description: @chambre.description, numero: @chambre.numero, statut: @chambre.statut, type_chambre_id: @chambre.type_chambre_id } }
    end

    assert_redirected_to chambre_url(Chambre.last)
  end

  test "should show chambre" do
    get chambre_url(@chambre)
    assert_response :success
  end

  test "should get edit" do
    get edit_chambre_url(@chambre)
    assert_response :success
  end

  test "should update chambre" do
    patch chambre_url(@chambre), params: { chambre: { description: @chambre.description, numero: @chambre.numero, statut: @chambre.statut, type_chambre_id: @chambre.type_chambre_id } }
    assert_redirected_to chambre_url(@chambre)
  end

  test "should destroy chambre" do
    assert_difference("Chambre.count", -1) do
      delete chambre_url(@chambre)
    end

    assert_redirected_to chambres_url
  end
end
