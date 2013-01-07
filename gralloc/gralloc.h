#ifndef _GRLC_H
#define _GRLC_H
#include "include/ui/android_native_buffer.h"
typedef struct gralloc_private_handle_t{

	int res_type;
	int w;
	int h;
	int stride;
	uint32_t vcHandle;
	int gl_format;
	android_native_buffer_t * buffer;


} gralloc_private_handle_t;

/*
typedef __int32 int32_t;
typedef unsigned __int32 uint32_t;
typedef __int8 int8_t;
typedef unsigned __int8 uint8_t;
*/
const int GRALLOC_PRIV_TYPE_MM_RESOURCE = 0;
const int GRALLOC_PRIV_TYPE_GL_RESOURCE = 1;

const int GRALLOC_MAGICS_HAL_PIXEL_FORMAT_OPAQUE = 0;
const int GRALLOC_MAGICS_HAL_PIXEL_FORMAT_TRANSLUCENT = 1;

gralloc_private_handle_t* gralloc_private_handle_from_client_buffer(EGLClientBuffer buffer);
uint32_t gralloc_private_handle_get_vc_handle(gralloc_private_handle_t *b);
uint32_t gralloc_private_handle_get_egl_image(gralloc_private_handle_t *b);
int gralloc_get_pf(gralloc_private_handle_t *b);

#endif
