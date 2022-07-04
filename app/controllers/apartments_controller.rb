class ApartmentsController < ApplicationController

  def index
    render json: Apartment.all
  end

  def show
    render json: find_apartment
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :accepted
  end

  def destroy
    apartment = find_apartment
    apartment.destroy
    head :no_content
  end

  def update
    apartment = find_apartment
    apartment.update!(apartment_params)
    render json: apartment, status: :accepted
  end

  private

  def find_apartment
    Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number)
  end

end
