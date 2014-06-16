class Permission
  
  def initialize(user)
    permit :welcome, :index
    permit :articles, :show
    permit :sessions, [:new, :create, :destroy]
    permit :subjects, :show
    permit :users, [:new, :create]
    permit :users, [:edit, :update] do |user_pro|
      user.id == user_pro.id
    end
    
    if user && user.has_role?("Author")
      permit :articles, [:new, :create]
      permit :articles, [:edit, :update, :destroy] do |article|
        article.user == user
      end
    end
    
    permit_all if user.try(:admin)
  end
  
  def permit?(controller, action, resource=nil)
    permitted = @permit_all || @permitted_actions[[controller.to_s, action.to_s]]
    permitted && (permitted == true || (resource && permitted.call(resource)))
  end
  
  def permit(controllers, actions, &block)
    @permitted_actions ||= {}
    
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @permitted_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end
  
  def permit_all
    @permit_all = true
  end
end