#!/usr/bin/env python3

import os
from llama_index.core import VectorStoreIndex, SimpleDirectoryReader

#retrieve the key and directory path from the ini files
with open("key.ini","r",encoding="utf-8") as f:
    os.environ["OPENAI_API_KEY"] = f.read().strip()
with open("weblog.ini", "r", encoding="utf-8") as f:
    dir = f.read().strip()

documents = SimpleDirectoryReader(dir).load_data()
index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()
print(query_engine.query("Could you summarize the given context? Return your response which covers the key points of the text and does not miss anything important, please."))
print(query_engine.query("Extract any lines that may indicate an attack and describe the attack."))