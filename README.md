# The MONDIAL Database

Copy of https://www.dbis.informatik.uni-goettingen.de/Mondial/

The MONDIAL database has been stimulated by the (1987) TERRA database and the SQL training of the _Institut für Programmstrukturen und Datenorganisation der Universität Karlsruhe_ in the 1990s. Using the [F-Logic](https://en.wikipedia.org/wiki/F-Logic) system [Florid](http://dbis.informatik.uni-freiburg.de/index.php?project=Florid), a new database has been generated in 1998 at Freiburg University, and since 2002 maintained at Göttingen University from geographical Web data sources listed below:

*   [CIA World Factbook](https://www.cia.gov/library/publications/the-world-factbook/) (mainly in 1998 and 2015),
*   "Global Statistics", a predecessor of "GeoHive" which has been collected by Johan van der Heyden, but went offline in 2016/2017 (regularly since 1998),
*   [City population](http://www.citypopulation.de) by Thomas Brinkhoff (2015 update),
*   [Wikipedia](https://www.wikipedia.org/),
*   at the beginning, additional textual sources for coordinates, and a real atlas.
*   and some geographical data of the 1987 TERRA database from the University of Karlsruhe's teaching.

The generation of the MONDIAL database in 1998 served as a case study for information extraction and integration (pre-XML):

*   The original data extraction and integration process using the F-Logic system [FLORID](http://www.informatik.uni-freiburg.de/~dbis/florid/) is described [here](https://www.dbis.informatik.uni-goettingen.de/Mondial/Mondial-FL/).
*   The integration in XML using the [LoPiX](https://www.dbis.informatik.uni-goettingen.de/lopix/) system (2001) is described [here](https://www.dbis.informatik.uni-goettingen.de/lopix/lopix-mondial.html).

A main revision of Mondial has been done in summer 2009 (Mondial-II, using XQuery for integrating data from XHTML sources into XML with XML as target format). The data and main schema (XML, SQL, RDF) have been incrementally changed.

Another main revision of Mondial has been done during 2015 (Mondial-III). The data and main schema have again been incrementally changed.

The Mondial database is available in several formats:

## Relational MONDIAL

The [Database training "Praktikum: Datenbankprogrammierung in SQL/Oracle"](http://dbis.informatik.uni-goettingen.de/Teaching/DBP/) at the IFI uses the relational version of the MONDIAL database:

*   **Generating the Database under Oracle**
    *   [Database schema](mondial-schema.sql) "mondial-schema.sql"  
    *   [Input statements](mondial-inputs.sql) "mondial-inputs.sql"
    *   [Drop Table statements](mondial-drop-tables.sql) "mondial-drop-tables.sql"

*   **Generating the Database under PostgreSQL**
    *   [Database schema for postgres](mondial-schema.psql) "mondial-schema.psql"  
    *   [Input statements for postgres](mondial-inputs.psql) "mondial-inputs.psql"
    *   [Drop Table statements](mondial-drop-tables.psql) "mondial-drop-tables.psql"

*   **Generating the Database under MySQL/MariaDB**

    *   [Database schema for mysql](mondial-schema-mysql.sql) "mondial-schema-mysql.sql" (tablenames lowercase since MariaDB is case-sensitive; by Marcel Schneider, 2018)  
    *   [Input statements for mysql (all tablenames lowercase)](mondial-inputs-mysql.sql) "mondial-inputs-mysql.sql"
    *   short [description](OtherDBMSs/ora2mysql.txt) what has been changed for MySQL.

*   **Generating the Database under the [H2 Database System (SQL, Java)](http://www.h2database.com/html/main.html)**

    *   [Database schema for H2](mondial-schema-h2.sql) "mondial-schema-h2.sql"  
    *   [Input statements for H2](mondial-inputs-h2.sql) "mondial-inputs-h2.sql"
    *   short [description](ora2h2.txt) what has been changed for H2.

*   **Documentation**
    *   the [ER diagram](mondial-ER.pdf),
    *   the [relational schema](mondial-RS.pdf),
    *   the [referential dependency diagram](mondial-abh.pdf),

*   The Oracle instance of Mondial can be queried by [that form](http://www.semwebtech.org/sqlfrontend).

## MONDIAL in Datalog

*   [mondial.P](mondial.P) to be used e.g. with [XSB Prolog/Datalog](http://xsb.sourceforge.net/) from Stony Brook University  
    (aside: the DLV system from TU Vienna only supports integer, no negative numbers or decimals).

## MONDIAL in XML

The Mondial database provides a comprehensive example for XML, e.g., for use in teaching.

*   [DTD](mondial.dtd) "mondial.dtd"
*   [XML file](mondial.xml) "mondial.xml"
*   [excerpt: europe](mondial-europe.xml) "mondial-europe.xml"
*   [XML Schema (XSD)](mondial.xsd) "mondial.xsd"

(Note that some browsers to not *show* XML and DTD files correctly. Download the file(s) and load them into an editor)

## MONDIAL in RDF

Files are available in N3 format and in RDF/XML format. For human readers, the N3 is better readable, but as different tools have different expectations what "valid" N3 syntax is, there is also the RDF/XML variant [in the browser, use "show source"].  

*   The complete Mondial database: [mondial.n3 (N3/Turtle)](Mondial-RDF/mondial.n3), [mondial.rdf (RDF/XML)](Mondial-RDF/mondial.rdf)
*   The N3 data for Europe only: [mondial-europe.n3 (N3/Turtle)](Mondial-RDF/mondial-europe.n3), [mondial-europe.rdf (RDF/XML)](Mondial-RDF/mondial-europe.rdf)
*   Mondial RDFS/OWL metadata [mondial-meta.n3 (N3/Turtle)](Mondial-RDF/mondial-meta.n3), [mondial-meta.rdf (RDF/XML)](Mondial-RDF/mondial-meta.rdf)  
    (NOTE: check that the full mondial namespace is commented in, not the experimental one (second line))
*   an example query in SPARQL: [mondial-query.sparql](Mondial-RDF/mondial-query.sparql)
*   A set of owl:sameAs-triples connecting Mondial with Wikidata: [mondial-sameas.n3 (N3/Turtle)](Mondial-RDF/mondial-sameas.n3)

## MONDIAL as RDF Open Linked Data (LOD)

*   Homepage of the Mondial LOD service [http://www.semwebtech.org/mondial/10](http://www.semwebtech.org/mondial/10) (accessible as HTML and as RDF)
*   SPARQL Access point at <http://www.semwebtech.org/mondial/10/sparql> (accessible only from SPARQL clients)
*   LOD Cloud entry: [https://lod-cloud.net/dataset/Mondial](https://lod-cloud.net/dataset/Mondial)

## MONDIAL in F-Logic

*   The extraction and integration process and the extracted source facts in F-Logic representation can be found at the</a> [FLORID-MONDIAL Case Study](Mondial-FL/).
*   The following files provide Mondial in its original version from 1998:
    *   [Cleaned data in an OO schema](Mondial-FL/mondial-oo-facts.flp) "mondial-oo-facts.flp"
    *   [Cleaned data in Florid Frame Format](Mondial-FL/mondial-frames.flp) "mondial-frames.flp"


## Terms of Use

The [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/) license holds.

Recommended citation is still the technical report with a reference to the Web page:  

```
@TechReport{may-MONDIAL-report-99,
  author =	 {Wolfgang May},
  title =	 {Information Extraction and Integration with \textsc{Florid}:
        The \textsc{Mondial} Case Study},
  institution =  {Universit\"at Freiburg, Institut f\"ur Informatik},
  year = 	 1999,
  number =	 131,
  note    =     "Available from
    \url{http://www.dbis.informatik.uni-goettingen.de/Mondial}"
}
```

Mondial is used as an example in several books, lectures, courses etc. Search e.g. google for

*   [Mondial+XML](http://www.google.de/search?hl=de&q=Mondial+XML&btnG=Suche&meta=)
*   [Mondial+SQL](http://www.google.de/search?hl=de&q=Mondial+SQL&btnG=Suche&meta=)
*   [Mondial+RDF](http://www.google.de/search?hl=de&q=Mondial+RDF&btnG=Suche&meta=)
*   [Mondial+Database](http://www.google.de/search?hl=de&q=Mondial+Database&btnG=Suche&meta=)
