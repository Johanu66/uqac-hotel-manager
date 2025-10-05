class ChambresController < ApplicationController
  before_action :set_chambre, only: %i[ show edit update destroy ]

  # GET /chambres or /chambres.json
  def index
    @chambres = Chambre.all
  end

  # GET /chambres/1 or /chambres/1.json
  def show
  end

  # GET /chambres/new
  def new
    @chambre = Chambre.new
  end

  # GET /chambres/1/edit
  def edit
  end

  # POST /chambres or /chambres.json
  def create
    @chambre = Chambre.new(chambre_params)

    respond_to do |format|
      if @chambre.save
        format.html { redirect_to @chambre, notice: "Chambre was successfully created." }
        format.json { render :show, status: :created, location: @chambre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chambre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chambres/1 or /chambres/1.json
  def update
    respond_to do |format|
      if @chambre.update(chambre_params)
        format.html { redirect_to @chambre, notice: "Chambre was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @chambre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chambre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chambres/1 or /chambres/1.json
  def destroy
    @chambre.destroy!

    respond_to do |format|
      format.html { redirect_to chambres_path, notice: "Chambre was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chambre
      @chambre = Chambre.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def chambre_params
      params.expect(chambre: [ :numero, :type_chambre_id, :statut, :description ])
    end
end
