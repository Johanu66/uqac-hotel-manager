require "application_system_test_case"

class TypeChambresTest < ApplicationSystemTestCase
  setup do
    @type_chambre = type_chambres(:one)
  end

  test "visiting the index" do
    visit type_chambres_url
    assert_selector "h1", text: "Type chambres"
  end

  test "should create type chambre" do
    visit type_chambres_url
    click_on "New type chambre"

    fill_in "Capacite", with: @type_chambre.capacite
    fill_in "Description", with: @type_chambre.description
    fill_in "Nom", with: @type_chambre.nom
    fill_in "Nombre total", with: @type_chambre.nombre_total
    fill_in "Prix par nuit", with: @type_chambre.prix_par_nuit
    click_on "Create Type chambre"

    assert_text "Type chambre was successfully created"
    click_on "Back"
  end

  test "should update Type chambre" do
    visit type_chambre_url(@type_chambre)
    click_on "Edit this type chambre", match: :first

    fill_in "Capacite", with: @type_chambre.capacite
    fill_in "Description", with: @type_chambre.description
    fill_in "Nom", with: @type_chambre.nom
    fill_in "Nombre total", with: @type_chambre.nombre_total
    fill_in "Prix par nuit", with: @type_chambre.prix_par_nuit
    click_on "Update Type chambre"

    assert_text "Type chambre was successfully updated"
    click_on "Back"
  end

  test "should destroy Type chambre" do
    visit type_chambre_url(@type_chambre)
    click_on "Destroy this type chambre", match: :first

    assert_text "Type chambre was successfully destroyed"
  end
end
