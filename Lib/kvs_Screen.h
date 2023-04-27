#include <kvs/Screen>
#include <kvs/Application>


extern "C"
{

kvs::Screen* Screen_new( kvs::Application* app );
void Screen_delete( kvs::Screen* self );
void Screen_registerObject( kvs::Screen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer );
void Screen_create( kvs::Screen* self );
void Screen_show( kvs::Screen* self );
void Screen_hide( kvs::Screen* self );
void Screen_draw( kvs::Screen* self );
kvs::ColorImage* Screen_capture( kvs::Screen* self );

} // end of extern "C"
