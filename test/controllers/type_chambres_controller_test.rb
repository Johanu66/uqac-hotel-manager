require "test_helper"

class TypeChambresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_chambre = type_chambres(:one)
  end

  test "should get index" do
    get type_chambres_url
    assert_response :success
  end

  test "should get new" do
    get new_type_chambre_url
    assert_response :success
  end

  test "should create type_chambre" do
    assert_difference("TypeChambre.count") do
      post type_chambres_url, params: { type_chambre: { capacite: @type_chambre.capacite, description: @type_chambre.description, nom: @type_chambre.nom, nombre_total: @type_chambre.nombre_total, prix_par_nuit: @type_chambre.prix_par_nuit } }
    end

    assert_redirected_to type_chambre_url(TypeChambre.last)
  end

  test "should show type_chambre" do
    get type_chambre_url(@type_chambre)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_chambre_url(@type_chambre)
    assert_response :success
  end

  test "should update type_chambre" do
    patch type_chambre_url(@type_chambre), params: { type_chambre: { capacite: @type_chambre.capacite, description: @type_chambre.description, nom: @type_chambre.nom, nombre_total: @type_chambre.nombre_total, prix_par_nuit: @type_chambre.prix_par_nuit } }
    assert_redirected_to type_chambre_url(@type_chambre)
  end

  test "should destroy type_chambre" do
    assert_difference("TypeChambre.count", -1) do
      delete type_chambre_url(@type_chambre)
    end

    assert_redirected_to type_chambres_url
  end
end
