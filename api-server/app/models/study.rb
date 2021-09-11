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

  def update_study(title = nil, content = nil, study_period_type = nil, study_place_type = nil, due_date = nil, max_people = nil, category = nil)
    self.title = title if title.present?
    self.content = content if content.present?
    self.study_period_type = study_period_type if study_period_type.present?
    self.study_place_type = study_place_type if study_place_type.present?
    self.due_date = due_date.to_date if due_date.present?
    self.max_people  = max_people if max_people.present?
    self.category = category if category.present?
  end

  def is_author?(user)
    self.user_id == user.id
  end

end
