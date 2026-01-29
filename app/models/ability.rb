class Ability
  include CanCan::Ability

  def initialize(user)
    # 1. Define abilities for the 'guest' user (not logged in)
    can :read, Post
    can :read, Comment

    # 2. Return immediately if user is not logged in
    return unless user.present?

    # 3. Allow logged-in users to create content
    can :create, Post
    can :create, Comment

    # 4. Allow users to update/destroy Posts only if they own them
    # We compare the 'user' field on the Post with the current 'user'
    can [:update, :destroy], Post, user: user

    # 5. Complex Logic for Comments:
    # A user can delete a comment if:
    # (a) They wrote the comment OR
    # (b) They own the post the comment is on
    can :destroy, Comment do |comment|
      comment.user == user || comment.post.user == user
    end
  end
end