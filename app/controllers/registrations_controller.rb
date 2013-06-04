class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    admin_root_path
  end

  def build_resource(hash=nil)
    super
    resource.role = 'designer'
    resource.build_designer(params[:designer])
  end
end

