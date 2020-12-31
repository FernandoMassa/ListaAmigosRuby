class AmigosController < ApplicationController
  before_action :set_amigo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /amigos
  # GET /amigos.json
  def index
    @amigos = Amigo.all
  end

  # GET /amigos/1
  # GET /amigos/1.json
  def show
  end

  # GET /amigos/new
  def new
    #@amigo = Amigo.new
    @amigo = current_user.amigos.build
  end

  # GET /amigos/1/edit
  def edit
  end

  # POST /amigos
  # POST /amigos.json
  def create
    #@amigo = Amigo.new(amigo_params)
    @amigo = current_user.amigos.build(amigo_params)

    respond_to do |format|
      if @amigo.save
        format.html { redirect_to @amigo, notice: 'Amigo was successfully created.' }
        format.json { render :show, status: :created, location: @amigo }
      else
        format.html { render :new }
        format.json { render json: @amigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amigos/1
  # PATCH/PUT /amigos/1.json
  def update
    respond_to do |format|
      if @amigo.update(amigo_params)
        format.html { redirect_to @amigo, notice: 'Amigo was successfully updated.' }
        format.json { render :show, status: :ok, location: @amigo }
      else
        format.html { render :edit }
        format.json { render json: @amigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amigos/1
  # DELETE /amigos/1.json
  def destroy
    @amigo.destroy
    respond_to do |format|
      format.html { redirect_to amigos_url, notice: 'Amigo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @amigo = current_user.amigos.find_by(id: params[:id])
    redirect_to amigos_path, notice: "Não autorizado a editar este amigo" if @amigo.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amigo
      @amigo = Amigo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def amigo_params
      params.require(:amigo).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
