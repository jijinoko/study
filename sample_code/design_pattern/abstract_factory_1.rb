class GoogleWorkspaceFactory
  def create_document
    GoogleDocument.new
  end

  def create_spreadsheet
    GoogleSpreadsheet.new
  end

  def create_presentation
    GooglePresentation.new
  end
end

class Microsoft365Factory
  def create_document
    MicrosoftWord.new
  end

  def create_spreadsheet
    MicrosoftExcel.new
  end

  def create_presentation
    MicrosoftPowerPoint.new
  end
end

class GoogleDocument
  def name
    'Googleドキュメント'
  end
end

class GoogleSpreadsheet
  def name
    'Googleスプレッドシート'
  end
end

class GooglePresentation
  def name
    'Googleスライド'
  end
end

class MicrosoftWord
  def name
    'Microsoft Word'
  end
end

class MicrosoftExcel
  def name
    'Microsoft Excel'
  end
end

class MicrosoftPowerPoint
  def name
    'Microsoft PowerPoint'
  end
end

def service_names(factory)
  puts factory.create_document.name
  puts factory.create_spreadsheet.name
  puts factory.create_presentation.name
end

puts "---Google Workspace---"
service_names(GoogleWorkspaceFactory.new)

puts "---Microsoft 365---"
service_names(Microsoft365Factory.new)
