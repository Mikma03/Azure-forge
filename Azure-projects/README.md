
<!-- TOC -->

- [Azure\_projects](#azure_projects)
- [Project nr 1](#project-nr-1)
    - [Azure Data Factory](#azure-data-factory)
    - [Azure Storage Solutions](#azure-storage-solutions)
- [Project 2 - Azure Databricks \& Spark Core For Data Engineers](#project-2---azure-databricks--spark-core-for-data-engineers)
  - [Azure Databricks](#azure-databricks)
  - [Spark (Only PySpark and SQL)](#spark-only-pyspark-and-sql)
  - [Delta Lake](#delta-lake)
  - [Azure Data Factory](#azure-data-factory-1)

<!-- /TOC -->

# Azure_projects

Projects using MS Cloud - Azure especially Azure Data Factory, Azure Databricks, Data Lake and HDInsight.


# Project nr 1

- Link to course:
    - https://www.udemy.com/course/learn-azure-data-factory-from-scratch/

Project for Azure Data Engineers using Azure Data Factory, SQL, Data Lake, Databricks, HDInsight

Real world project for Azure Data Engineers using Azure Data Factory, SQL, Data Lake, Databricks, HDInsight.


### Azure Data Factory

- Building a solution architecture for a data engineering solution using Azure Data Engineering technologies such as Azure Data Factory (ADF), Azure Data Lake Gen2, Azure Blob Storage, Azure SQL Database, Azure Databricks, Azure HDInsight and Microsoft PowerBI.

- Integrating data from HTTP clients, Azure Blob Storage and Azure Data Lake Gen2 using Azure Data Factory.

- Branching and Chaining activities in Azure Data Factory (ADF) Pipelines using control flow activities such as Get Metadata. If Condition, ForEach, Delete, Validation etc.

- Using Parameters and Variables in Pipelines, Datasets and LinkedServices to create a metadata driven pipelines in Azure Data Factory (ADF)

- Debugging the data pipelines and resolving issues.

- Scheduling pipelines using triggers such as Event Trigger, Schedule Trigger and Tumbling Window Trigger in Azure Data Factory (ADF)

- Creating Mapping Data Flows to create transformation logic. The course covers all of the transformation steps such as Source, Filter, Select, Pivot, Lookup, Conditional Split, Derived Column, Aggregate, Join and Sink transformation.

- Debugging data flows, investigating issues, fixing failures etc

- Implementing Azure Data Factory pipelines to invoke Mapping Data Flows and executing them.

- Creating ADF pipelines to execute HDInsight activities and carry out data transformations.

- Creating ADF pipelines to execute Databricks Notebook activities to carry out transformations.

- Creating dependency between pipelines to orchestrate the data flow

- Creating dependency between triggers to orchestrate the data flow

- Monitoring data pipelines, creating alerts, reporting of metrics from the Azure Data Factory Monitor.

- Monitoring of Data Factory pipelines using Azure Monitor and setting diagnostic setting to be forwarded to Azure Storage Account or Log Analytics Workspace.

- Creating Log Analytics workspace, creating workbooks and charts from log analytics on the Azure Data Factory pipelines

- Implementing the Azure Data Factory Analytics monitoring tool and how to extend the capability further.

### Azure Storage Solutions

- Creating Azure Storage Account, Creating containers, Uploading data, Access Control (IAM), Using Azure Storage explorer to interact with the storage account

- Creating Azure Data Lake Gen2, Creating containers, Uploading data, Access Control (IAM), Using Azure Storage explorer to interact with the storage account

- Creating Azure SQL Database, Pricing Tiers, Creating Admin User, Creating Tables, Loading Data and Querying the database.

- Azure HDInsight & Databricks

- Creating HDInsight Clusters, Interacting with the UI, Using Ambari, Creating Hive tables, Invoking HDInsight activities from Azure Data Factory

- Creating Azure Databricks Workspace, Creating Databricks clusters, Mounting storage accounts, Creating Databricks notebooks, performing transformations using Databricks notebooks, Invoking Databricks notebooks from Azure Data Factory.


# Project 2 - Azure Databricks & Spark Core For Data Engineers

- Link to following course:
    - https://www.udemy.com/course/azure-databricks-spark-core-for-data-engineers/

- Azure Architecture Center
    - https://docs.microsoft.com/en-us/azure/architecture/


## Azure Databricks

- Building a solution architecture for a data engineering solution using Azure Databricks, Azure Data Lake Gen2, Azure Data Factory and Power BI

- Creating and using Azure Databricks service and the architecture of Databricks within Azure

- Working with Databricks notebooks as well as using Databricks utilities, magic commands etc

- Passing parameters between notebooks as well as creating notebook workflows

- Creating, configuring and monitoring Databricks clusters, cluster pools and jobs

- Mounting Azure Storage in Databricks using secrets stored in Azure Key Vault

- Working with Databricks Tables, Databricks File System (DBFS) etc

- Using Delta Lake to implement a solution using Lakehouse architecture

- Creating dashboards to visualise the outputs

- Connecting to the Azure Databricks tables from PowerBI

## Spark (Only PySpark and SQL)

- Spark architecture, Data Sources API and Dataframe API

- PySpark - Ingestion of CSV, simple and complex JSON files into the data lake as parquet files/ tables.

- PySpark - Transformations such as Filter, Join, Simple Aggregations, GroupBy, Window functions etc.

- PySpark - Creating local and temporary views

- Spark SQL - Creating databases, tables and views

- Spark SQL - Transformations such as Filter, Join, Simple Aggregations, GroupBy, Window functions etc.

- Spark SQL - Creating local and temporary views

- Implementing full refresh and incremental load patterns using partitions

## Delta Lake

- Emergence of Data Lakehouse architecture and the role of delta lake.

- Read, Write, Update, Delete and Merge to delta lake using both PySpark as well as SQL 

- History, Time Travel and Vacuum

- Converting Parquet files to Delta files

- Implementing incremental load pattern using delta lake

## Azure Data Factory

- Creating pipelines to execute Databricks notebooks

- Designing robust pipelines to deal with unexpected scenarios such as missing files

- Creating dependencies between activities as well as pipelines

- Scheduling the pipelines using data factory triggers to execute at regular intervals

- Monitor the triggers/ pipelines to check for errors/ outputs.