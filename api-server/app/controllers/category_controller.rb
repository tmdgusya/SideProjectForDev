class CategoryController < ApplicationController

  api!
  param :name, String, :desc => "Category Name"
  def enroll_category

    category_name = params[:name]

    raise CodeError.new(500, "카테고리 이름을 입력해주세요") if category_name.nil?

    Category.create(:name => category_name)

    render :json =>  {}
  end

end