class V1::TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /technologies
  def index
    @technologies = Technology.all.order("LOWER(name)")
  end

  # GET /technologies/new
  def new
    @technology = Technology.new
  end

  # GET /technologies/1/edit
  def edit
  end

  # POST /technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to v1_technologies_path
    else
      render :new
    end
  end

  # PATCH/PUT /technologies/1
  def update
    if @technology.update(technology_params)
      redirect_to v1_technologies_path
    else
      render :edit
    end
  end

  # DELETE /technologies/1
  def destroy
    @technology.destroy
    redirect_to v1_technologies_paths
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def technology_params
      params.require(:technology).permit(:name, :long_name, :link)
    end
end
