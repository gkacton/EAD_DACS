
# Script to validate an EAD XML file against the undeprecated (EAD3) schema ---

# load XML2 library

library(xml2)

# Read doc

target <- read_xml("In_Progress/PSNCA_H_010.xml")

# Read schema

schema <- read_xml("Standards/ead3_undeprecated.xsd")

# Run validation

xml_validate(target, schema) 


# stylesheet rendering ----------------------------------------------------

ead3_xsl <- read_xml("Standards/EAD3toHTML.xsl")

output <- xslt::xml_xslt(doc=target, stylesheet=ead_xsl)

cat(as.character(output))

write_html(output, "html_test.html")
