

##############################################################################
# 9. Lab - More on cmdlets
##############################################################################


<# Link to Udemy lesson:
https://www.udemy.com/course/azure-powershell/learn/lecture/31091886#overview


The below command-let gets information about the underlying computer system

Reference:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-computerinfo?view=powershell-7.2

#>

Get-ComputerInfo


##############################################################################
# 10. Lab - Variables and data types
##############################################################################

<#

Data types in Powershell: 

References:
https://docs.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-04?view=powershell-7.2


#>

# Here we are defining two vriables and assigning Integer values to the variables

$x=10
$y=20

# Here we are displaying the values assigned to the variables

$x
$y

# We can also add some string statements when displaying the values

'The value of x is ' + $x
'The value of y is ' + $y

# We can also perform substitution of variable values

"The value of x is $x"
"The value of y is $y"

# We can also perfom operations on the values defined in variables

$z=$x+$y
$z

# We can also define variables that hold string values

$CourseName="Azure PowerShell"
"The name of this course is $CourseName"

# We can also get the data types of values assigned to variables

$x.GetType()
$CourseName.GetType()



##############################################################################
# 11. Lab - Arrays and Hash tables
##############################################################################


# Here we are creating an array of string-based values
$CourseVideos='Introduction','Installation','Variables'

# We can display the entire array of string values
$CourseVideos

# Here we are defining an array of Integer values
$CourseNumbers=1,2,3

# Here we are displaying the array of Integer values
$CourseNumbers

# Another way of declaring the array
$CourseVideos_1=@(
    'Introduction'
    'Installation'
    'Variables'
)

# Displaying the array

$CourseVideos_1

# Accessing an array value via the use of an Index number
$CourseVideos_1[0]

# We can also change the value of an array element 
$CourseVideos_1[1]='Configuration'

$CourseVideos_1

# Here we are defining a hash table

$ServerNames=@{
    Development='Server01'
    Testing='Server02'
    Production='Server03'     
}

# How we can access a particular element of the hash table 
$ServerNames['Development']
$ServerNames.Development

# We can also add elements to the hash table 
$ServerNames.Add('QA','Server04')
$ServerNames


##############################################################################
# 12. Lab - Objects
##############################################################################


# Here we are defining a custom object

$Course=[PSCustomObject]@{
    Id = 1
    Name ='AZ-104 Azure Administrator'
    Rating = 4.7
}

# We are then displaying the custom object

$Course

# We can also access each custom object property

'The Course Id is ' + $Course.Id

# Here we are defining an array of objects

$CourseList=@(
    [PSCustomObject]@{
        Id = 1
        Name ='AZ-104 Azure Administrator'
        Rating = 4.7
        Class1 = 2.3
    },
    [PSCustomObject]@{
        Id = 2
        Name ='AZ-305 Azure Architect Design'
        Rating = 4.8
        Class1 = 2.3
    },
    [PSCustomObject]@{
        Id = 3
        Name ='AZ-500 Azure Security'
        Rating = 4.9
        Class1 = 2.3
    }
)

# We are displaying the entire array of objects

$CourseList

# We are accessing a particular object and its property

$CourseList[0].Name

$CourseList[0].Class1



##############################################################################
# 13. Lab - Statements
##############################################################################



$NumberOfVideos=30

# Here we are looking at the working of the if statement

if($NumberOfVideos -ge 20)
{
    "Greater or equal to 20"
}
else {
    "Less than 20"
}

# Here we are looking at the working of the while statement

$i=1
while($i -le 10)
{
    $i
    ++$i
}

# Here we are looking at the working of the for statement

for($i=1;$i -le 10;++$i)
{
    $i
}

# Here we are looking at the working of the foreach statement

$CourseVideos='Introduction','Installation','Variables'
foreach($Course in $CourseVideos)
{
    $Course
}

# We can also go through an entire array collection via the use of the foreach statement

$CourseList=@(
    [PSCustomObject]@{
        Id = 1
        Name ='AZ-104 Azure Administrator'
        Rating = 4.7
    },
    [PSCustomObject]@{
        Id = 2
        Name ='AZ-305 Azure Architect Design'
        Rating = 4.8
    },
    [PSCustomObject]@{
        Id = 3
        Name ='AZ-500 Azure Security'
        Rating = 4.9
    }
)

foreach($Course in $CourseList)
{
    $Course.Id
    $Course.Name
    $Course.Rating
}



##############################################################################
# 14. Lab - Working with Objects
##############################################################################


# Here we are defining a collection of mobile objects

$Mobiles=@(
[PSCustomObject]@{
    Brand  = "Samsung"
    Model="Galaxy S22 Ultra"
    Storage=@("128GB","256GB","512GB")
    Colors=@("Burgundy","Phantom Black","Green")
    Defaultapps=@(
        @{
            Name="Assist App"
            Status="Installed"
            Version=1.0
        },
        @{
            Name="Browser App"
            Status="Installed"
            Version=2.0
        }
    )
},
[PSCustomObject]@{
    Brand  = "Samsung"
    Model="Galaxy S22"
    Storage=@("128GB","256GB")
    Colors=@("Burgundy","Phantom Black","Pink Gold")
    Defaultapps=@(
        @{
            Name="Assist App"
            Status="Installed"
            Version=1.0
        },
        @{
            Name="Browser App"
            Status="Installed"
            Version=2.0
        }
    )
}
)

# We can display the entire Mobile collection
$Mobiles

# Or just display the first object in the collection
$Mobiles[0]

# We want to get the object where the Model is Galaxy S22
# Also we want to only select certain properties of the object
$Mobiles | Where-Object {$_.Model -eq "Galaxy S22"}
| Select-Object -Property Model,Storage

# We want to access the storage property here
$Mobiles[0].Storage[0]

# We want to access the Defaultapps property here
$Mobiles[0].Defaultapps.Item(0)

# Using a foreach statement to go through each element in the Defaultapps property
foreach($app in $Mobiles[0].Defaultapps)
{
    $app.Version
    $app.Name
    $app.Status
}


##############################################################################
# 15. Lab - Defining Functions
##############################################################################

# Here we are displaying a simple function

function Get-Appversion {
    $PSVersionTable    
}

# We are calling the function
Get-Appversion

# The function is being defined with two parameters
function Add-Integers([int]$x, [int]$y)
{
    'The sum of the Integers is ' +($x+$y)
}

# We are calling the function and passing in the required values
Add-Integers 10 20

# We can also define an object as a parameter to the function
function Get-Course
{
    param(
        [Object[]] $CourseList
    )

    foreach($Course in $CourseList)
{
    $Course.Id
    $Course.Name
    $Course.Rating
}
}

$CourseList=@(
    [PSCustomObject]@{
        Id = 1
        Name ='AZ-104 Azure Administrator'
        Rating = 4.7
    },
    [PSCustomObject]@{
        Id = 2
        Name ='AZ-305 Azure Architect Design'
        Rating = 4.8
    },
    [PSCustomObject]@{
        Id = 3
        Name ='AZ-500 Azure Security'
        Rating = 4.9
    }
)


Get-Course $CourseList

