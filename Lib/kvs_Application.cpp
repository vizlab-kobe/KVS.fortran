#include "kvs_Application.h"
#include <kvs/Screen>
#include <kvs/IgnoreUnusedVariable>


extern "C"
{

kvs::Application* Application_new()
{
#if defined( KVS_SUPPORT_GLUT ) || defined( KVS_SUPPORT_GLFW ) || defined( KVS_SUPPORT_QT )
    return new kvs::Application( 0, 0 );
#else
    return nullptr;
#endif
}

void Application_delete( kvs::Application* self )
{
    if ( self ) delete self;
}

void Application_run( kvs::Application* self )
{
#if defined( KVS_SUPPORT_GLUT ) || defined( KVS_SUPPORT_GLFW ) || defined( KVS_SUPPORT_QT )
    self->run();
#else
    kvs::IgnoreUnusedVariable( self );
#endif
}

void Application_quit( kvs::Application* self )
{
#if defined( KVS_SUPPORT_GLUT ) || defined( KVS_SUPPORT_GLFW ) || defined( KVS_SUPPORT_QT )
    self->quit();
#else
    kvs::IgnoreUnusedVariable( self );
#endif
}

} // end of extern "C"
