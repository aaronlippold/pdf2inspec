require './Control'

class RegexControlParser
  @benchmark_contents
  @controls
  
  def controls
    @controls
  end

  def initialize()
    @controls=Hash.new()
    @benchmark_contents = ""
  end
  
  def import(benchmark_file)
    file = File.open(benchmark_file, "rb")
    @benchmark_contents = file.read
    file.close
  end

  #Search the benchmark for controls and parse them out.
  def parse_benchmark()
    str = @benchmark_contents

    #Look for the first control 
    while(@m1 = /(?<section_number>[0-9]+\.[0-9]+)/m.match(str))
      #Look for the second control or end of file
      next_str = @m1.post_match
      if (@m2 = /(\n\n)(?<section_number>[0-9]+\.[0-9]+)(?<rest_of_section>.+)/m.match(next_str))
        #Found the next section so parse it                                                                                               
        parse_control(@m1[:section_number]+@m2.pre_match)                                                    
        #Advance to the next control
        str = @m2.to_s  
      else 
        #Did not find a second section control. Instead, found 
        #the end of the benchmark so just parse it.
        parse_control(str)
        break
      end
    end
  end

  #Parse the data out of the control and store it in a hash
  #where the key is the section number and the value is a
  #Control object.
  def parse_control(str)
    @m = /^(?<section_number>[0-9]{1,2}\.[0-9]{1,3}) (?<title>.+)Profile Applicability:(?<profile_applicability>.+)Description:(?<description>.+)Rationale:(?<rationale>.+)Audit:(?<audit>.+)Remediation:(?<remediation>.+)Impact:(?<impact>.+)Default Value:(?<default_value>.+)References:(?<references>.+)CIS Controls:(?<cis_controls>.+)/m.match(str)
    
   if @m
     #Parse applicability into level and description
     @app_level = ""
     @app_desc = ""
     @a = /^Level (?<applicability_level>[0-9]+)( - (?<applicability_desc>.+\n))?/.match(@m[:profile_applicability])
     if @a
       @app_level = @a[:applicability_level]
       @app_desc = @a[:applicability_desc]
     end

     #Parse references into an array
     @refs = parse_references(@m[:references])

     #Parse controls into an array
     @ctrls = parse_controls(@m[:cis_controls])
   
     #Create a new Control object and store it in the hash
     c = Control.new(@m[:section_number], @m[:title], @app_level, @app_desc, 
                     @m[:description], @m[:rationale], @m[:audit], 
                     @m[:remediation], @m[:impact], @m[:default_value], 
                     @refs, @ctrls)                                                     
     
     @controls.store(@m[:section_number], c)     
   end
  end

  def parse_references(reference_str)
    @refs = Array.new()
    while (@r = /(?<reference_url>(http.+\n))/.match(reference_str))
      @refs.push(@r[:reference_url])
      reference_str = @r.post_match
    end
    @refs
  end

  def parse_controls(controls_str)
    @ctrls = Array.new()
    while (@c = /(?<control_number>(^[0-9]+(\.[0-9]+)?))/.match(controls_str))
      @ctrls.push(@c[:control_number])
      controls_str = @c.post_match
    end
    @ctrls
  end

  def print_controls()
    @controls.each do |key, value|
      puts value.inspect()
    end
  end

end


#cp = RegexControlParser.new()
#cp.import("pdf-to-parse/cleanfile.txt")
#cp.parse_benchmark()
#cp.print_controls()
