class StudyController < ApplicationController

  api!
  param :category, Array(Numeric), :required => true
  param :onoff_type, String, :required => true, :desc => 'ONLINE | OFFLINE | ON-OFFLINE'
  param :due_date, String, :desc => '2021-10-09', :required => true
  param :period_type, String, :desc => 'ONETIME | REGULAR', :required => true
  param :title, String, :required => true
  param :description, String, :required => true
  param :skills, Array(Numeric), :desc => 'FrameWork Id Array', :required => true
  returns :code => 200 do
    "HTTP STATUS 200!"
  end
  def enroll_study

    user = @current_user

    StudyService.enroll_study(validate_study_enroll_params, user)

    render :json => {}
  end

  api!
  param :study_id, Numeric, :required => true
  param :category, Array(Numeric), :required => false
  param :onoff_type, String, :required => false , :desc => 'ONLINE | OFFLINE | ON-OFFLINE'
  param :due_date, String, :desc => '2021-10-09', :required => false
  param :period_type, String, :desc => 'ONETIME | REGULAR', :required => false
  param :title, String, :required => false
  param :description, String, :required => false
  param :skills, Array(Numeric), :desc => 'FrameWork Id Array', :required => false
  def update_study

    user = @current_user

    if params[:study_id].nil?
      raise CodeError.new(500, "삭제할 스터디를 선택해주세요")
    end

    StudyService.update_study(params[:study_id], user, params)

    render :json => {}
  end

  api!
  param :study_id, Numeric, :desc => "삭제할 study_id", :required => false
  def delete_study

    study_id = params[:study_id]

    StudyService.delete_study(study_id, @current_user)

  end

  api!
  param :page, Numeric, :desc => "page Number"
  param :limit, Numeric, :desc => "post size per page"
  param :category, String, :desc => "검색할 카테고리"
  param :framework, String, :desc => "프레임워크"
  def get_study


  end

  private def validate_study_enroll_params
    params.require(:category)
    params.require(:onoff_type)
    params.require(:due_date)
    params.require(:max_people)
    params.require(:period_type)
    params.require(:title)
    params.require(:description)
    params.require(:skills)
    params
  end



end