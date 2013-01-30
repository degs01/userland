/*
	Warg's quick 'n dirty gralloc - (c) Viktor Warg, 2013
	
	changes since last commit:
	
	* fixing build
	* refactoring...


	--Warg (2013-01-25 17:01)
*/

#include "interface/khronos/common/khrn_client_mangle.h"

#include "interface/khronos/common/khrn_client.h"
#include "interface/khronos/common/khrn_client_rpc.h"

#include "interface/khronos/include/EGL/egl.h"
#include "interface/khronos/egl/loggy.h"
#include "interface/khronos/include/EGL/eglext.h"
#include "interface/khronos/include/EGL/eglext_brcm.h"
#include "interface/khronos/include/GLES/gl.h"

#include "interface/vcos/vcos.h"
#include "gralloc.h"

#include "interface/khronos/include/EGL/eglext_android.h"
#include "include/ui/PixelFormat.h"

#include "bcm_host.h"

#define ALIGN_UP(x,y)  ((x + (y)-1) & ~((y)-1))

gralloc_private_handle_t *dupes;
int szDupes = 0;
static int bufs_are_eq(android_native_buffer_t * a, android_native_buffer_t * b){
	return a == b;
}



static void add_to_dupes(gralloc_private_handle_t b){
	szDupes++;
	gralloc_private_handle_t *newDupes = (gralloc_private_handle_t*)malloc(sizeof(gralloc_private_handle_t)*szDupes);
	memcpy(newDupes, dupes, (szDupes-1));
	newDupes[(szDupes-1)] = b;
	dupes = newDupes;
}

static VC_IMAGE_TYPE_T convert_android_to_vc_img_type(android_native_buffer_t * buf){
	VC_IMAGE_TYPE_T type = 0;
	switch (buf->format)
		{
		  case PIXEL_FORMAT_RGBA_8888:	type=VC_IMAGE_RGBA32; break;
		  case PIXEL_FORMAT_BGRA_8888:	type=VC_IMAGE_BGRX8888; break;
		  case PIXEL_FORMAT_RGBA_5551:	type=VC_IMAGE_TF_RGBA5551; break;
		  case PIXEL_FORMAT_RGBA_4444:	type=VC_IMAGE_RGBA16; break;
		  case PIXEL_FORMAT_RGBX_8888:	type=VC_IMAGE_RGBX8888; break;
		  case PIXEL_FORMAT_RGB_565:	type=VC_IMAGE_RGB565; break;
		  case PIXEL_FORMAT_RGB_888:    type=VC_IMAGE_RGB888; break;
		  
		  default :                     type=VC_IMAGE_RGB565; break;
	    }
	return type;
}

static uint32_t do_allocate(android_native_buffer_t * buf){
	//uint32_t retVal = (uint32_t)calloc(1, szBuffer);
	uint32_t retVal = 0;
	vc_dispmanx_resource_create( convert_android_to_vc_img_type(buf),
                                 buf->width,
                                 buf->height,
                                 &retVal );
	
	return retVal; 
}
uint32_t gralloc_private_handle_get_vc_handle(gralloc_private_handle_t *b){
	return b->vcHandle;
}
static gralloc_private_handle_t* get_dupe(gralloc_private_handle_t* b){
	int i;
	gralloc_private_handle_t* d_b;

	for(i=0; i < szDupes; i++){
		d_b = &dupes[i];
		if(bufs_are_eq(b->buffer, d_b->buffer))
			return d_b;
	}
	return NULL;
}

static int is_dupe(gralloc_private_handle_t* b){
	return get_dupe(b) != NULL;
}
uint32_t gralloc_private_handle_get_egl_image(gralloc_private_handle_t *b){
	//return b->vcHandle;
	if(is_dupe(b))
		return get_dupe(b)->vcHandle;
	else
		return 0;
}

static int get_size_pf(android_native_buffer_t * buffer){
	int szPf = 0;
	switch (buffer->format)
		{
		  case PIXEL_FORMAT_RGBA_8888:	szPf = 4; break;
		  case PIXEL_FORMAT_BGRA_8888:	szPf = 4; break;
		  case PIXEL_FORMAT_RGBA_5551:	szPf = 2; break;
		  case PIXEL_FORMAT_RGBA_4444:	szPf = 2; break;
		  case PIXEL_FORMAT_RGBX_8888:	szPf = 4; break;
		  case PIXEL_FORMAT_RGB_565:	szPf = 2; break;
		  case PIXEL_FORMAT_RGB_888:    szPf = 3; break;
		  
		  default :                     szPf = 4; break;
	    }
	    return szPf;
}


gralloc_private_handle_t* gralloc_private_handle_from_client_buffer(EGLClientBuffer buffer){

	if(szDupes == 0)
		bcm_host_init();

	gralloc_private_handle_t* retVal = (gralloc_private_handle_t*)malloc(sizeof(gralloc_private_handle_t));
	android_native_buffer_t *android_buffer = (android_native_buffer_t *)buffer;
	retVal->w				= android_buffer->width;
	retVal->h				= android_buffer->height;
	retVal->stride			= android_buffer->stride;
	//retVal->gl_format		= android_buffer->format;
	retVal->gl_format		= GRALLOC_MAGICS_HAL_PIXEL_FORMAT_TRANSLUCENT;
	retVal->buffer			= android_buffer;
	retVal->res_type		= is_dupe(retVal) ? GRALLOC_PRIV_TYPE_GL_RESOURCE : GRALLOC_PRIV_TYPE_MM_RESOURCE;

	if(!is_dupe(retVal)){
		//retVal->vcHandle	= do_allocate((retVal->w * retVal->h) * get_size_pf(android_buffer));
		retVal->vcHandle 	= do_allocate(android_buffer);
		add_to_dupes(*retVal);
	}

	return retVal;
}

int gralloc_get_pf(gralloc_private_handle_t* handle){
	int buffer_format = 0;
	switch (((android_native_buffer_t *)handle->buffer)->format)
		{
		  case PIXEL_FORMAT_RGBA_8888:
		  case PIXEL_FORMAT_BGRA_8888:
		  case PIXEL_FORMAT_RGBA_5551:
		  case PIXEL_FORMAT_TRANSLUCENT:
		  case PIXEL_FORMAT_TRANSPARENT:
		  case PIXEL_FORMAT_RGBA_4444:	buffer_format = GRALLOC_MAGICS_HAL_PIXEL_FORMAT_TRANSLUCENT;    break;
		  
		  case PIXEL_FORMAT_OPAQUE:
		  case PIXEL_FORMAT_RGBX_8888:
		  case PIXEL_FORMAT_RGB_565:
		  case PIXEL_FORMAT_RGB_888:    buffer_format = GRALLOC_MAGICS_HAL_PIXEL_FORMAT_OPAQUE;      break;
		  
		  default :                     buffer_format = -1;              break;
	    }
	if(buffer_format == -1){
		LOGE("gralloc -> invalid buffer format, rethink ASAP!");
	}else{
		LOGE("gralloc -> format = GO!");
	}
	return buffer_format;
}
