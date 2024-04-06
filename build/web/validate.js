function formValidation()
{
var name1 = document.login.name;
var mobno1 = document.login.mobno;
var email1 = document.login.email;
var pass1=document.login.pass;

{

if(allLetter(name1))
{
if(allnumeric(mobno1,10))
{ 
if(ValidateEmail(email1))
{
if(passid_validation(pass1,7,12))  
{
    return true;
} 
}
}
}
}
return false;

}

function allLetter(uname)
{ 
var letters =  /^[a-zA-Z \s]+$/;
if(uname.value.match(letters))
{
return true;
}
else
{
alert('Pleae Enter Proper Name');
return false;
}
}


function allnumeric(uzip)
{ 
var len1 = uzip.value.length; 
var numbers = /^[0-9]+$/;
if(uzip.value.match(numbers) && len1 == 10 )
{
return true;
}
else
{
alert('You have entered an invalid Mobile No');

return false;
}
}


function ValidateEmail(uemail)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(uemail.value.match(mailformat))
{
return true;
}
else
{
alert("You have entered an invalid email address!");
return false;
}
} 



function passid_validation(passid,mx,my)  
{  
var passid_len = passid.value.length;  
if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
{  
alert("Password should not be empty / length be between "+mx+" to "+my);  
 
return false;  
}  
return true;  
}  





