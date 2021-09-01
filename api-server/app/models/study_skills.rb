class StudySkills < ActiveRecord::Base

  class << self

    def set(framework, study)
      study_skills = StudySkills.new
      study_skills.study_id = study
      study_skills.framework_id = framework
      study_skills.save
    end

  end

end