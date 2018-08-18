class Api::V2::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts, status: 200
  end

  # GET /contacts/1
  def show
    begin
      contact = Contact.find(params[:id])
      render json: contact, status: 200
    rescue
      render json: { errors: contact.errors }, status: 422
    end
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: 201
    else
      render json: { errors: @contact.errors }, status: 422
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, status: 200
    else
      render json: { errors: @contact.errors }, status: 422
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit(:name, :last_name, :email, :age, :phone, :address, :state, :city)
  end
end
