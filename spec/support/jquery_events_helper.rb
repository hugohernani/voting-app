module JqueryEventsHelper
  def trigger_event(selector, event)
    script = "$('##{selector}').trigger('#{event}')"
    page.execute_script(script)
  end
end
