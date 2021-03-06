// Avisynth v2.5.  Copyright 2002 Ben Rudiak-Gould et al.
// http://www.avisynth.org

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA, or visit
// http://www.gnu.org/copyleft/gpl.html .
//
// Linking Avisynth statically or dynamically with other modules is making a
// combined work based on Avisynth.  Thus, the terms and conditions of the GNU
// General Public License cover the whole combination.
//
// As a special exception, the copyright holders of Avisynth give you
// permission to link Avisynth with independent modules that communicate with
// Avisynth solely through the interfaces defined in avisynth.h, regardless of the license
// terms of these independent modules, and to copy and distribute the
// resulting combined work under terms of your choice, provided that
// every copy of the combined work is accompanied by a complete copy of
// the source code of Avisynth (the version of Avisynth used to produce the
// combined work), being distributed under the terms of the GNU General
// Public License plus this exception.  An independent module is a module
// which is not derived from or based on Avisynth, such as 3rd-party filters,
// import and export plugins, or graphical user interfaces.

// Overlay (c) 2003, 2004 by Klaus Post

#include "stdafx.h"
#include "overlayfunctions.h"

void OL_LightenImage::BlendImageMask(Image444* base, Image444* overlay, Image444* mask) {
  BYTE* baseY = base->GetPtr(PLANAR_Y);
  BYTE* baseU = base->GetPtr(PLANAR_U);
  BYTE* baseV = base->GetPtr(PLANAR_V);

  BYTE* ovY = overlay->GetPtr(PLANAR_Y);
  BYTE* ovU = overlay->GetPtr(PLANAR_U);
  BYTE* ovV = overlay->GetPtr(PLANAR_V);

  BYTE* maskY = mask->GetPtr(PLANAR_Y);
  BYTE* maskU = mask->GetPtr(PLANAR_U);
  BYTE* maskV = mask->GetPtr(PLANAR_V);
  int w = base->w();
  int h = base->h();
  if (opacity == 256) {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        if (ovY[x] > baseY[x] )  {  // Lighten - blend
          baseY[x] = (BYTE)((((256-maskY[x])*baseY[x]) + (maskY[x]*ovY[x]+128))>>8);
          baseU[x] = (BYTE)((((256-maskU[x])*baseU[x]) + (maskU[x]*ovU[x]+128))>>8);
          baseV[x] = (BYTE)((((256-maskV[x])*baseV[x]) + (maskV[x]*ovV[x]+128))>>8);
        }
      }
      maskY += mask->pitch;
      maskU += mask->pitch;
      maskV += mask->pitch;

      baseY += base->pitch;
      baseU += base->pitch;
      baseV += base->pitch;

      ovY += overlay->pitch;
      ovU += overlay->pitch;
      ovV += overlay->pitch;

    }
  } else {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        if (ovY[x] > baseY[x] )  {  // Lighten - blend
          int mY = (maskY[x] * opacity)>>8;
          int mU = (maskU[x] * opacity)>>8;
          int mV = (maskV[x] * opacity)>>8;
          baseY[x] = (BYTE)((((256-mY)*baseY[x]) + (mY*ovY[x]+128))>>8);
          baseU[x] = (BYTE)((((256-mU)*baseU[x]) + (mU*ovU[x]+128))>>8);
          baseV[x] = (BYTE)((((256-mV)*baseV[x]) + (mV*ovV[x]+128))>>8);
        }
      }
      baseY += base->pitch;
      baseU += base->pitch;
      baseV += base->pitch;

      ovY += overlay->pitch;
      ovU += overlay->pitch;
      ovV += overlay->pitch;

      maskY += mask->pitch;
      maskU += mask->pitch;
      maskV += mask->pitch;
    }
  }
  
}

void OL_LightenImage::BlendImage(Image444* base, Image444* overlay) {
        
  BYTE* baseY = base->GetPtr(PLANAR_Y);
  BYTE* baseU = base->GetPtr(PLANAR_U);
  BYTE* baseV = base->GetPtr(PLANAR_V);

  BYTE* ovY = overlay->GetPtr(PLANAR_Y);
  BYTE* ovU = overlay->GetPtr(PLANAR_U);
  BYTE* ovV = overlay->GetPtr(PLANAR_V);
  
  int w = base->w();
  int h = base->h();
  if (opacity == 256) {
    if (!(w&7) && (env->GetCPUFlags() & CPUF_MMX)) {
      mmx_lighten_planar(baseY, baseU, baseV, ovY, ovU, ovV, base->pitch, overlay->pitch, w, h);
      return;
    }
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        if (ovY[x] > baseY[x] )  {  // Lighten 
          baseY[x] = ovY[x];
          baseU[x] = ovU[x];
          baseV[x] = ovV[x];
        }
      }
      baseY += base->pitch;
      baseU += base->pitch;
      baseV += base->pitch;

      ovY += overlay->pitch;
      ovU += overlay->pitch;
      ovV += overlay->pitch;

    }
  } else {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        if (ovY[x] > baseY[x] )  {  // Lighten - blend
          baseY[x] = (BYTE)(((inv_opacity*baseY[x]) + (opacity*ovY[x]+128))>>8);
          baseU[x] = (BYTE)(((inv_opacity*baseU[x]) + (opacity*ovU[x]+128))>>8);
          baseV[x] = (BYTE)(((inv_opacity*baseV[x]) + (opacity*ovV[x]+128))>>8);
        }
      }
      baseY += base->pitch;
      baseU += base->pitch;
      baseV += base->pitch;

      ovY += overlay->pitch;
      ovU += overlay->pitch;
      ovV += overlay->pitch;
    }
  }
}

