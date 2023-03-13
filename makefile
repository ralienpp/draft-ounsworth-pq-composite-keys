
docName = draft-ounsworth-pq-composite-keys


default: all

txt: $(docName).txt

$(docName).txt: $(docName).mkd
	kdrfc $(docName).mkd



xml: $(docName).xml

$(docName).xml: $(docName).mkd
	./insertFileIncludes.sh $(docName).mkd "." > $(docName)_tmp.mkd
	kramdown-rfc2629 $(docName)_tmp.mkd > $(docName).xml
	rm $(docName)_tmp.mkd




html: all # xml
	# xml2rfc $(docName).xml --basename $(docName) --html
 # Explicitely aliasing this to `all` so that a .txt is always generated, because that should be committed to git for other people's ease of editing.

all: xml
	xml2rfc $(docName).xml --html --text


clean:
	rm -f $(docName).xml # $(docName).html # $(docName).txt
	# Explicitely not deleting the .html or .txt because that should be committed to git for other people's ease of editing.
