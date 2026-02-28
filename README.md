# 🧪 Periodic Table Database Project

A relational database normalization and CLI scripting exercise built with **PostgreSQL** and **Bash**.  
This project demonstrates schema correction, constraint enforcement, normalization, and query automation.

---

## 📂 Project Structure

```
periodic_table/
│
├── element.sh              # Bash script to query elements
├── periodic_table.sql      # Database dump with corrections
└── README.md               # Project documentation
```

---

## 🛠️ Getting Started

Follow these steps to set up and run the project after cloning the repository.

1. **Install PostgreSQL**  
   Ensure PostgreSQL 12+ is installed and `psql` is available in your PATH.

2. **Clone the repository**

   ```bash
   git clone <repo-url>
   cd periodic_table
   ```

3. **Import the database**

   ```bash
   psql -U postgres < periodic_table.sql
   ```

   Adjust the user or connection parameters as needed.

4. **Make the script executable**

   ```bash
   chmod +x element.sh
   ```

5. **Run examples**

   ```bash
   ./element.sh 1
   ./element.sh H
   ./element.sh Hydrogen
   ```

   You should see output describing the requested element.

---

## 🔧 Database Improvements

Key changes made to fix and normalize the database:

- **Renamed columns for clarity**
  - `weight` → `atomic_mass`
  - `melting_point` → `melting_point_celsius`
  - `boiling_point` → `boiling_point_celsius`

- **Constraints added**
  - `NOT NULL` on required fields
  - `UNIQUE` on `symbol` and `name`
  - Foreign key: `properties.atomic_number` → `elements.atomic_number`
  - Foreign key: `properties.type_id` → `types.type_id`

- **Normalization**
  - Created a `types` table for element classification
  - Removed redundant `type` column from `properties`

- **Data cleaning**
  - Atomic mass formatting (removed trailing zeros)
  - Added missing elements: Fluorine (9), Neon (10)
  - Removed invalid element with `atomic_number = 1000`

---

## ⚙️ element.sh Script

The script accepts an argument in one of three forms:

- **Atomic number**  
- **Element symbol**  
- **Element name**

### ▶️ Usage

```bash
./element.sh <argument>
```

### 💡 Examples

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

### 📜 Output Format

```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal,
with a mass of 1.008 amu. Hydrogen has a melting point of -259.1
celsius and a boiling point of -252.9 celsius.
```

- **No argument provided:**
  ```
  Please provide an element as an argument.
  ```

- **Invalid element:**
  ```
  I could not find that element in the database.
  ```

---

## 🛠️ Technologies Used

- PostgreSQL  
- Bash  
- Git  
- Linux CLI  

---

## 💾 Database Dump

The `periodic_table.sql` file contains a full corrected database dump.  
Restore it using:

```bash
psql -U postgres < periodic_table.sql
```

---

## 🎯 Key Concepts Practiced

- Database normalization  
- Relational integrity  
- Schema migration  
- Foreign keys  
- Data cleaning  
- Bash scripting with SQL queries  
- Git version control workflow  

---

## ✅ Project Status

- All required tests passed successfully  
- Repository is on the `main` branch with a clean working tree  

---
