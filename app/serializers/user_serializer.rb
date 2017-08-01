class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :lists

  def full_name
    object.name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
