Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE630767338
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 19:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928010E212;
	Fri, 28 Jul 2023 17:24:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B010E0E0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 17:24:35 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a43cbb4343so1599482b6e.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690565075; x=1691169875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wJeVlocXBXh1Q6nOIAJsDIEk2F6znGH2kHNksLZzN1Q=;
 b=Pg8gKO8/8Lwq3k8dGRLLauuvs5aW28j/op5TAaL8RsbhDAEpfzVkgGIj1iVjL4uTlk
 lwXWpBUpeTw+2XZj7T8OE3EMMMA+jtRh/5Iio7xeLYZtKIhPlAq43sE5vOuWjmIErrnm
 2hoAaTsKh4/DfvHHlm7X1s5uKKk2fOe6DxpV9mRLPv3YHyWyMmGetLpD33ahGSbUe3SV
 JnGntjf1KLkzp0TxLqd7QJRIsKQBzUubEdtNvRH2wf6rK72EumZValrsI3d/oldcSaKb
 RbOcOXvWWX0X3sBwKFQxjRX2M4+js8/GBSy+Dp85klqIeDGhxHFcruuLOnpHDmDhmPHE
 mosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690565075; x=1691169875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJeVlocXBXh1Q6nOIAJsDIEk2F6znGH2kHNksLZzN1Q=;
 b=GeZ3XiKU4/7rJ/1RcgmbFmte6t5n8dNEmzIJ93cQVw2I3pQc4soZP3kH+YbAiqGCBi
 OspxiVu5TGdn6dwRkIcp+doTVJJ86r8UjXa++V8TrmwEACmUIPsrN7U+PYwxEqH5CKNr
 GzlkSUGnNG5bICZSOBynVJSlAvpHTHyQPKYLr8N5lP5kznNR8TDD8Am9Cn5kr0X+pKSt
 p5wKEVAMaH+ma583Or7C40dfiAVL3WAheZjpVj/sDXCRcUd0Rl9DVuc8PgwxyXyWDGcK
 awk+zqpXa4/lOBDOJezoajaATlDgGcB1v1tnqJEwwGmxQjuU7egEXytWQAU++G+UGQ9u
 PKEA==
X-Gm-Message-State: ABy/qLY/CcCQsjSr4htWjw6s9wUtse1vP3mUPkssTGcCq6Cg9EDMU/wO
 PmbcEWI3OVAyRpTnfddTMklZrGjLS90jJu2d+scPoA==
X-Google-Smtp-Source: APBJJlHHXAwUiUytYr6QPDMCF/le/8iTrYaSBFWAZaWtK4iX/GDCm63xmmDtaGIX5M+Lesi58xGKEtOs6ykxszpPntU=
X-Received: by 2002:a05:6358:2808:b0:137:7803:7e37 with SMTP id
 k8-20020a056358280800b0013778037e37mr1465100rwb.15.1690565074711; Fri, 28 Jul
 2023 10:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 20:24:23 +0300
