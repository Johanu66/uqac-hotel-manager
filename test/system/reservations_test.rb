require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Chambre", with: @reservation.chambre_id
    fill_in "Date arrivee", with: @reservation.date_arrivee
    fill_in "Date creation", with: @reservation.date_creation
    fill_in "Date depart", with: @reservation.date_depart
    fill_in "Prix total", with: @reservation.prix_total
    fill_in "Statut", with: @reservation.statut
    fill_in "Type chambre", with: @reservation.type_chambre_id
    fill_in "User", with: @reservation.user_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Chambre", with: @reservation.chambre_id
    fill_in "Date arrivee", with: @reservation.date_arrivee
    fill_in "Date creation", with: @reservation.date_creation.to_s
    fill_in "Date depart", with: @reservation.date_depart
    fill_in "Prix total", with: @reservation.prix_total
    fill_in "Statut", with: @reservation.statut
    fill_in "Type chambre", with: @reservation.type_chambre_id
    fill_in "User", with: @reservation.user_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
