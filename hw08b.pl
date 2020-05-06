/*
	Micah Swagel and Nicholas Blatt
	CS 461-01
	05 May 2020
	HW08B
	Expert System on Diagnosing Diabetes and Indicative Conditions

	Our expert system diagnoses if you
	have diabetes, and if so, what kind. 

	The knowledge base comprises:
		- Diabetic symptoms
		- Diabetic conditions
		- Facts of 5 patients with varying symptoms

	Reference:
	https://www.webmd.com/diabetes/guide/understanding-diabetes-symptoms#1-2
*/


%%% Queries and Results run in SWI-Prolog terminal
/*
	?- type2(john).
		true

	?- type2(perry).
		true

	?- type1(john).
		false.

	?- hypoglycemia(john).
		false.

	?- hyperglycemia(john).
		true.

	?- hyperglycemia(perry).
	  false.

	?- prediabetic(micah).
		true

	?- diabeticcoma(perry).
		true

	?- diabeticcoma(nick).
		false.

	?- gestational(brittany).
		true

	?- calldoctor(nick).
		true
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Symptoms

/*
	anxious(x).
	confused(x).
	clammy(x).
	cranky(x).
	dizzy(x).
	drymouth(x).
	fever(x).
	hallucinations(x).
	heavybreathing(x).
	heavypeeing(x).
	highbloodsugar(x).
	hungry(x).
	infections(x).
	itchyskin(x).
	nausea(x).
	parched(x).
	pregnant(x).
	shaky(x).
	sleepy(x).
	slowheal(x).
	stomachache(x).
	sweaty(x).
	sweetbreath(x).
	tingly(x).
	urinesugar(x).
	visionloss(x).
	weak(x).
	weightloss(x).
*/


%%% Conditions

hypoglycemia(X) :-
	shaky(X),
	anxious(X),
	(sweaty(X) ; clammy(X)),
	confused(X),
	cranky(X),
	dizzy(X),
	sleepy(X),
	weak(X),
	tingly(X).

hyperglycemia(X) :-
  parched(X),
  visionloss(X),
  heavypeeing(X),
  hungry(X),
  tingly(X),
  weak(X),
  urinesugar(X),
  weightloss(X),
  infections(X),
  slowheal(X),
  highbloodsugar(X).

diabeticcoma(X) :-
  highbloodsugar(X),
  (parched(X) ; drymouth(X)),
  not(sweaty(X)),
  fever(X),
  (confused(X) ; sleepy(X)),
  visionloss(X),
  hallucinations(X),
  weak(X).

gestational(X) :-
  (heavypeeing(X) ; parched(X)),
  pregnant(X).

type2(X) :- 
	hyperglycemia(X) ; 
	hypoglycemia(X) ; 
	diabeticcoma(X).

type1(X) :- 
	type2(X), 
	weightloss(X), 
	nausea(X).

calldoctor(X) :-
  (nausea(X), weak(X), parched(X), heavypeeing(X)) ;
  stomachache(X) ;
  heavybreathing(X) ;
  sweetbreath(X).

prediabetic(X) :-
	(hungry(X) , weak(X)) ;
	(heavypeeing(X) , parched(X)) ;
	(drymouth(X) , itchyskin(X)) ;
	visionloss(X).



%%% Patient facts

%%% john

parched(john).
visionloss(john).
heavypeeing(john).
hungry(john).
tingly(john).
weak(john).
urinesugar(john).
weightloss(john).
infections(john).
slowheal(john).
highbloodsugar(john).



%%% brittany

confused(brittany).
cranky(brittany).
drymouth(brittany).
hallucinations(brittany).
heavypeeing(brittany).
hungry(brittany).
itchyskin(brittany).
parched(brittany).
sleepy(brittany).
stomachache(brittany).
sweetbreath(brittany).
urinesugar(brittany).
weak(brittany).
pregnant(brittany).



%%% perry

anxious(perry).
clammy(perry).
dizzy(perry).
fever(perry).
heavybreathing(perry).
hungry(perry).
itchyskin(perry).
parched(perry).
slowheal(perry).
tingly(perry).
highbloodsugar(perry).
drymouth(perry).
confused(perry).
visionloss(perry).
hallucinations(perry).
weak(perry).



%%% nick

anxious(nick).
confused(nick).
drymouth(nick).
fever(nick).
hallucinations(nick).
heavybreathing(nick).
shaky(nick).
sleepy(nick).
slowheal(nick).
stomachache(nick).
urinesugar(nick).
visionloss(nick).
weak(nick).
weightloss(nick).



%%% micah

fever(micah).
hallucinations(micah).
heavybreathing(micah).
heavypeeing(micah).
highbloodsugar(micah).
hungry(micah).
infections(micah).
itchyskin(micah).
nausea(micah).
parched(micah).
shaky(micah).
sleepy(micah).
slowheal(micah).
stomachache(micah).
sweaty(micah).
pregnant(micah).