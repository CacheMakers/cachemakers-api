class GroupSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.adapter = :json
  attributes(
    :id,
    :title,
    :description,
    :location,
    :time,
    :age_cloverbud,
    :age_intermediate,
    :age_junior,
    :age_senior,
    :approved
  )

  has_one :user

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email
  end

end
