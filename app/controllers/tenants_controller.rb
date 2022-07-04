class TenantsController < ApplicationController

  def index
    render json: Tenant.all
  end

  def show
    render json: find_tenant
  end

  def create
    tenant = Tenant.create!(tenant_params)
    render json: tenant, status: :accepted
  end

  def destroy
    tenant = find_tenant
    tenant.destroy
    head :no_content
  end

  def update
    tenant = find_tenant
    tenant.update!(tenant_params)
    render json: tenant, status: :accepted
  end

  private

  def find_tenant
    Tenant.find(params[:id])
  end

  def tenant_params
    params.permit(:name, :age)
  end

end
