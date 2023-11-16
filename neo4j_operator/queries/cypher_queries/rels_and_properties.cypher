MATCH ()-[r]->() 
RETURN DISTINCT type(r) as type, keys(r) as propkeys