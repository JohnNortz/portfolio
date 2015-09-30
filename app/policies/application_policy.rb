class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user || NullUser.new
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.editor? || @user.author?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def publish?
    @user.editor?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
