# dotNET QA

## What’s the advantage of using System.Text.StringBuilder over System.String? 
StringBuilder is more efficient in the cases, where a lot of manipulation is done to the text. 
Strings are immutable, so each time it’s being operated on, a new instance is created.

## Can you store multiple data types in System.Array? 
No.
 
## How can you sort the elements of the array in descending order? 
By calling Sort() and then Reverse() methods.
 
## What’s the .NET datatype that allows the retrieval of data by a unique key? 
HashTable.
 
## What’s class SortedList underneath? 
A sorted HashTable.
 
## Will finally block get executed if the exception had not occurred? 
Yes.
 
## What’s the C# equivalent of C++ catch (…), which was a catch-all statement for any possible exception? 
A catch block that catches the exception of type System.Exception. You can also omit the parameter data type in this case and just write catch {}.
 
## Can multiple catch blocks be executed? 
No, once the proper catch code fires off, the control is transferred to the finally block (if there are any), and then whatever follows the finally block.
 
## Why is it a bad idea to throw your own exceptions? 
Well, if at that point you know that an error has occurred, then why not write the proper code to handle that error instead of passing a new Exception object to the catch block? Throwing your own exceptions signifies some design flaws in the project.
 
## What’s a delegate? 
A delegate object encapsulates a reference to a method. In C++ they were referred to as function pointers.
 
## What’s a multicast delegate? 
It’s a delegate that points to and eventually fires off several methods.
 
## How’s the DLL Hell problem solved in .NET? 
Assembly versioning allows the application to specify not only the library it needs to run (which was available under Win32), but also the version of the assembly.
 
## What are the ways to deploy an assembly? 
An MSI installer, a CAB archive, and XCOPY command.
 
## What’s a satellite assembly? 
When you write a multilingual or multi-cultural application in .NET, and want to distribute the core application separately from the localized modules, the localized assemblies that modify the core application are called satellite assemblies.
 
## What namespaces are necessary to create a localized application? 
System.Globalization, System.Resources.
 
## What’s the difference between // comments, /* */ comments and /// comments? 
Single-line, multi-line and XML documentation comments.
 
## How do you generate documentation from the C# file commented properly with a command-line compiler? 
Compile it with a /doc switch.
 
## What’s the difference between `<c>` and `<code>` XML documentation tag? 
Single line code example and multiple-line code example.
 
## Is XML case-sensitive? 
Yes, so `<Student>` and `<student>` are different elements.
 
## What debugging tools come with the .NET SDK? 
CorDBG – command-line debugger, and DbgCLR – graphic debugger. Visual Studio .NET uses the DbgCLR. To use CorDbg, you must compile the original C# file using the /debug switch.
 
## What does the This window show in the debugger? 
It points to the object that’s pointed to by this reference. Object’s instance data is shown.
 
## What does `assert()` do? 
In debug compilation, assert takes in a Boolean condition as a parameter, and shows the error dialog if the condition is false. The program proceeds without any interruption if the condition is true.
 
## What’s the difference between the Debug class and Trace class? Documentation looks the same.
Use Debug class for debug builds, use Trace class for both debug and release builds.
 
## Why are there five tracing levels in System.Diagnostics.TraceSwitcher? 
The tracing dumps can be quite verbose and for some applications that are constantly running you run the risk of overloading the machine and the hard drive there. Five levels range from None to Verbose, allowing to fine-tune the tracing activities.
 
## Where is the output of TextWriterTraceListener redirected?
To the Console or a text file depending on the parameter passed to the constructor.
 
## How do you debug an ASP.NET Web application? 
Attach the aspnet_wp.exe process to the DbgClr debugger.
 
## What are three test cases you should go through in unit testing? 
Positive test cases (correct data, correct output), 
negative test cases (broken or missing data, proper handling), 
exception test cases (exceptions are thrown and caught properly).
 
## Can you change the value of a variable while debugging a C# application? 
Yes, if you are debugging via Visual Studio.NET, just go to Immediate window.
 
## Explain the three services model (three-tier application). 
Presentation (UI), business (logic and underlying code) and data (from storage or other sources).
 
## What are advantages and disadvantages of Microsoft-provided data provider classes in ADO.NET? 
SQLServer.NET data provider is high-speed and robust, but requires SQL Server license purchased from Microsoft. OLE-DB.NET is universal for accessing other sources, like Oracle, DB2, Microsoft Access and Informix, but it’s a .NET layer on top of OLE layer, so not the fastest thing in the world. ODBC.NET is a deprecated layer provided for backward compatibility to ODBC engines.
 
