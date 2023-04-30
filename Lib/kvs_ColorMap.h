#include <kvs/ColorMap>


extern "C"
{

kvs::ColorMap* ColorMap_new();
void ColorMap_delete( kvs::ColorMap* self );
void ColorMap_setRange( kvs::ColorMap* self, float min_value, float max_value );
void ColorMap_setResolution( kvs::ColorMap* self, int resolution );
void ColorMap_create( kvs::ColorMap* self );

kvs::ColorMap* ColorMap_Rainbow( int resolution );
kvs::ColorMap* ColorMap_CoolWarm( int resolution );
kvs::ColorMap* ColorMap_BrewerBrBG( int resolution );
kvs::ColorMap* ColorMap_BrewerPiYG( int resolution );
kvs::ColorMap* ColorMap_BrewerPRGn( int resolution );
kvs::ColorMap* ColorMap_BrewerPuOr( int resolution );
kvs::ColorMap* ColorMap_BrewerRdBu( int resolution );
kvs::ColorMap* ColorMap_BrewerRdGy( int resolution );
kvs::ColorMap* ColorMap_BrewerRdYlBu( int resolution );
kvs::ColorMap* ColorMap_BrewerRdYlGn( int resolution );
kvs::ColorMap* ColorMap_BrewerSpectral( int resolution );
kvs::ColorMap* ColorMap_Viridis( int resolution );
kvs::ColorMap* ColorMap_Plasma( int resolution );
kvs::ColorMap* ColorMap_Inferno( int resolution );
kvs::ColorMap* ColorMap_Magma( int resolution );
kvs::ColorMap* ColorMap_Cividis( int resolution );

} // end of extern "C"
