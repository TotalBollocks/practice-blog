class Permission
  
  def initialize(user)
    permit :welcome, :index
    permit :articles, :show
    permit :sessions, [:new, :create, :destroy]
    permit :subjects, :show
    permit :users, [:new, :create]
    
    permit_all if user.try(:admin)
  end
  
  def permit?(controller, action)
    @permit_all || @permitted_actions[[controller, action]]
  end
  
  def permit(controllers, actions)
    @permitted_actions ||= {}
    
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @permitted_actions[[controller.to_s, action.to_s]] = true
      end
    end
  end
  
  def permit_all
    @permit_all = true
  end
end