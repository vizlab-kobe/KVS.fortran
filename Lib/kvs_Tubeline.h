#include <kvs/Tubeline>
#include <kvs/LineObject>
#include <kvs/PolygonObject>



extern "C"
{
kvs::Tubeline* Tubeline_new();
kvs::Tubeline* Tubeline_copy( kvs::Tubeline* other );
void Tubeline_delete( kvs::Tubeline* self );
kvs::PolygonObject* Tubeline_exec( kvs::Tubeline* self, kvs::LineObject* line, int ndivs );

}
