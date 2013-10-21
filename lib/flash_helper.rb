module FlashHelper
  def flash_translate(array)
    scope = ''
    array.each {|i| scope += i + "^"}
    return scope
  end
end