## What’s the role of the DataReader class in ADO.NET connections? 
It returns a read-only dataset from the data source when the command is executed.
 
## What is the wildcard character in SQL? Let’s say you want to query database with LIKE for all employees whose name starts with La. 
The wildcard character is %, the proper query with LIKE would involve ‘La%’.
 
## Explain ACID rule of thumb for transactions. 
Transaction must be 
* Atomic (it is one unit of work and does not dependent on previous and following transactions), 
* Consistent (data is either committed or roll back, no “in-between” case where something has been updated and something hasn’t), 
* Isolated (no transaction sees the intermediate results of the current transaction), 
* Durable (the values persist if the data had been committed even if the system crashes right after).
 
## What connections does Microsoft SQL Server support?
Windows Authentication (via Active Directory) and SQL Server authentication (via Microsoft SQL Server username and passwords).
 
## Which one is trusted and which one is untrusted? 
Windows Authentication is trusted because the username and password are checked with the Active Directory, the SQL Server authentication is untrusted, since SQL Server is the only verifier participating in the transaction.
 
## Why would you use untrusted verificaion? 
Web Services might use it, as well as non-Windows applications.
 
## What does the parameter Initial Catalog define inside Connection String? 
The database name to connect to.
 
## What’s the data provider name to connect to Access database? 
Microsoft.Access.
 
## What does Dispose method do with the connection object? 
Deletes it from the memory.
 
## What is a pre-requisite for connection pooling? 
Multiple processes must agree that they will share the same connection, where every parameter is the same, including the security settings.
 
## What is the difference between a "where" clause and a "having" clause? 
"Where" is a kind of restriction statement. You use where clause to restrict all the data from DB.Where clause is using before result retrieving. 
But Having clause is using after retrieving the data.Having clause is a kind of filtering command.
 
## What is the basic form of a SQL statement to read data out of a table? 
The basic form to read data out of table is ‘SELECT * FROM table_name; ‘ 
An answer: ‘SELECT * FROM table_name WHERE xyz= ‘whatever’;’ cannot be called basic form because of WHERE clause.
 
## What structure can you implement for the database to speed up table reads? 
Follow the rules of DB tuning we have to: 
1. properly use indexes ( different types of indexes)
1. properly locate different DB objects across different table spaces, files and so on.
1. create a special space (table space) to locate some of the data with special datatype ( for example CLOB, LOB and …)
 
## What are the tradeoffs with having indexes?
Faster selects, slower updates. 
Extra storage space to store indexes. 
Updates are slower because in addition to updating the table you have to update the index.
 
## What is a "join"? 
‘join’ used to connect two or more tables logically with or without common field.
 
## What is "normalization"? "Denormalization"? Why do you sometimes want to denormalize? 
Normalizing data means eliminating redundant information from a table and organizing the data so that future changes to the table are easier. 
Denormalization means allowing redundancy in a table. The main benefit of denormalization is improved performance with simplified data retrieval and manipulation. This is done by reduction in the number of joins needed for data processing.
 
## What is a "constraint"?
A constraint allows you to apply simple referential integrity checks to a table. 
There are four primary types of constraints that are currently supported by SQL Server: 
* PRIMARY/UNIQUE - enforces uniqueness of a particular table column. 
* DEFAULT - specifies a default value for a column in case an insert operation does not provide one. 
* FOREIGN KEY - validates that every value in a column exists in a column of another table. 
* CHECK - checks that every value stored in a column is in some specified list. Each type of constraint performs a specific type of action. 
* Default is not a constraint. 
* NOT NULL is one more constraint which does not allow values in the specific column to be null. And also it the only constraint which is not a table level constraint.
 
## What types of index data structures can you have? 
An index helps to faster search values in tables. The three most commonly used index-types are: - B-Tree: builds a tree of possible values with a list of row IDs that have the leaf value. Needs a lot of space and is the default index type for most databases. - Bitmap: string of bits for each possible value of the column. Each bit string has one bit for each row. Needs only few space and is very fast.(however, domain of value cannot be large, e.g. SEX(m,f); degree(BS,MS,PHD) - Hash: A hashing algorithm is used to assign a set of characters to represent a text string such as a composite of keys or partial keys, and compresses the underlying data. Takes longer to build and is supported by relatively few databases.
