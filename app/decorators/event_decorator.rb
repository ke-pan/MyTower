class EventDecorator < Draper::Decorator
  delegate_all

  def generated_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime('%H:%M')
    end
  end

  def daystamps
    if object.created_at.midnight == today
      '今天'
    elsif object.created_at.midnight == yesterday
      '昨天'
    else
      object.created_at.strftime('%-m/%-d')
    end
  end

  def date
    object.created_at.strftime('%Y-%m-%d')
  end

  private
  def today
    @today ||= Time.zone.today.midnight
  end

  def yesterday
    @yesterday ||= Time.zone.yesterday.midnight
  end
end
