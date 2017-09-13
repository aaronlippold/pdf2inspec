# This class represents a recommendation from a CIS Benchmark. More information about CIS
# Benchmarks can be found at https://www.cisecurity.org/cis-benchmarks/.

class Control
  @section_number
  @title
  @applicability_level
  @applicability_description
  @description
  @rationale
  @audit
  @remediation
  @impact
  @default
  @references
  @controls

  def section_number
    @section_number
  end

  def title
    @title
  end

  def applicability_level
    @applicability_level
  end

  def applicability_description
    @applicability_description
  end

  def description
    @description
  end

  def rationale
    @rationale
  end

  def audit
    @audit
  end

  def remediation
    @remediation
  end

  def impact
    @impact
  end

  def default
    @default
  end

  def references
    @references
  end

  def controls
    @controls
  end

  def initialize(section_number, title, applicability_level, 
                 applicability_description, description, 
                 rationale, audit, remediation, impact, 
                 default, references, controls)
    @section_number = section_number
    @title = title
    @applicability_level = applicability_level
    @applicability_description = applicability_description
    @description = description
    @rationale = rationale
    @audit = audit
    @remediation = remediation
    @impact = impact
    @default = default
    @references = references
    @controls = controls
  end

  def inspect()
    str = ""
    str << "**********Start Control*****************\n"
    str << "\nSection:\n" <<  section_number << "\n"
    str << "\nTitle:\n" << title
    str << "\nApplicability Level:\n" << applicability_level << "\n"
    str << "\nApplicability Description:\n" << applicability_description
    str << "\nDescription:" << description 
    str << "\nRationale:" << rationale 
    str << "\nAudit:" << audit 
    str << "\nRemediation:" << remediation 
    str << "\nImpact:" << impact 
    str << "\nDefault Value:" << default 
    str << "\nReferences:\n"
    references.each {|ref| str << ref}
    str << "\nControls:\n"
    controls.each {|control| str << control}
    str << "\n\n**********End Control*******************\n"
    str
  end
end
