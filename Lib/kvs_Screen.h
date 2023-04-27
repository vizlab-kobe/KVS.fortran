#include <kvs/Screen>


extern "C"
{

kvs::Screen* Screen_new();
void Screen_delete( kvs::Screen* self );
void Screen_registerObject( kvs::Screen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer );
void Screen_draw( kvs::Screen* self );
kvs::ColorImage* Screen_capture( kvs::Screen* self );

} // end of extern "C"
