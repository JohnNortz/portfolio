class PostPolicy
  attr_accessor :user, :post

  def initialize(user, article)
    @user = user || NullUser.new
    @post = post
  end

  def publish?
    @user.editor?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.editor?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def update?
    user.admin? or not post.published?
  end

  def index
    @posts = PostPolicy::Scope.new(current_user, Post).resolve
  end
end
