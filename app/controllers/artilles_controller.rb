class ArtillesController < ApplicationController
  before_action :set_artille, only: %i[ show edit update destroy ]

  # GET /artilles or /artilles.json
  def index
    @artilles = Artille.all
  end

  # GET /artilles/1 or /artilles/1.json
  def show
  end

  # GET /artilles/new
  def new
    @artille = Artille.new
  end

  # GET /artilles/1/edit
  def edit
  end

  # POST /artilles or /artilles.json
  def create
    @artille = Artille.new(artille_params) 
    @artille.user = User.find_by(name: artille_params["user_id"])

    respond_to do |format|
      if @artille.save
        format.html { redirect_to artille_url(@artille), notice: "Artille was successfully created." }
        format.json { render :show, status: :created, location: @artille }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artille.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artilles/1 or /artilles/1.json
  def update
    respond_to do |format|
      if @artille.update(artille_params)
        format.html { redirect_to artille_url(@artille), notice: "Artille was successfully updated." }
        format.json { render :show, status: :ok, location: @artille }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artille.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artilles/1 or /artilles/1.json
  def destroy
    @artille.destroy

    respond_to do |format|
      format.html { redirect_to artilles_url, notice: "Artille was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artille
      @artille = Artille.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artille_params
      params.require(:artille).permit(:name, :text, :user_id)
    end
end
