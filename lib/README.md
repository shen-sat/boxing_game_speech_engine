Objects Structure

-- First we build a roster -- 
An EnemyBuilder can build an enemy using fname, lname, nickname, age and rank.
A RosterBuilder takes in a list of fnames, lnames, nicknames, age range and no of enemies.
It then builds a roster by looping through an EnemyBuilder (x amount of times where x = no of enemies).
A roster is an array of enemies.


-- Then we build a record of the history of interactions between the fighters --
A PairMatrixBuilder takes in a roster and builds an array of pairs of enemies (ie a pair matrix).
Each pair is a set, not an array.

A FightRecordBuilder takes in a pair matrix and builds a fight record (a hash):
There are two levels to the hash. The first is:
- fight_record[pair_as_a_set]
	- [last_fight_winner]
	- [last_fight_win_method]
	- [last_fight_no_of_rounds]
Secondly, each of the fighter within the context of the pair records info:
- fight_record[pair_as_a_set][pair_as_a_set[0]]
	- [no_of_wins]
(And then the same for the next fighter ie [pair_as_a_set[1]])

-- Then we take snapshot of the history between any two given fighters at any given time --
A QueryBuilder takes in a fighter, their opponent and the fight record.
It then builds a query, which is a snapshot of all facts relating to the pair, from the fighter's POV.
The QueryBuilder forms the snapshot ie query into a small, easy(ish)-to-handle hash.

A RuleChecker has a list of methods like 'opponent_is_younger'.
It initialises with the query, so it has info on fighter, opponent and history.
It can therefore run these methods and return true/false from fighter's POV.

A TrashTalkProcessor initialises with a number of rules that dictate responses.
It first orders these rules by score.
Then, it can process a response after given the RuleChecker.
It uses the RuleChecker to go through the rules and ellicit the best response.
Bang! We have context-sensitive trash talk :)









Game Level Design

game start
|
load and check raw docs
|							|						|
create and check Roster		create and check Rules  create and check TrashTalkProcessor  
|
create Pre-fight Press Conference
	|
	take 2 random Enemies from Roster
	|
	for each
		|
		create RulesChecker
		|
		feed RulesChecker to TrashTalkProcessor.process
		|
		return response



TODO
- create Pre-fight Press Conference
- Loader&Validator for raws:
	- nicknames, fnames and lnames lists
	- rules spreadsheet
- Validator for game objects
	- Roster
	- Rules

NOTE
- Everytime you add a new method to RuleChecker, you need to write a test for it

NEXT:
- finish trash talk processor fix (removing true and false statements)
- uncomment and fix test in enemy spec

