class ExposController < ApplicationController
  before_action :set_expo, only: [:show, :edit, :update, :destroy]

  # GET /expos
  # GET /expos.json
  def index1
    @expos = Expo.all
  end

  # POST /expos
  # POST /expos.json
  def create
    @expo = Expo.new(expo_params)
    respond_to do |format|
      if @expo.save
        @em = ""
        UserMailer.expo(@expo).deliver_now
        format.html { redirect_to @expo, notice: 'Expo was successfully created.' }
        format.json { render :show, status: :created, location: @expo }
        format.js
      else

        @em = ''
        @expo.errors.full_messages.map { |msg|
          if @em.length>1
            @em = @em + '\n'+ msg
          else
            @em = msg
          end
        }.join
        @em.gsub! '"', "'"

        format.html { render :new }
        format.json { render json: @expo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  rescue Exception
    respond_to do |format|
      @em = ""
     format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expo
      @expo = Expo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expo_params
     #params[:expo]
      params.require(:expo).permit(:email, :phone_number)

    end
end
