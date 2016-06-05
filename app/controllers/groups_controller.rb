class GroupsController < ApplicationController

  def index
    @groups = Group.paginate(:page => params[:page], :per_page => 20)
    render :json => @groups, meta: pagination_dict(@groups)
  end

  def create
    group = Group.new(group_params)
    group.tags |= get_tags
    group.approved = false
    group.save

    message = "Successfully Updated"
    message = group.errors.messages unless group.errors.messages.empty?
    render :json => group, meta: message
  end

  def show
    render :json => Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    new_params = group_params
    new_params.keys.each do |k|
      group[k] = new_params[k]
    end
    group.tags |= get_tags
    group.save

    message = "Successfully Updated"
    message = group.errors.messages unless group.errors.messages.empty?
    render :json => group, meta:message
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy

    message = "Successfully Removed"
    message = group.errors.messages unless group.errors.messages.empty?
    render :json => group, meta: message
  end

 def group_params
    params.require(:group).permit(
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

  def group_tags
    params.require(:group).permit(:tags => [])
  end

  def get_tags
    tags = []
    group_tags[:tags].each do |t|
      tags << Tag.create(name:t)
    end
    tags
  end


  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.previous_page,
      total_pages: object.total_pages,
      total_count: object.total_entries
    }
  end

end
