// Basic projection
CALL gds.graph.project(
'myProjectedGraph',
['Organization', 'VerifiableCredential'],
['ISSUER'])

// Initial graph algorithm
CALL gds.nodeSimilarity.stream('myProjectedGraph')
YIELD node1, node2, similarity
RETURN gds.util.asNode(node1).name as VC1, gds.util.asNode(node2).name as VC2, similarity
ORDER BY similarity DESCENDING, VC1

// Squash together node types
// I'm positive this can be done 1000 times nicer - preferably on the projection. Pls let me know how.  
MATCH (n:BillOfLading) WITH collect(n) as nodes CALL apoc.refactor.mergeNodes(nodes);
MATCH (n:CommercialInvoice) WITH collect(n) as nodes CALL apoc.refactor.mergeNodes(nodes);
MATCH (n:IntentToImport) WITH collect(n) as nodes CALL apoc.refactor.mergeNodes(nodes);
MATCH (n:MillTestReport) WITH collect(n) as nodes CALL apoc.refactor.mergeNodes(nodes);

// Make a new projection, reverse the direction for organization focus 
CALL gds.graph.project(
'reverseProjection',
['Organization', 'VerifiableCredential'],
{ISSUER: {orientation: 'REVERSE'}})

// Try Node Similarity GA again - not super useful
CALL gds.nodeSimilarity.stream('reverseProjection')
YIELD node1, node2, similarity
RETURN gds.util.asNode(node1).name AS Org1, gds.util.asNode(node2).name AS Org2, similarity
ORDER BY similarity DESCENDING, Org1, Org2

// Label Propagation GA is more much better!
CALL gds.labelPropagation.write('reverseProjection', { writeProperty: 'community' })
YIELD nodePropertiesWritten, communityCount, communityDistribution

// Query organizations communities
MATCH (n:Organization)
RETURN n.community as Community,
n.name as Organization
ORDER BY Community
