class FrameWorkController < ApplicationController

  def enroll_framework

    name = params[:name]
    img_url = params[:img_url]
    type = params[:type]

    raise CodeError.new(500, "프레임워크 이름을 입력해주세요") if name.nil?
    raise CodeError.new(500, "ImgUrl 을 입력해주세요") if img_url.nil?
    raise CodeError.new(500, "프레임워크 타입을 입력해주세요") if type.nil?

    FrameWorkService.enroll_framework(name, img_url, type)

    render :json => {}
  end

end