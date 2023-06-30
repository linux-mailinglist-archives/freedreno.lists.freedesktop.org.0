Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE75743DC0
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 16:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A9F10E496;
	Fri, 30 Jun 2023 14:43:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DD510E498
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688136222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvZD4FQLUnlXxffhuKkS+r9MjsWil0X++YtKAb3nCcE=;
 b=M+Y12xiOJmt+OlPXzscaUJ7vOAthzS6y5zhXS5B0dxn/HbijeTDMjcIcsO2sIJcZMgOOy0
 8TsGmX2dA408K4xCGLWdzuLXjsSeOebsaoCpT5hOzkdnxa6aKfob+X6mOEH+nruYHfC8b9
 FC4aYqML7cVenZRPo5hxJSj6Q95PnkU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-8rp53LFVMpuUjdZWUi3wjA-1; Fri, 30 Jun 2023 10:43:41 -0400
X-MC-Unique: 8rp53LFVMpuUjdZWUi3wjA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6ae3cb20cso19669801fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688136220; x=1690728220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvZD4FQLUnlXxffhuKkS+r9MjsWil0X++YtKAb3nCcE=;
 b=MclJHGyvHY4pPY9P8RRFJXPtCyVOQvuUOngXXsnxBYLiOoDfcLeBsf+R3uK0aevsll
 KAybcBdDf2FEmJtg/mzjSVxggt3y0n3+O5SxV56XvIYOQAjZywD0eQitE/4Ed8x2/Nta
 M/zhy6Ofj22UGX8T0gYgIT5ugGCg4gy2XOiLa/BFlNWvOtE030vVKGjdbPDX5C/4eUTL
 7ug/6BjNd/DSi/xBichYq06kpESWUj8e5htf8VZ9qGuFHO0pOmVZD2Vx8HVMHVJUlFkK
 iG4c7xG5ImsfJHpGU+/ml31sHthp4cKtrNvS3oH/9NiRimtW7/FAAL7A7Vm6/iSKzCFU
 6WQw==
X-Gm-Message-State: ABy/qLZ5hQ2SOvKF16NRCWxH7bNZwUimHHyGImJ16B1YLpYeI1SK1EHp
 8XX4TGX8FegHJAZVAjqeEcSiQ1Th492cMcApUwmjd0/23bidpkPedZX4WJlkpFNiIMJKjcPSuW2
 GmOfPXX0PHqt8Rmx2k46oglcPOc9YCZlilndr0Ny+iPJg
X-Received: by 2002:a2e:9d85:0:b0:2b4:491d:8d53 with SMTP id
 c5-20020a2e9d85000000b002b4491d8d53mr2367324ljj.45.1688136220027; 
 Fri, 30 Jun 2023 07:43:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgavJUdH7duXmcvQQov4AnuZ/xKAK8K78lXzmvT3PMlaUqpytORSrTrORhmgww+lELxLy86zIdAbtBvvgepic=
X-Received: by 2002:a2e:9d85:0:b0:2b4:491d:8d53 with SMTP id
 c5-20020a2e9d85000000b002b4491d8d53mr2367287ljj.45.1688136219566; Fri, 30 Jun
 2023 07:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 30 Jun 2023 16:43:28 +0200
