class Devise::ConfirmationsController < DeviseController
  # GET /resource/confirmation/new
  def new
    self.resource = resource_class.new
  end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    sec = 1

    count = User.active.count
    if count < C_MAX_SEC
      if self.resource.sector.nil?
        self.resource.sector = self.resource.get_sector_id
        self.resource.unique_key = (0...5).map { (65 + rand(26)).chr }.join + '-' +self.resource.sector.to_s
        sec = 2
      end
    end

    self.resource.save

    if resource.errors.empty?


    if !resource.sector.nil?
      if sec == 2
        UserMailer.after_reg(resource).deliver_now
      end
    #else
      #UserMailer.no_sector(resource).deliver_now
    end


      set_flash_message(:notice, :confirmed) if is_flashing_format?
      #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      redirect_to show_sector_path(sector:resource.sector, unique_key:resource.unique_key)

    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      is_navigational_format? ? new_session_path(resource_name) : '/'
    end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        #new_session_path(resource_name)
        redirect_to show_sector_path(sector:resource.sector, unique_key:resource.unique_key)
      end
    end

    def translation_scope
      'devise.confirmations'
    end
end
