class Mission < ApplicationRecord
    validates :name, presence: true
    # validate :scientist_dublicate
    belongs_to :planet
    belongs_to :scientist

    # def scientist_dublicate
    #     Mission.all.map{ |mission| 
    #     if name == mission.name
    #         if mission.scientist_id == scientist_id
    #             errors.add(:scientist_id, "Not allowed for a scientist to join the same mission twice")
    #         end
    #     end
    }
    end
end