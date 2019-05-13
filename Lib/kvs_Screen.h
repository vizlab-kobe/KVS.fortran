#include <kvs/ScreenBase>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>
#include <kvs/ColorImage>


extern "C"
{
kvs::ScreenBase* Screen_new();
void Screen_delete( kvs::ScreenBase* self );
void Screen_registerObject( kvs::ScreenBase* self, kvs::ObjectBase* object, kvs::RendererBase* renderer );
void Screen_draw( kvs::ScreenBase* self );
kvs::ColorImage* Screen_capture( kvs::ScreenBase* self );
}
