class PostPolicy < ApplicationPolicy

def index?
    true
end

def create?
     can_moderate?(user, record) 
    end

def destroy?
    can_moderate?(user, record)
end

end
