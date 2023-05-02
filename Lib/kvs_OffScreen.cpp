#include <kvs/OffScreen>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>
#include <kvs/ColorImage>
#include <kvs/Message>
#include <kvs/IgnoreUnusedVariable>


extern "C"
{

kvs::OffScreen* OffScreen_new()
{
    return new kvs::OffScreen();
}

void OffScreen_delete( kvs::OffScreen* self )
{
    if ( self ) delete self;
}

void OffScreen_registerObject( kvs::OffScreen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->registerObject( object, renderer );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( object );
    kvs::IgnoreUnusedVariable( renderer );
#endif
}

void OffScreen_create( kvs::OffScreen* self )
{
    self->create();
}

void OffScreen_show( kvs::OffScreen* self )
{
    self->show();
}

void OffScreen_hide( kvs::OffScreen* self )
{
    self->hide();
}

void OffScreen_draw( kvs::OffScreen* self )
{
    self->draw();
}

kvs::ColorImage* OffScreen_capture( kvs::OffScreen* self )
{
    self->draw();
    auto* image = new kvs::ColorImage();
    image->copy( self->capture() );
    return image;
}

} // end of extern "C"
