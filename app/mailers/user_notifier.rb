class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.accepted.subject
  #
  def accepted(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.manager_accepted.subject
  #
  def manager_accepted(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.rejected.subject
  #
  def rejected(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_user.subject
  #
  def expired_user(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: 'USER EXPIRED'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_manager.subject
  #
  def expired_manager(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.expired_manager.subject
  #
  def roll_change(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end


  def new_inital_user(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: 'New inital user'
  end

  def new_user(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: 'New user'
  end

  def user_pending_notification(user)
    @user = user
    @marina = @user.marina
    mail to: @user.email, subject: t('email.user_pending_notification.subject')
  end


end
