class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    admin_root_path
  end

  def build_resource(hash=nil)
    super
    if resource.role=='designer'
	    resource.role = 'designer'
	    resource.build_designer(params[:designer])
    else
	    resource.role = 'comprador'
	    resource.build_comprador(params[:comprador])
	end
  end
end

