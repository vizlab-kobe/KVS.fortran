#include "kvs_Screen.h"
#if defined( KVS_SUPPORT_OSMESA )
#include <kvs/osmesa/Screen>
#elif defined( KVS_SUPPORT_GLUT )
#include <kvs/glut/Screen>
#else
#warning "Screen class is not found in KVS."
#endif
#include <kvs/Message>
#include <kvs/IgnoreUnusedVariable>


extern "C"
{

kvs::ScreenBase* Screen_new()
{
//    kvsMessageDebug() << "Screen_new is called." << std::endl;
#if defined( KVS_SUPPORT_OSMESA )
    return new kvs::osmesa::Screen();
#elif defined( KVS_SUPPORT_GLUT )
    return new kvs::glut::Screen();
#else
    return NULL;
#endif
}

void Screen_delete( kvs::ScreenBase* self )
{
//    kvsMessageDebug() << "Screen_delete is called." << std::endl;
    if ( self ) delete self;
}

void Screen_registerObject( kvs::ScreenBase* self, kvs::ObjectBase* object, kvs::RendererBase* renderer )
{
//    kvsMessageDebug() << "Screen_registerObject is called." << std::endl;
#if defined( KVS_SUPPORT_OSMESA )
    kvs::osmesa::Screen* screen = reinterpret_cast<kvs::osmesa::Screen*>( self );
    screen->registerObject( object, renderer );
#elif defined( KVS_SUPPORT_GLUT )
    kvs::glut::Screen* screen = reinterpret_cast<kvs::glut::Screen*>( self );
    screen->registerObject( object, renderer );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( object );
    kvs::IgnoreUnusedVariable( renderer );
#endif
}

void Screen_draw( kvs::ScreenBase* self )
{
//    kvsMessageDebug() << "Screen_draw is called." << std::endl;
#if defined( KVS_SUPPORT_OSMESA )
    kvs::osmesa::Screen* screen = reinterpret_cast<kvs::osmesa::Screen*>( self );
    screen->draw();
#elif defined( KVS_SUPPORT_GLUT )
    kvs::glut::Screen* screen = reinterpret_cast<kvs::glut::Screen*>( self );
    if ( screen->id() == 0 ) { screen->create(); }
    screen->paintEvent();
#else
    kvs::IgnoreUnusedVariable( self );
#endif
}

kvs::ColorImage* Screen_capture( kvs::ScreenBase* self )
{
//    kvsMessageDebug() << "Screen_capture is called." << std::endl;
#if defined( KVS_SUPPORT_OSMESA )
    kvs::osmesa::Screen* screen = reinterpret_cast<kvs::osmesa::Screen*>( self );
    screen->draw();
    kvs::ColorImage* image = new kvs::ColorImage();
    image->copy( screen->capture() );
    return image;
#elif defined( KVS_SUPPORT_GLUT )
    kvs::glut::Screen* screen = reinterpret_cast<kvs::glut::Screen*>( self );
    if ( screen->id() == 0 ) { screen->create(); }
    kvs::ColorImage* image = new kvs::ColorImage();
    image->copy( screen->scene()->camera()->snapshot() );
    return image;
#else
    kvs::IgnoreUnusedVariable( self );
    return NULL;
#endif
}

}
