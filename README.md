# Neo4J Operator

It's Tank and Dozer for your Neo4J instances!  Handle connections to your databases marshal responses to queries.

# USAGE

## The Neo4JDatabase Object
The Neo4JDatabase object holds credentials for a Neo4J Database.

```python
from neo4j_operator import Neo4JDatabase

Neo4JDatabase(hostname='localhost', port=7687, username='neo4j', password='')

# learn what's in the database:
nodes = operator.fetch_labels_and_properties()
rels = operator.fetch_types_and_properties()
```
The Neo4JDatabase also acts as a context manager:

```python
with operator as session:
    r = session.execute_read(operator.transaction, "MATCH (n) RETURN n LIMIT 5", params={})
```

## The Neo4JResult Object
The Neo4JResult object handles the Neo4J.Result from a `neo4j.Transaction`.  It contains two attributes `Neo4JResult.data` a list of dictonaris containing your neo4j query result and `Neo4JResult.metadata` containing the consumed query object.

```python
# return data
r.data

# inspect metadata
r.metadata.counters
```

The `Neo4JResult` can format the data into json or pandas:

```python
# return data
with open('myresults.json', 'w') as f:
    f.write(r.to_json())

# return pandas dataframe:
df = r.to_pandas()
```
