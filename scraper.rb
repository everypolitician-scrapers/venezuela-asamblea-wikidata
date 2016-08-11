#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

es_2011 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://es.wikipedia.org/wiki/Composici%C3%B3n_de_la_Asamblea_Nacional_de_Venezuela_per%C3%ADodo_2011-2016',
  after: '//span[@id="Diputados_por_part.C3.ADdo"]',
  before: '//span[@id="Hist.C3.B3rico_Directiva"]',
  xpath: '//table[.//th[.="Diputado"]]//td[2]//a[not(@class="new")]/@title',
) 

# Included as Ricardo Molina resigned mid term and was revised out of list
es_2015 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://es.wikipedia.org/w/index.php?title=Composici%C3%B3n_de_la_Asamblea_Nacional_de_Venezuela_per%C3%ADodo_2016-2021&oldid=89386527',
  after: '//span[@id="Diputados_por_partido"]',
  before: '//span[@id="Directiva"]',
  xpath: '//table[.//th[contains(.,"Diputado")]]//td[2]//a[not(@class="new")]/@title',
)

es_2016 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://es.wikipedia.org/wiki/Composici%C3%B3n_de_la_Asamblea_Nacional_de_Venezuela_per%C3%ADodo_2016-2021',
  after: '//span[@id="Diputados_por_partido"]',
  before: '//span[@id="Directiva"]',
  xpath: '//table[.//th[contains(.,"Diputado")]]//td[2]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { es: es_2011 | es_2015 | es_2016 }, output: false)
