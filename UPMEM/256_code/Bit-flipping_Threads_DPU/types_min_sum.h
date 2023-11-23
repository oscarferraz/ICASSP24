/* TYPES_MIN_SUM.H
=============================================================================================
Declarations of types to be used in ldpc decoding using belief propagation in the log domain.
The chosen names are related with the notation used in tanner graphs (node, edge, etc...)


Algorithms that use this types: MIN_SUM
===============================


Written by: Marco Alexandre Cravo Gomes 
			University of Coimbra - Electrical Engineering and Computer Department
			
			email: <marco@deec.uc.pt>
			url:   www.deec.uc.pt/~marco
			
Date: February 2003
=============================================================================================*/

#ifndef TYPES_MIN_SUM_H

#define TYPES_MIN_SUM_H


struct edge_bit_to_check{				// Edges of the factor graph describes the LDPC code	
	char sign;
	short int index;					//==================================================
	struct edge_check_to_bit *pointer;
};

struct edge_check_to_bit{			    // Edges of the factor graph describes the LDPC code
	float value;						//==================================================
	short int index;					//	-> value - to be used as the likelihood of the 
										//			   message associated with that edge
	struct edge_bit_to_check *pointer;	// -> pointer to the values that enter in the calculation
										//    of the message that that check node sent to each of 
										//    the bit nodes connected to it.
};


struct node_check{					// Nodes of Tanner graph that describes the LDPC code
	
	short int degree;				//===================================================
	float	  abs_minimum;
	float	  abs_second_minimum;
	short int index_of_minimum;
	char	  sign;
	struct edge_bit_to_check *first;    // -> pointer to the values that enter in the calculation
										//    of the message that that check node sent to each of 
										//    the bit nodes connected to it.
};

struct node_bit{					// Nodes of Tanner graph that describes the LDPC code
	short int degree;				//===================================================
	struct edge_check_to_bit *first;
};

#endif // TYPES_MIN_SUM_H //
