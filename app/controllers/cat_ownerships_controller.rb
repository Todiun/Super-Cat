class CatOwnershipsController < ApplicationController
  before_action :set_cat_ownership, only: %i[ show edit update destroy ]

  # GET /cat_ownerships or /cat_ownerships.json
  def index
    @cat_ownerships = CatOwnership.all
  end

  # GET /cat_ownerships/1 or /cat_ownerships/1.json
  def show
  end

  # GET /cat_ownerships/new
  def new
    @cat_ownership = CatOwnership.new
  end

  # GET /cat_ownerships/1/edit
  def edit
  end

  # POST /cat_ownerships or /cat_ownerships.json
  def create
    @cat_ownership = CatOwnership.new(cat_ownership_params)

    respond_to do |format|
      if @cat_ownership.save
        format.html { redirect_to @cat_ownership, notice: "Cat ownership was successfully created." }
        format.json { render :show, status: :created, location: @cat_ownership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_ownerships/1 or /cat_ownerships/1.json
  def update
    respond_to do |format|
      if @cat_ownership.update(cat_ownership_params)
        format.html { redirect_to @cat_ownership, notice: "Cat ownership was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cat_ownership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_ownerships/1 or /cat_ownerships/1.json
  def destroy
    @cat_ownership.destroy!

    respond_to do |format|
      format.html { redirect_to cat_ownerships_path, notice: "Cat ownership was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_ownership
      @cat_ownership = CatOwnership.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cat_ownership_params
      params.fetch(:cat_ownership, {})
    end
end
