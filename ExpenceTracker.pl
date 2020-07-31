
#Expence Tracker


use strict;

use warnings;
$\ = "\n";


#expence subroutine
sub expences ()
{	my %expenditure;	
	my $Total_Expence;
	ANOTHER:
	print "state the coz of expence";
	my $key = <STDIN>;
	chomp $key;
	print " Enter the amount spent ";
	my $value = <STDIN>;
	chomp $value;
	
	$expenditure{$key} = $value;
	 print '';
	 
	 print "to enter another expence press 1\n if expences are entered press 2";
	 my $subcat = <STDIN>;
	 if ($subcat == 1){
		goto ANOTHER;
	 }
	print "your expenses are as follows\n";
	print "$_\t\t : $expenditure{$_}"  for (keys %expenditure);
	$Total_Expence += $expenditure{$_} for (keys %expenditure);
	print "\n Total expenditure is : $Total_Expence\n";

	return ( $Total_Expence);
}

#earnings
sub earnings(){
	print "Enter your earnings";
	my $earn = <STDIN>;
	chomp $earn;
	return $earn;
	
	}
	
	
print "Welcome to the Expence tracker";
print "Enter your Name";
my $user=<STDIN>;
chomp $user;

my $Total_Earning;
my $exp;
START:
print "\nTo Enter your earning press 1 \nTo enter expences press 2 \nTo see your accounts press 3";
my $val = <STDIN>;

if ($val == 1){
	my $earns = earnings();
	$Total_Earning += $earns;
	print "hello $user, your total earning is : Rs $Total_Earning";
	goto START;
}

if ($val ==2){
	$exp = expences();
	
	goto START;
}

if ($val ==3){
my $savings = $Total_Earning - $exp;
print "Your total earnings are : $Total_Earning\nTotal Expences are : $exp\n Savings are : $savings ";
	
}





	