import sqlite3
import os

expected_result = [
    (1, 'Financial Services', 40.0),
    (1, 'Real Estate', 30.0),
    (1, 'Software', 30.0),
    (2, 'Energy', 50.0),
    (2, 'Technology Hardware & Equipment', 50.0)
]

conn = sqlite3.connect("investment.db")
cur = conn.cursor()

cur.execute("DROP TABLE IF EXISTS investor_transactions;")
cur.execute("DROP TABLE IF EXISTS sectors;")

cur.execute(
    """
CREATE TABLE investor_transactions (
investor_id INTEGER,
sector_id INTEGER,
no_of_shares INTEGER
);
"""
)

cur.execute(
    """
CREATE TABLE sectors (
sector_id INTEGER PRIMARY KEY,
sector_name TEXT
);
"""
)

cur.executemany(
    """
INSERT INTO investor_transactions (investor_id, sector_id, no_of_shares)
VALUES (?, ?, ?);
""",
    [(1, 10, 40), (1, 20, 30), (1, 30, 30), (2, 40, 50), (2, 50, 50)],
)

cur.executemany(
    """
INSERT INTO sectors (sector_id, sector_name)
VALUES (?, ?);
""",
    [
        (10, "Financial Services"),
        (20, "Real Estate"),
        (30, "Software"),
        (40, "Energy"),
        (50, "Technology Hardware & Equipment"),
    ],
)

conn.commit()

with open("answer.sql", "r") as file:
    sql = file.read()
    cur.execute(sql)

result = cur.fetchall()



print("Answer Result:")
for row in result:
    print(row)

print("--------------------------------")
print("Expected Result:")
for row in expected_result:
    print(row)

print("--------------------------------")
print("Checker")
if result == expected_result:
    print("Test passed ✅")
else:
    print("Test failed ❌")

cur.close()
conn.close()
os.remove("investment.db")