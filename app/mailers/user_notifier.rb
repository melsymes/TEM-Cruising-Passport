class UserNotifier < ActionMailer::Base
  default from: "info@transeuropemarinas.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.accepted.subject
  #
  def accepted(user)
    @greeting = "Hi"
    @user = user
    @marina = user.marina
    mail to:  user.email, subject: t('email.accepted.subject')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.manager_accepted.subject
  #
  def manager_accepted(user)
    @greeting = "Hi"
    @user = user
    @marina = user.marina

    mail to:  user.email, subject: t('email.manager_accepted.subject')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.rejected.subject
  #
  def rejected(user)
    @greeting = "Hi"
    @user = user
    @marina = user.marina
    mail to:  user.email, subject: t('email.rejected.subject')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_user.subject
  #
  def expired_user(user)
    @user = user
    @marina = user.marina
    @greeting = "Hi"
    mail to: user.email, subject: t('email.expired_user.subject')
  end


  def remove_pending(user)
    @user = user
    @greeting = "Hi"
    @marina = user.marina

    mail to: user.email, subject: t('email.remove_pending.subject')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_manager.subject
  #
  def expired_manager(user)
    @greeting = "Hi"
    @user = user
    @marina = user.marina
    mail to:  @user.email, subject: t('email.expired_manager.subject')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_manager.subject
  #
  def roll_change(user)
    @greeting = "Hi"
    @user = user
    @marina = user.marina
    mail to:  @user.email, subject: t('email.roll_change.subject')
  end


  def new_initial_user(user)
    @user = user
    @greeting = "Hi"
    @marina = user.marina

    mail to:  @user.email, subject: t('email.new_initial_user.subject')
  end

  def validate_admin(user)
    @user = user
    @greeting = "Hi"


    mail to:  @user.email, subject: t('email.validate_admin.subject')
  end

  def new_user(user)
    @user = user
    @greeting = "Hi"
    @marina = user.marina

    mail to:  @user.email, subject: t('email.new_user.subject')
  end

  def user_pending_notification(user)
    @user = user
    @marina = @user.marina
    mail to: @user.email, subject: t('email.user_pending_notification.subject')
  end


end
