class TypeChambresController < ApplicationController
  before_action :set_type_chambre, only: %i[ show edit update destroy ]

  # GET /type_chambres or /type_chambres.json
  def index
    @type_chambres = TypeChambre.all
  end

  # GET /type_chambres/1 or /type_chambres/1.json
  def show
  end

  # GET /type_chambres/new
  def new
    @type_chambre = TypeChambre.new
  end

  # GET /type_chambres/1/edit
  def edit
  end

  # POST /type_chambres or /type_chambres.json
  def create
    @type_chambre = TypeChambre.new(type_chambre_params)

    respond_to do |format|
      if @type_chambre.save
        format.html { redirect_to @type_chambre, notice: "Type chambre was successfully created." }
        format.json { render :show, status: :created, location: @type_chambre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_chambre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_chambres/1 or /type_chambres/1.json
  def update
    respond_to do |format|
      if @type_chambre.update(type_chambre_params)
        format.html { redirect_to @type_chambre, notice: "Type chambre was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @type_chambre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_chambre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_chambres/1 or /type_chambres/1.json
  def destroy
    @type_chambre.destroy!

    respond_to do |format|
      format.html { redirect_to type_chambres_path, notice: "Type chambre was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_chambre
      @type_chambre = TypeChambre.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def type_chambre_params
      params.expect(type_chambre: [ :nom, :description, :prix_par_nuit, :capacite, :nombre_total ])
    end
end
