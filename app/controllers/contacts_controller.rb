class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    render :show_form
  end

  def create
    @contact = Contact.create(contact_params)
    save_contact
  end

  def edit
    @contact = Contact.find(params[:id])
    render :show_form
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(contact_params)
    save_contact
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    @contacts = Contact.all
  end
  
  private
  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :number)
  end

  def save_contact
    if @contact.save
      @contacts = Contact.all
      render :hide_form
    else
      render :show_form
    end
  end
end
