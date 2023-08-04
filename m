Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54901770173
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 15:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F021C10E6FE;
	Fri,  4 Aug 2023 13:27:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949410E6FE
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 13:27:26 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-579de633419so22919617b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691155646; x=1691760446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KHLJDOJiwUWkkuzywwWoYlPRzSI59IdgN9uUprOdvS4=;
 b=Z7qvBF+9IToP1e/q3P9hlS+7O0IXRwa0ARz/Io+MFpJjfNDc7FrMMbOotL2DIhd/ap
 9ztcUB2AmlIP19tIK6wdNj8Fm76cgX/HdQL2fk32fogcS10I3f8bUbJ8koCBaJEiNSLx
 poRdXzMtO61sl9mKrxuLijV3ylKjadz3e60/KUWFU2VyAgb5gkuZN5dZZ+3PRoZh1sRr
 WNv5oCC80xRnmIRszdQxqiDaTbZNvonCFk+0K6E/l7yzyCFaP3y6HM43hUzjAKe/3iby
 c6PcYLzXLszErwpOXmrBSX7XUFsnOb7FLCsVNQAsomZ3ePfNgdVljv1BcoLZkfHsgN5H
 kZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691155646; x=1691760446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHLJDOJiwUWkkuzywwWoYlPRzSI59IdgN9uUprOdvS4=;
 b=elS/HGi2kSqIuW3NCz4DsrvIrGKY2BnnS6EF5H7tlMQaKbA0gG++C+/BdaUcSmyZl0
 EZ4QzRZjtunOyDf0iHrbhwdHUVQ2LgsR/i9rT60AYyF3QCDD+oeu9cCwgH2CbXQJNna/
 F9TXoSbFRP524tsSmE/LiHkHaJvOTNDUjSxtMVlvhSs9jSo78LoUIGyh+y6Rp0CPanBW
 qaHn8tr3oIHZMfaRQQcyrBmgLTs7up3rd10IfBVf7rEHvpmtChIXEkr0mBaYjze083Vb
 Uq8zOncQGcx4TubI/m9xQ63avGRMUUmQXwOnRZ8P4L5dWKW/1aEIJcxYvKz1yhS8UY9l
 iJaw==
X-Gm-Message-State: AOJu0Yz93t/Y4GWBfWKNSlw1PInVVLecLqrDLJq+Wr5rJUfjawE56bAx
 PhK4SPMejOQYn/c+ul6qn1nGwoW2rDXQYsWr3r+ZbQ==
X-Google-Smtp-Source: AGHT+IH/FkCb7HPuSlEj8WY7xZu96aprRMPxL508HzHepMyfCZw3IIVrIuzK2Gg61bdKuYZUdU7C21ajWfrLaeCdtMY=
X-Received: by 2002:a25:ae94:0:b0:d3b:e659:5331 with SMTP id
 b20-20020a25ae94000000b00d3be6595331mr1539504ybj.58.1691155646088; Fri, 04
 Aug 2023 06:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 16:27:15 +0300
Message-ID: <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RFC v5 02/10] drm: Introduce solid fill DRM
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
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>
> struct drm_mode_solid_fill {
>         u32 version;
>         u32 r, g, b;
> };
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
>  include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
>  6 files changed, 154 insertions(+)
>

[skipped most of the patch]

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 43691058d28f..53c8efa5ad7f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>         char name[DRM_DISPLAY_MODE_LEN];
>  };
>
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fill_property()
> + *
> + * @version: Version of the blob. Currently, there is only support for version == 1
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + */
> +struct drm_mode_solid_fill {
> +       __u32 version;
> +       __u32 r;
> +       __u32 g;
> +       __u32 b;

Another thought about the drm_mode_solid_fill uABI. I still think we
should add alpha here. The reason is the following:

It is true that we have  drm_plane_state::alpha and the plane's
"alpha" property. However it is documented as "the plane-wide opacity
[...] It can be combined with pixel alpha. The pixel values in the
framebuffers are expected to not be pre-multiplied by the global alpha
associated to the plane.".

I can imagine a use case, when a user might want to enable plane-wide
opacity, set "pixel blend mode" to "Coverage" and then switch between
partially opaque framebuffer and partially opaque solid-fill without
touching the plane's alpha value.

-- 
With best wishes
Dmitry
