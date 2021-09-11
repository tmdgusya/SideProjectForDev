class StudyService

  class << self

    def enroll_study(study_info, user)
      category = study_info[:category]
      onoff_type = study_info[:onoff_type]
      due_date = study_info[:due_date]
      max_people = study_info[:max_people]
      period_type = study_info[period_type]
      title = study_info[:title]
      description = study_info[:description]
      skills = study_info[:skills]

      new_study = Study.createStudy(title, description, period_type, onoff_type, user.id, due_date, max_people, category)

      skills.each do |skill|
        StudySkills.set(skill, new_study.id)
      end
    end


    def update_study(study_id, user, update_study_info)
      study = Study.find_by_id(study_id)

      raise CodeError.new(500, "수정할 스터디가 존재하지 않습니다. 새로고침을 해보세요!")  if study.nil? and study.user_id != user.id

      study.update_study(update_study_info[:title], update_study_info[:description],
                         update_study_info[:period_type], update_study_info[:onoff_type],
                         update_study_info[:due_date], update_study_info[:max_people],
                         update_study_info[:category])

      study.save
    end


    def delete_study(study_id, user)

      study = Study.find_by_id(study_id)

      raise CodeError.new(500, "스터디를 찾을 수 없습니다.") if study.nil?
      raise CodeError.new(500, "작성자만 삭제 가능합니다.") if study.is_author?(user)

      study_skills = StudySkills.from(study_id)

      begin
        study_skills.each do |study_skill|
          study_skill.destroy
        end
      rescue

      end

      study.destroy

    end

  end

end