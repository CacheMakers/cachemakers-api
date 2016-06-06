class GroupSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.adapter = :json
  attributes(
    :id,
    :title,
    :description,
    :location,
    :time,
    :leader_name,
    :leader_email,
    :age_cloverbud,
    :age_intermediate,
    :age_junior,
    :age_senior
  )

end
