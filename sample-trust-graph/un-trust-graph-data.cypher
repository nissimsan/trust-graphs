
CREATE (customs:Entity { name: "Customs", did: "customs.gov.x"})
CREATE (exporter:Entity { name: "Exporter", did: "abcd"})
CREATE (aeo:VerifiableCredential:AEOCert { id: "778"})
CREATE (aeo)-[vc1a:ISSUER]->(customs)
CREATE (aeo)-[vc1b:SUBJECT]->(exporter)

CREATE (deptOfAgri:Entity { name: "Department of Agriculture", did: "agri.gov.x"})
CREATE (inspector:Entity { name: "Inspector", did: "efgh"})
CREATE (agriAuth:VerifiableCredential:AgriAuthorization { id: "445"})
CREATE (agriAuth)-[vc2a:ISSUER]->(deptOfAgri)
CREATE (agriAuth)-[vc2b:SUBJECT]->(inspector)

CREATE (deptOfTrade:Entity { name: "Department of Trade", did: "trade.gov.x"})
CREATE (chamber:Entity { name: "Chamber", did: "8765"})
CREATE (tradeAuth:VerifiableCredential:TradeAuthorization { id: "982"})
CREATE (tradeAuth)-[vc3a:ISSUER]->(deptOfTrade)
CREATE (tradeAuth)-[vc3b:SUBJECT]->(chamber)

CREATE (accrAuth:Entity { name: "Accreditation Authority", did: "accredit.org"})
CREATE (certifier:Entity { name: "Cerifier", did: "5432"})
CREATE (acc:VerifiableCredential:Accreditation { id: "248"})
CREATE (acc)-[vc4a:ISSUER]->(accrAuth)
CREATE (acc)-[vc4b:SUBJECT]->(certifier)

CREATE (trademarks:Entity { name: "Trademarks Office", did: "ip.gov.x"})
CREATE (producer:Entity { name: "Producer", did: "hjkl"})
CREATE (tm:VerifiableCredential:Trademark { id: "923"})
CREATE (tm)-[vc5a:ISSUER]->(trademarks)
CREATE (tm)-[vc5b:SUBJECT]->(producer)

CREATE (forwarder:Entity { name: "Forwarder", did: "logistics.com"})
CREATE (consignment:Thing { name: "Consignment", did: "kjh654"})
CREATE (awb:VerifiableCredential:AirWaybill { id: "8876"})
CREATE (awb)-[vc6a:ISSUER]->(forwarder)
CREATE (awb)-[vc6b:SUBJECT]->(consignment)

CREATE (shipment:Thing { name: "Shipment", did: "xyz321"})
CREATE (pl:VerifiableCredential:PackingList { id: "3344"})
CREATE (pl)-[vc7a:ISSUER]->(exporter)
CREATE (pl)-[vc7b:SUBJECT]->(shipment)

CREATE (inv:VerifiableCredential:Invoice { id: "1122"})
CREATE (inv)-[vc8a:ISSUER]->(exporter)
CREATE (inv)-[vc8b:SUBJECT]->(shipment)

CREATE (origin:VerifiableCredential:OriginCertificate { id: "665"})
CREATE (origin)-[vc9a:ISSUER]->(chamber)
CREATE (origin)-[vc9b:SUBJECT]->(shipment)

CREATE (iso:VerifiableCredential:ISO14001 { id: "888"})
CREATE (iso)-[vc10a:ISSUER]->(certifier)
CREATE (iso)-[vc10b:SUBJECT]->(producer)

CREATE (product:Thing { name: "Product", did: "123456"})
CREATE (carbon:VerifiableCredential:CarbonFootprint { id: "22113"})
CREATE (carbon)-[vc11a:ISSUER]->(certifier)
CREATE (carbon)-[vc11b:SUBJECT]->(product)

CREATE (msds:VerifiableCredential:MSDS { id: "3456"})
CREATE (msds)-[vc12a:ISSUER]->(producer)
CREATE (msds)-[vc12b:SUBJECT]->(product)

CREATE (tradeItem:Thing { name: "Trade Item", did: "fgh987"})
CREATE (auth:VerifiableCredential:Authenticity { id: "77665"})
CREATE (auth)-[vc13a:ISSUER]->(producer)
CREATE (auth)-[vc13b:SUBJECT]->(tradeItem)

CREATE (phyto:VerifiableCredential:PhytosanitaryCertificate { id: "2234"})
CREATE (phyto)-[vc14a:ISSUER]->(inspector)
CREATE (phyto)-[vc14b:SUBJECT]->(shipment)

CREATE (consignment)-[ref1:TRANSPORTS]->(shipment)
CREATE (shipment)-[ref2:CONTAINS]->(tradeItem)
CREATE (tradeItem)-[ref3:REFERENCES]->(product)
