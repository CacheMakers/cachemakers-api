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

  has_many :tags

  class TagSerializer < ActiveModel::Serializer
      attributes :name
      belongs_to :group_id
  end

end
