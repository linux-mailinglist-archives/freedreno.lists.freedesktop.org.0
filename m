Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B77CF593
	for <lists+freedreno@lfdr.de>; Thu, 19 Oct 2023 12:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039A110E4C0;
	Thu, 19 Oct 2023 10:45:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171AC10E4BA
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697712331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ua/yfYpU7+zl1l3SSe5ziWE4vmE5rVSZxbl9iCkPeqA=;
 b=hyDsgoZpV6muSYB/kk3xG4/1q4jo6kVsdnAS2fUioTfiAp+hzbId7Zwuz8rBGZBV6znt2t
 Futqt3aUTRfZofI3ssheh54WXgUb5nC38KDJmKgl5NNeTtJwrsRbUmUcZ8PqJEFY6TuTX4
 1wuUuVK5hEeLQorCFbcDcdOd7lj5CRM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-PBdULL3oMsWlIAdQGrjWdg-1; Thu, 19 Oct 2023 06:45:29 -0400
X-MC-Unique: PBdULL3oMsWlIAdQGrjWdg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-323334992fbso4783842f8f.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 03:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697712328; x=1698317128;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ua/yfYpU7+zl1l3SSe5ziWE4vmE5rVSZxbl9iCkPeqA=;
 b=aMiGHum7R6rX3UXvWmQMwK1t4zjp7ggoQtYXlBDQCja9KdNyo8yLGLt0osWMycrzzs
 SM2keyw7W5q3q1ldwqrm5AD2TiL4YxRT6Q6Y0N/IJMDmMTFDy8X2kxPAQeCV92VyC7qW
 R7uH+csc/eP94UXCSILCOZewzD7F0bdb8EiGG3nSy5ER7I8rRSKO1JDuJkm6NB8uib5M
 L0z+H9eDtvQ5b3bcX3QGP8BJkKLKyC+E+BPNf7yPA2fjTz8kQZFuxRmBxEF1GATEK1pt
 pvURy4tTwLd/EX3LmOZniBXNsos5S7gRGSNtlkV6Z0oou3VTrTvyx0ISs17csLcNZpsy
 zNNQ==
X-Gm-Message-State: AOJu0YypNM+eXz+BhMRir2GuVDQJV0tQABxbajsE7cf8VBtlQwF+FdZ7
 dKNOgN5mzrGG3x8cCxgierhhm2NJPLVD5b1aSW0v48BDwaWlUa00acbBgTrOTM4ofdKqnf3sgi1
 Y4ufZwZ8Mc+afONE9PsnuQe55cE7q
X-Received: by 2002:a5d:4f06:0:b0:31f:dc60:13b5 with SMTP id
 c6-20020a5d4f06000000b0031fdc6013b5mr1137639wru.25.1697712328759; 
 Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG25/eVk9iv4COKDv+qQlPbnnRO8EIl418/81iMMJYQzOMP8gUFG61SSFa31vdA9nVeHX3V5A==
X-Received: by 2002:a5d:4f06:0:b0:31f:dc60:13b5 with SMTP id
 c6-20020a5d4f06000000b0031fdc6013b5mr1137614wru.25.1697712328383; 
 Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
Received: from toolbox ([2001:9e8:89b6:9600:497b:a355:d2a9:2bb])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d630b000000b00327bf4f2f14sm4172028wru.88.2023.10.19.03.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 03:45:28 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:45:26 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20231019104526.GA755220@toolbox>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
 <20230829104816.19122c6d@eldfell>
MIME-Version: 1.0
In-Reply-To: <20230829104816.19122c6d@eldfell>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Freedreno] [PATCH RFC v6 01/10] drm: Introduce pixel_source
 DRM plane property
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, contact@emersion.fr,
 David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 10:48:16AM +0300, Pekka Paalanen wrote:
> On Mon, 28 Aug 2023 17:05:07 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
> > Add support for pixel_source property to drm_plane and related
> > documentation. In addition, force pixel_source to
> > DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
> > legacy userspace.
> > 
> > This enum property will allow user to specify a pixel source for the
> > plane. Possible pixel sources will be defined in the
> > drm_plane_pixel_source enum.
> > 
> > Currently, the only pixel sources are DRM_PLANE_PIXEL_SOURCE_FB (the
> > default value) and DRM_PLANE_PIXEL_SOURCE_NONE.
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >  drivers/gpu/drm/drm_blend.c               | 90 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_plane.c               | 19 +++++--
> >  include/drm/drm_blend.h                   |  2 +
> >  include/drm/drm_plane.h                   | 21 ++++++++
> >  6 files changed, 133 insertions(+), 4 deletions(-)
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index 6e74de833466..c3c57bae06b7 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -185,6 +185,21 @@
> >   *		 plane does not expose the "alpha" property, then this is
> >   *		 assumed to be 1.0
> >   *
> > + * pixel_source:
> > + *	pixel_source is set up with drm_plane_create_pixel_source_property().
> > + *	It is used to toggle the active source of pixel data for the plane.
> > + *	The plane will only display data from the set pixel_source -- any
> > + *	data from other sources will be ignored.
> > + *
> > + *	Possible values:
> > + *
> > + *	"NONE":
> > + *		No active pixel source.
> > + *		Committing with a NONE pixel source will disable the plane.
> > + *
> > + *	"FB":
> > + *		Framebuffer source set by the "FB_ID" property.
> > + *
> >   * Note that all the property extensions described here apply either to the
> >   * plane or the CRTC (e.g. for the background color, which currently is not
> >   * exposed and assumed to be black).
> 
> This UAPI:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks Jessica, same for me

Acked-by: Sebastian Wick <sebastian@sebastianwick.net>

> 
> 
> Thanks,
> pq


