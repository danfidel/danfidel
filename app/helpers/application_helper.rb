module ApplicationHelper
  def table_boolean(val)
    val ? 'X' : (val.nil? ? ' ' : '-')
  end
end
