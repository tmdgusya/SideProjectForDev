class Study < ApplicationRecord

  class << self

    def createStudy(title, content, study_period_type, study_place_type, user_id, due_date, max_people, category)
      study = Study.new
      study.title = title
      study.content = content
      study.is_delete = false
      study.study_period_type = study_period_type
      study.study_place_type = study_place_type
      study.user_id = user_id
      study.due_date = due_date.to_date
      study.max_people = max_people
      study.category_id = category
      return study.save
    end

  end

end
