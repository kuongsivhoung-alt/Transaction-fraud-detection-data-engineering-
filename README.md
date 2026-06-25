# Real-Time Financial Fraud Detection & Intelligent Risk Control System

An end-to-end data engineering pipeline designed to bridge the gap between historical batch training and real-time stream inference, powered by Random Forest and AWS.

##  Project Highlights
- **Engineering Architecture**: Implemented a **Lambda Architecture** to separate offline model training from real-time streaming inference.
- **Data Pipeline**: Built an automated production-ready pipeline: 
  `Python Simulator` → `AWS RDS (SQL Server)` → `PySpark Inference Engine` → `Tableau Live Dashboard`.
- **Engineering Optimization**: 
    - **Performance**: Optimized data ingestion using JDBC `WITH (NOLOCK)` to eliminate database locking contention, ensuring sub-second inference latency.
    - **Scalability**: Configured PySpark **micro-batching** to process high-velocity transaction streams while protecting local memory resources.
- **ML Model**: Utilized **Random Forest** for high-precision fraud classification, specifically optimized to handle the extreme class imbalance inherent in financial datasets.

## System Architecture


## 🛠️ Tech Stack
- **Languages**: Python, SQL, PySpark
- **Big Data & Processing**: Apache Spark (Micro-batching)
- **Database**: AWS RDS (Microsoft SQL Server)
- **Visualization**: Tableau Desktop (Live Mode)
- **Modeling**: Random Forest (scikit-learn, imblearn)

##  Key Technical Challenges
1. **Database Bottlenecks**: High-frequency INSERTs from the simulator caused persistent deadlocks for the PySpark inference engine. 
   - *Solution*: Applied `WITH (NOLOCK)` in JDBC queries, allowing "dirty reads" to maintain high-throughput data extraction without interrupting the ingestion stream.
2. **Memory Management**: Processing millions of transactions with SMOTE oversampling risks memory overflow.
   - *Solution*: Implemented a strict preprocessing pipeline (Row Filtering -> Data Splitting -> SMOTE) to ensure training efficiency and strictly prevent **Data Leakage**.

## How to Run
1. **Database Setup**: Execute the provided SQL scripts in your AWS RDS instance to initialize `dbo.live_transactions` and `dbo.fraud_predictions`.
2. **Launch Simulator**: Run `stream_simulator.ipynb` to start the transaction stream simulation.
3. **Run Inference Engine**: Execute `prediction.ipynb` to begin real-time fraud prediction and database write-back.
4. **Visualize**: Open the Tableau dashboard in **Live Mode** to monitor fraud trends in real-time.

