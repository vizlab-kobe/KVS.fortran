#include "kvs_Screen.h"
#include <kvs/Application>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>
#include <kvs/ColorImage>
#include <kvs/Message>
#include <kvs/IgnoreUnusedVariable>


extern "C"
{

kvs::Screen* Screen_new( kvs::Application* app )
{
#if defined( KVS_SUPPORT_GLUT ) || defined( KVS_SUPPORT_GLFW ) || defined( KVS_SUPPORT_QT )
    return new kvs::Screen( app );
#else
    return nullptr;
#endif
}

void Screen_delete( kvs::Screen* self )
{
    if ( self ) delete self;
}

void Screen_registerObject( kvs::Screen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer )
{
#if defined( KVS_SUPPORT_GLUT ) || defined( KVS_SUPPORT_GLFW ) || defined( KVS_SUPPORT_QT )
    self->registerObject( object, renderer );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( object );
    kvs::IgnoreUnusedVariable( renderer );
#endif
}

void Screen_create( kvs::Screen* self )
{
    self->create();
}

void Screen_show( kvs::Screen* self )
{
    self->show();
}

void Screen_hide( kvs::Screen* self )
{
    self->hide();
}

void Screen_draw( kvs::Screen* self )
{
    self->draw();
}

kvs::ColorImage* Screen_capture( kvs::Screen* self )
{
    self->draw();
    auto* image = new kvs::ColorImage();
    image->copy( self->capture() );
    return image;
}

} // end of extern "C"
