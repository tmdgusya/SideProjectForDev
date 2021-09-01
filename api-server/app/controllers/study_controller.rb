class StudyController < ApplicationController

  api!
  param :category, Array(Numeric), :required => true
  param :onoff_type, String, :required => true, :desc => 'ONLINE | OFFLINE | ON-OFFLINE'
  param :due_date, String, :desc => '2021-10-09'
  param :period_type, String, :desc => 'ONETIME | REGULAR'
  param :title, String
  param :description, String
  param :skills, Array(Numeric), :desc => 'FrameWork Id Array'
  returns :code => 200 do
    "HTTP STATUS 200!"
  end
  def enroll_study

    validate_enroll_study(params)

    user = @current_user

    StudyService.enroll_study(params, user)

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

    # user = @current_user

    if params[:study_id].nil?
      raise CodeError.new(500, "삭제할 스터디를 선택해주세요")
    end

    StudyService.update_study(params[:study_id], user, params)

    render :json => {

    }
  end

  api!
  param :study_id, Numeric, :desc => "삭제할 study_id"
  def delete_study

    study_id = params[:study_id]

    StudyService.delete_study(study_id)

  end

  private def validate_enroll_study(request)
    if request[:category].nil?
      raise CodeError.new(500, "카테고리를 입력해주세요")
    end

    if request[:onoff_type].nil?
      raise CodeError.new(500, "스터디 장소를 선택해주세요")
    end

    if request[:due_date].nil?
      raise CodeError.new(500, "스터이 예상 마감일을 선택해주세요")
    end

    if request[:max_people].nil?
      raise CodeError.new(500, "최대 인원을 설정해주세요")
    end

    if request[:period_type].nil?
      raise CodeError.new(500, "단기형인지 정기형인지 골라주세요")
    end

    if request[:title].nil?
      raise CodeError.new(500, "스터디 제목을 입력해주세요")
    end

    if request[:description].nil?
      raise CodeError.new(500, "본문을 입력해주세요")
    end

    if request[:skills].nil?
      raise CodeError.new(500, "스터디 기술스택을 선정해주세요")
    end
  end

end