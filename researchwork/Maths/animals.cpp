#include <iostream>
#include <string>
#include <fstream>

using namespace std;

class Animal
{
	private:
		int weight;
		int height;
		string name;

		static int numOfAnimals;
	public:
		int getWeight(){ return height;}
		int getHeight(){ return weight;}
		string getName(){ return name;}
	
		void setAll(int, int, string);

		Animal(int, int, string);

		~Animal();

		Animal();

	//Could also be protected (usable by the members of te class only

	//Static method attached to the class, not the object
	static int getNumOfAnimals() { return numOfAnimals;}

	void toString();
};

int Animal::numOfAnimals = 0;

void Animal::setAll(int height, int weight, string name)
{
	this -> height = height;
	this -> weight = weight;
	this -> name = name;
	Animal::numOfAnimals++;
}

Animal::Animal(int height, int weight, string name)
{
	this -> height = height;
	this -> weight = weight;
	this -> name = name;
	Animal::numOfAnimals++;
}

Animal::~Animal()
{
	cout << "Animal" << this->name << " destroyed" << endl;
}

Animal::Animal()
{
	Animal::numOfAnimals++;
}

void Animal::toString()
{
	cout << "Animal height: " << this->height << endl;
}

class Dog : public Animal
{
	string sound = "Woof";

public:
	void getSound(){ cout << sound << endl;}

	Dog(int, int, string, string);

	void toString();
};

//Dog : Animal(){};

Dog::Dog(int height, int weight, string name, string bark) :
Animal(height, weight, name)
{
	this -> sound = bark;
}

void Dog::toString()
{
	cout << this-> getName() << " is" << this->getHeight() << "cms tall" << "Sound: " << this-> getSound() << endl; 
}

int main()
{
	//Animal fred();

	//fred.setHeight(33);
	//fred.setWeight(33);
	//fred.setName("Fred");

	//cout << fredgetName() << " is" << fredHeigh() << endl;	

	Animal tom(36,15,"Tom");
	
	cout << tom.getName() << endl;

	Dog spot(38, 16, "Spot", "Woof2");
}
