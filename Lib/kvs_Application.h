#include <kvs/Application>


extern "C"
{

kvs::Application* Application_new();
void Application_delete( kvs::Application* self );
void Application_run( kvs::Application* self );
void Application_quit( kvs::Application* self );

} // end of extern "C"