Message-ID: <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM
 plane property
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
Cc: freedreno@lists.freedesktop.org, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 2:26=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
> Add support for pixel_source property to drm_plane and related
> documentation.
>
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
>
> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 21 ++++++++
>  5 files changed, 109 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index fe14be2bd2b2..86fb876efbe6 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm=
_plane_state *plane_state,
>
>         plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
>         plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> +       plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
>
>         if (plane_state->solid_fill_blob) {
>                 drm_property_blob_put(plane_state->solid_fill_blob);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a28b4ee79444..6e59c21af66b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>                 drm_property_blob_put(solid_fill);
>
>                 return ret;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               state->pixel_source =3D val;
>         } else if (property =3D=3D plane->alpha_property) {
>                 state->alpha =3D val;
>         } else if (property =3D=3D plane->blend_mode_property) {
> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane=
,
>         } else if (property =3D=3D plane->solid_fill_property) {
>                 *val =3D state->solid_fill_blob ?
>                         state->solid_fill_blob->base.id : 0;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               *val =3D state->pixel_source;
>         } else if (property =3D=3D plane->alpha_property) {
>                 *val =3D state->alpha;
>         } else if (property =3D=3D plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 38c3c5d6453a..8c100a957ee2 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -189,6 +189,18 @@
>   *     solid_fill is set up with drm_plane_create_solid_fill_property().=
 It
>   *     contains pixel data that drivers can use to fill a plane.
>   *
> + * pixel_source:
> + *     pixel_source is set up with drm_plane_create_pixel_source_propert=
y().
> + *     It is used to toggle the source of pixel data for the plane.
> + *
> + *     Possible values:
> + *
> + *     "FB":
> + *             Framebuffer source
> + *
> + *     "COLOR":
> + *             solid_fill source
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).
> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_=
plane *plane)
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> +
> +/**
> + * drm_plane_create_pixel_source_property - create a new pixel source pr=
operty
> + * @plane: drm plane
> + * @supported_sources: bitmask of supported pixel_sources for the driver=
 (NOT
> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will b=
e supported
> + *                     by default).
> + *
> + * This creates a new property describing the current source of pixel da=
ta for the
> + * plane.
> + *
> + * The property is exposed to userspace as an enumeration property calle=
d
> + * "pixel_source" and has the following enumeration values:
> + *
> + * "FB":
> + *     Framebuffer pixel source
> + *
> + * "COLOR":
> + *     Solid fill color pixel source

Can we add a "NONE" value?

I know it has been discussed earlier if we *need*  this and I don't
think we do. I just think it would be better API design to disable
planes this way than having to know that a framebuffer pixel source
with a NULL framebuffer disables the plane. Obviously also keep the
old behavior for backwards compatibility.

> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned int supported_sources=
)
> +{
> +       struct drm_device *dev =3D plane->dev;
> +       struct drm_property *prop;
> +       const struct drm_prop_enum_list enum_list[] =3D {
> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +               { DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> +       };
> +       unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOURCE_FB)=
 |
> +                                      BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);
> +       int i;
> +
> +       /* FB is supported by default */
> +       supported_sources |=3D BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +
> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> +               return -EINVAL;
> +
> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_sour=
ce",
> +                       hweight32(supported_sources));
> +
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> +               int ret;
> +
> +               if (!(BIT(enum_list[i].type) & supported_sources))
> +                       continue;
> +
> +               ret =3D drm_property_add_enum(prop, enum_list[i].type, en=
um_list[i].name);
> +
> +               if (ret) {
> +                       drm_property_destroy(dev, prop);
> +
> +                       return ret;
> +               }
> +       }
> +
> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SO=
URCE_FB);
> +       plane->pixel_source_property =3D prop;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 0338a860b9c8..31af7cfa5b1b 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>                                          unsigned int supported_modes);
>  int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned int supported_sources=
);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index f6ab313cb83e..73fb6cf8a5d9 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -59,6 +59,12 @@ struct drm_solid_fill {
>         uint32_t b;
>  };
>
> +enum drm_plane_pixel_source {
> +       DRM_PLANE_PIXEL_SOURCE_FB,
> +       DRM_PLANE_PIXEL_SOURCE_COLOR,
> +       DRM_PLANE_PIXEL_SOURCE_MAX
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -152,6 +158,14 @@ struct drm_plane_state {
>          */
>         struct drm_solid_fill solid_fill;
>
> +       /*
> +        * @pixel_source:
> +        *
> +        * Source of pixel information for the plane. See
> +        * drm_plane_create_pixel_source_property() for more details.
> +        */
> +       enum drm_plane_pixel_source pixel_source;
> +
>         /**
>          * @alpha:
>          * Opacity of the plane with 0 as completely transparent and 0xff=
ff as
> @@ -742,6 +756,13 @@ struct drm_plane {
>          */
>         struct drm_property *solid_fill_property;
>
> +       /*
> +        * @pixel_source_property:
> +        * Optional pixel_source property for this plane. See
> +        * drm_plane_create_pixel_source_property().
> +        */
> +       struct drm_property *pixel_source_property;
> +
>         /**
>          * @alpha_property:
>          * Optional alpha property for this plane. See
>
> --
> 2.41.0
>

