module Mutations
  class Users::CreateUser < BaseMutation
    description 'Creates a User'

    argument :name, String, required: true
    argument :netid, String, required: true

    type Types::UserType

    def resolve(name: nil, netid: nil)
      User.create!( name: name, netid: netid)
    end
  end
end
