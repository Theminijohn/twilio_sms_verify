class RegistrationsController < Devise::RegistrationsController

  def create
    super # This calls Devise::RegistrationsController#create
  end

end