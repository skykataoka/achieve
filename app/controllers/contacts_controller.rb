class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  def create
    @contact = Contact.new(contact_params)
     if @contact.save
       redirect_to root_path,  notice: "お問い合わせ承りました"
     
     else
       render 'new'
     end
    
    
    # Contact.create(contact_params)
    # redirect_to new_contact_path, notice: "お問い合わせ承りました"
    
  end
  
  private
  def contact_params
    params.require(:contact).permit(:title, :email, :content)
  end
  
end
