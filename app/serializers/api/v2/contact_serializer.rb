class Api::V2::ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :age, :phone, :address, :state, :city
end
