#pragma once

/**
*	Handle graph exceptions 
*	@class graph_exception
**/

#include <exception>
#include <string>
#include <iostream>

class graph_exception : public std::exception
{

	private :
	
			std::string m_error_message;
	

	public :
		
		graph_exception( const std::string & error_message ):m_error_message(error_message)
		{;}
		
		virtual const char * what() const throw()
		{
			return m_error_message.c_str();
		}
		
		
		virtual ~graph_exception() throw(){;}



};
