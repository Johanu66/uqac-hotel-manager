# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "py-16 md:py-32 text-center m-auto max-w-3xl" do
      div class: "mt-10 grid grid-cols-1 md:grid-cols-3 gap-6" do
        panel "Nombre de chambres", class: "bg-white dark:bg-gray-800 rounded-lg shadow p-6" do
          h3 Chambre.count, class: "text-3xl font-bold text-indigo-600 dark:text-indigo-400"
        end
        panel "Nombre de réservations", class: "bg-white dark:bg-gray-800 rounded-lg shadow p-6" do
          h3 Reservation.count, class: "text-3xl font-bold text-indigo-600 dark:text-indigo-400"
        end
        panel "Nombre de clients", class: "bg-white dark:bg-gray-800 rounded-lg shadow p-6" do
          h3 User.count, class: "text-3xl font-bold text-indigo-600 dark:text-indigo-400"
        end
        panel "Nombre de personnel de l'hôtel", class: "bg-white dark:bg-gray-800 rounded-lg shadow p-6" do
          h3 AdminUser.count, class: "text-3xl font-bold text-indigo-600 dark:text-indigo-400"
        end
      end
    end
  end
end
