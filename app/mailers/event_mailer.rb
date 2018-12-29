class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @event = event
    @email = subscription.user_email
    @name = subscription.user_name

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий в #{event.title}"
  end

  def photo(event, photo, email)
    @photo = photo
    @event = event

    mail to: email, subject: "Новая фоточка в #{event.title}"
  end
end
