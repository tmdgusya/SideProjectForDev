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

  end

end