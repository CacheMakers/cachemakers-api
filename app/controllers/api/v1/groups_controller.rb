class Api::V1::GroupsController < ApplicationController
  respond_to :json
  def show
    render json: Group.find(params[:id])
  end

  def create
    group = Group.new(group_params)

    if group.save
      render json: group, status: 201, location: [:api, group]
    else
      render json: { errors: group.errors }, status: 422
    end

  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      render json: group, status:200, location: [:api, group]
    else
      render json: {errors: group.errors}, status: 422
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    head 204
  end

  private

  def group_params
    params.require(:group).permit(
      :title,
      :description,
      :location,
      :time,
      :weekday,
      :leader_name,
      :leader_email,
      :age_cloverbud,
      :age_intermediate,
      :age_junior,
      :age_senior
    )
  end

end
