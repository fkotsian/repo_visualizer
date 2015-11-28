class Message
  def initialize(name, recipient)
    @name = name
    @recipient = recipient
  end
end

class ObjectData
  def initialize(methods)
    @methods = methods
  end
end

class FileAnalyzer
  def initialize; end
  
  def call(filepath)
    text = File.read(filepath)
    objects = {}
    text.scan(object_declaration_regex).each do |obj_name, obj_text|
      objects[obj_name.to_sym] = ObjectData.new
    end

    messages = Hash.new([])
    text.scan(method_invocation_regex).each do |receiver, message|
      messages[message.to_sym] = receiver
    end
    messages.uniq
  end

  def object_declaration_regex
    # has to track 'end's; perhaps metaprogrammatically require the file and instantiate each of its objects, calling 'methods' on them? what if they need arguments?
    /class\s(\w+)(.*)end/i
  end

  def method_declaration_regex
    /def\s(\w+)/i
  end
  
  def method_invocation_regex
    /(\w+)\.(\w+)/i
  end
  
end
