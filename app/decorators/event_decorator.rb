class EventDecorator < Draper::Decorator
  delegate_all

  def generated_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%H:%M")
    end
  end

end
