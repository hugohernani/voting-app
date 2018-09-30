module Select2Helper
  def select2(value, attrs)
    first('.select2-container', minimum: 1).click
    page.execute_script %Q{
      element = $('.select2-input');
      element.trigger('keydown').val('#{value}').trigger('keyup');
    }
    sleep 0.5
    first('div.select2-result-label').click
  end
end
