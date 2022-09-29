class SpicesController < ApplicationController
  wrap_parameters format: []


  # GET /spices
  def index
    spices =  Spice.all
    render json: spices
  end

# POST /spices
  def create
    spices =  Spice.create(spice_params)
    render json: spices, status: :created
  end

   # GET /spices/:id
  def show
    spice =  Spice.find_by(id: params[:id])
    if spice
      render json: spice, status: :ok
    else
      not_found
    end
  end

   # UPDATE /spices/:id
  def update
    spice =  Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice, status: :accepted
    else
      not_found
    end
  end

   # DELETE /spices/:id
   def destroy
    spice =  Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      not_found
    end
  end

    private
    def not_found
      render json: {Error: 'spice missing!'}, status: :not_found
    end

    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
end
