#Quiz Application

use strict;
use warnings;
$\ = "\n";

#hash of questions
my %questions = ( 'what is the smallest natural number' => 1,
				 'whats the smallest whole number' => 0,
				 'The only prime even number' => 2,
				 'what is 2 times 2' => 4,
				 'what is 9/3' => 3,
				 );

my %users;	
my %admins = ('Ajinkya' => 1234, 'Sarah' => 123 );

# the main game subroutine
sub game()
{
	my $score;
	my $count;
	
	foreach (keys %questions){
		print "$_";
		my $userans = <STDIN>;
		if ($userans == $questions{$_}){
			print " Correct !!!!";
			$score++;
		}
		else {
			print " Wrong answer, The correct answer is $questions{$_}";
		}
		$count++;
		
		if ($count == 5){
		last;}
	}
	
	print "\nYou have completed the game\nYou have scored : $score out of 5";
}
		
	
	


				 
sub useraccount()
{USERSTART:	
	print "to sign in press 1, to create new account press 2";
	my $val = <STDIN>;
	
	if ($val == 1){
		print "Enter your username";
		my $username = <STDIN>;
		if (exists $users{$username}){
			print " enter your passwd";
			my $userpasswd = <STDIN>;
			if ( $users{$username} == $userpasswd ){
				print "Let's play the game";
				game();
			}
			else {
			print "Authentication failed, wrong username or passwd";
			goto USERSTART;
	}
		}
		}
	
	
	if ($val ==2){
		print " lets create your account";
		again:
		print "Enter your username";
		my $newuser = <STDIN>;
		
		if ( exists $users{$newuser} ){
			print "This username already exists, please try other username";
			goto again;
		}
		
		print "Enter your numeric password";
		my $newpass = <STDIN>;
		
		$users{$newuser}=$newpass;
		print "Your account has been created successfully\nPlease login to start the game";
		goto USERSTART;
	}				
}

#adminOperations subroutine
sub adminOperations()
{  NEWOP:
	print "\n\nto add questions press 1\nTo view already existing questions press 2\n to add new admin press 3\nTo return to start press 4";
	my $adminOp = <STDIN>;
	
	if ($adminOp==1){
		print "Enter new question to be added";
		my $newQuestion = <STDIN>;
		print "enter the answer to the question";
		my $newAnswer = <STDIN>;
		$questions{$newQuestion} = $newAnswer;
		print "\n Question is added successfully ";
		goto NEWOP;
	}
	
	if ($adminOp == 2){
	print "$_" foreach (keys %questions);
	goto NEWOP;
	}
	
	if ($adminOp == 3){
		print "Enter new admin";
		my $newAdmin = <STDIN>;
		print "Create a passwd for him";
		my $newAdminPass = <STDIN>;
		
		$admins{$newAdmin} = $newAdminPass;
		print " \nadmin Added successfully ";
		goto NEWOP;
	}
	
	if ($adminOp == 4)
		{
			goto ActualStart;
		}
}



#admins subroutine
sub admins()
{	
	adminStart:
	print "enter username";
	my $adminUser = <STDIN>;
chomp $adminUser;
	if (exists $admins{$adminUser}){
		print "Enter your passwd";
		my $adminpass = <STDIN>;
		
		if ($adminpass == $admins{$adminUser})
			{
				adminOperations();
			}
		else {
			print "auhentication failed, Try again";
			goto adminStart;
	}}
}

	

#starting point
print " Welcome to the Game 'Quiz Me'!!!";
ActualStart:
print " If you are user press 1, For admin press 2";
my $entry = <STDIN>;

if ($entry ==1){
	useraccount();
}

if ($entry ==2){
	admins();
}