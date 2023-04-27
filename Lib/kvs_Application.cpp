#include "kvs_Application.h"
#include <kvs/Screen>


extern "C"
{

kvs::Application* Application_new()
{
    return new kvs::Application( 0, 0 );
}

void Application_delete( kvs::Application* self )
{
    if ( self ) delete self;
}

void Application_run( kvs::Application* self )
{
    self->run();
}

void Application_quit( kvs::Application* self )
{
    self->quit();
}

} // end of extern "C"
