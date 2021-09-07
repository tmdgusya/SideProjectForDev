class StudySkills < ActiveRecord::Base

  scope :from, -> (study_id) { where("study_id = ?", study_id) }

  class << self

    def set(framework, study)
      study_skills = StudySkills.new
      study_skills.study_id = study
      study_skills.framework_id = framework
      study_skills.save
    end

  end

end