Message-ID: <CAA8EJpqHyacAjdtsFrbp4gVOpVwCAPf0ZcCT1waxyfJ8cOW-Kg@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RFC v5 01/10] drm: Introduce pixel_source
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
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 contact@emersion.fr, Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for pixel_source property to drm_plane and related
> documentation. In addition, force pixel_source to
> DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
> legacy userspace.
>
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
>
> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_NONE and
> DRM_PLANE_PIXEL_SOURCE_FB with *_PIXEL_SOURCE_FB being the default value.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_blend.c               | 85 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c               |  3 ++
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 21 ++++++++
>  6 files changed, 116 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 784e63d70a42..01638c51ce0a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>
>         plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>         plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> +       plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>
>         if (plane->color_encoding_property) {
>                 if (!drm_object_property_get_default_value(&plane->base,
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index d867e7f9f2cd..454f980e16c9 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -544,6 +544,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>                 state->src_w = val;
>         } else if (property == config->prop_src_h) {
>                 state->src_h = val;
> +       } else if (property == plane->pixel_source_property) {
> +               state->pixel_source = val;
>         } else if (property == plane->alpha_property) {
>                 state->alpha = val;
>         } else if (property == plane->blend_mode_property) {
> @@ -616,6 +618,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>                 *val = state->src_w;
>         } else if (property == config->prop_src_h) {
>                 *val = state->src_h;
> +       } else if (property == plane->pixel_source_property) {
> +               *val = state->pixel_source;
>         } else if (property == plane->alpha_property) {
>                 *val = state->alpha;
>         } else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..c500310a3d09 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,21 @@
>   *              plane does not expose the "alpha" property, then this is
>   *              assumed to be 1.0
>   *
> + * pixel_source:
> + *     pixel_source is set up with drm_plane_create_pixel_source_property().
> + *     It is used to toggle the active source of pixel data for the plane.
> + *     The plane will only display data from the set pixel_source -- any
> + *     data from other sources will be ignored.
> + *
> + *     Possible values:
> + *
> + *     "NONE":
> + *             No active pixel source.
> + *             Committing with a NONE pixel source will disable the plane.
> + *
> + *     "FB":
> + *             Framebuffer source set by the "FB_ID" property.
> + *
>   * Note that all the property extensions described here apply either to the
>   * plane or the CRTC (e.g. for the background color, which currently is not
>   * exposed and assumed to be black).
> @@ -615,3 +630,73 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +/**
> + * drm_plane_create_pixel_source_property - create a new pixel source property
> + * @plane: DRM plane
> + * @extra_sources: Bitmask of additional supported pixel_sources for the driver.
> + *                DRM_PLANE_PIXEL_SOURCE_FB always be enabled as a supported
> + *                source.
> + *
> + * This creates a new property describing the current source of pixel data for the
> + * plane. The pixel_source will be initialized as DRM_PLANE_PIXEL_SOURCE_FB by default.
> + *
> + * Drivers can set a custom default source by overriding the pixel_source value in
> + * drm_plane_funcs.reset()
> + *
> + * The property is exposed to userspace as an enumeration property called
> + * "pixel_source" and has the following enumeration values:
> + *
> + * "NONE":
> + *      No active pixel source
> + *
> + * "FB":
> + *     Framebuffer pixel source
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned long extra_sources)
> +{
> +       struct drm_device *dev = plane->dev;
> +       struct drm_property *prop;
> +       static const struct drm_prop_enum_list enum_list[] = {
> +               { DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +       };
> +       static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +       int i;
> +
> +       /* FB is supported by default */
> +       unsigned long supported_sources = extra_sources | BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +
> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> +               return -EINVAL;
> +
> +       prop = drm_property_create(dev, DRM_MODE_PROP_ENUM | DRM_MODE_PROP_ATOMIC, "pixel_source",
> +                       hweight32(supported_sources));
> +
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
> +               int ret;
> +
> +               if (!test_bit(enum_list[i].type, &supported_sources))
> +                       continue;
> +
> +               ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
> +               if (ret) {
> +                       drm_property_destroy(dev, prop);
> +
> +                       return ret;
> +               }
> +       }
> +
> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
> +       plane->pixel_source_property = prop;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..f342cf15412b 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -987,6 +987,9 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
>                 return -ENOENT;
>         }
>
> +       if (plane->state && plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB)
> +               plane->state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;

Nit: you are going to set the value anyway. So the second condition
can be dropped.

LGTM otherwise.

> +
>         if (plane_req->fb_id) {
>                 fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
>                 if (!fb) {
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..122bbfbaae33 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>                               struct drm_atomic_state *state);
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>                                          unsigned int supported_modes);
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned long extra_sources);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..89508b4dea4a 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -40,6 +40,12 @@ enum drm_scaling_filter {
>         DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>  };
>
> +enum drm_plane_pixel_source {
> +       DRM_PLANE_PIXEL_SOURCE_NONE,
> +       DRM_PLANE_PIXEL_SOURCE_FB,
> +       DRM_PLANE_PIXEL_SOURCE_MAX
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -116,6 +122,14 @@ struct drm_plane_state {
>         /** @src_h: height of visible portion of plane (in 16.16) */
>         uint32_t src_h, src_w;
>
> +       /**
> +        * @pixel_source:
> +        *
> +        * Source of pixel information for the plane. See
> +        * drm_plane_create_pixel_source_property() for more details.
> +        */
> +       enum drm_plane_pixel_source pixel_source;
> +
>         /**
>          * @alpha:
>          * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -699,6 +713,13 @@ struct drm_plane {
>          */
>         struct drm_plane_state *state;
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


-- 
With best wishes
Dmitry
