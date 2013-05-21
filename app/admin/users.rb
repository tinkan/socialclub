ActiveAdmin.register User do

form do |f|
  f.inputs do
    f.input :email
    f.input :password
    f.input :password_confirmation
	f.input :sold
	f.input :seller
  end
  f.buttons
end
   
end
