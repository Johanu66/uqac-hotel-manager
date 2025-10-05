require "application_system_test_case"

class ChambresTest < ApplicationSystemTestCase
  setup do
    @chambre = chambres(:one)
  end

  test "visiting the index" do
    visit chambres_url
    assert_selector "h1", text: "Chambres"
  end

  test "should create chambre" do
    visit chambres_url
    click_on "New chambre"

    fill_in "Description", with: @chambre.description
    fill_in "Numero", with: @chambre.numero
    fill_in "Statut", with: @chambre.statut
    fill_in "Type chambre", with: @chambre.type_chambre_id
    click_on "Create Chambre"

    assert_text "Chambre was successfully created"
    click_on "Back"
  end

  test "should update Chambre" do
    visit chambre_url(@chambre)
    click_on "Edit this chambre", match: :first

    fill_in "Description", with: @chambre.description
    fill_in "Numero", with: @chambre.numero
    fill_in "Statut", with: @chambre.statut
    fill_in "Type chambre", with: @chambre.type_chambre_id
    click_on "Update Chambre"

    assert_text "Chambre was successfully updated"
    click_on "Back"
  end

  test "should destroy Chambre" do
    visit chambre_url(@chambre)
    click_on "Destroy this chambre", match: :first

    assert_text "Chambre was successfully destroyed"
  end
end
