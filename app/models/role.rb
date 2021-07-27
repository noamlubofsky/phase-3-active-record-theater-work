class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        self.where(auditions.hired = true).first
        OR 'no actor has been hired for this role'
    end

    def understudy
        self.where(auditions.hired = true).second
        OR 'no actor has been hired for understudy for this role'
    end
end