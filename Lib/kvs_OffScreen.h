#include <kvs/OffScreen>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>


extern "C"
{

kvs::OffScreen* OffScreen_new();
void OffScreen_delete( kvs::OffScreen* self );
void OffScreen_registerObject( kvs::OffScreen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer );
void OffScreen_create( kvs::OffScreen* self );
void OffScreen_show( kvs::OffScreen* self );
void OffScreen_hide( kvs::OffScreen* self );
void OffScreen_draw( kvs::OffScreen* self );
kvs::ColorImage* OffScreen_capture( kvs::OffScreen* self );

} // end of extern "C"
