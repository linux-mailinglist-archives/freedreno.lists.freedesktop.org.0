Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE67AD619
	for <lists+freedreno@lfdr.de>; Mon, 25 Sep 2023 12:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952A10E230;
	Mon, 25 Sep 2023 10:35:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978F10E230
 for <freedreno@lists.freedesktop.org>; Mon, 25 Sep 2023 10:35:05 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59c268676a9so72696507b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Sep 2023 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695638104; x=1696242904; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gaXJJ8nVHztTAIAYbpwSJZ/6Vi3Ys0Sfbd7EeBK57WQ=;
 b=bXpy+zJLfxXol2SiNwip9wrsCY868s4z2T2tmJe0cy06Z2I0dG9MrsfOce/0wyBY0x
 qbNg+vCq/Xu/H1CxLUpUMfNNx+RmZ+IJ8MQvMKyj9kWc7eOT1iw2qIz+dEv2TFf75yQo
 o03YyxYxk7fvQcuNXQA78952YepojVlrLG40yZZkX+GXG9SQl2Z5zidZ3jGo2EyYMFOn
 j5fMz2GlpGetMGp+lW2GOd0HWmco1iIbcnwBE8hRis4p2WsGD5mL9UKohbJoGodVwrXQ
 xB+TRXsaww7scQIAEeAlVMlfavYa1NXxBWfvXnvHzGmzWVFh03H6d8sJ6xfXIagcGmiF
 cx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695638104; x=1696242904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gaXJJ8nVHztTAIAYbpwSJZ/6Vi3Ys0Sfbd7EeBK57WQ=;
 b=ThLFd2uCNgMn659XvBs+1ezKsq5M9DrRdnSRT2MZ8iilrRvkO7c9lM4dbq3ZgVpIgp
 ryypci62Mu15qwW0JbMZS3z6Dc8XBafKFc3Nb/04THOFip5nnfzjKOBMTamk5riYiAdV
 NKq3G2/n+05J6eM9PwsVs096SVoImmcDDKH5HwVPp+rG8UaaxsE8hM/YRO/gklDi9/ge
 cwon33PrTo2JzkJoVeqigHCGGZ+O6XBZ0JDf7qIomRdOKCRXV6h4sILapttSQ7qCUBKQ
 BDnCcDYRLnPuM8TVI1GXWPWswh1TLkh045n0yWut5ldgRWuQ10kdfHKqPoEe3WzUDHZW
 eyXw==
X-Gm-Message-State: AOJu0Yw1WmHNVYRXqAcnGzeUQ3VpdNB4ryh4MrJmrJ/+RGeGQFx7Z0Af
 mG+LZD7nTbhH/K/bTRtunq76lMiKBFry6z71pj7mcw==
X-Google-Smtp-Source: AGHT+IGrbyEUltQPUjUpCD+BkCXyKLkEZTcGnoTcl/FQO2ImgXXXiStiF0PC1jRl1ouEnQ0iEZat0qQwZavSoOSosbU=
X-Received: by 2002:a05:690c:e1c:b0:59f:4e6d:b56a with SMTP id
 cp28-20020a05690c0e1c00b0059f4e6db56amr5547142ywb.2.1695638103990; Mon, 25
 Sep 2023 03:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-9-a820efcce852@quicinc.com>
In-Reply-To: <20230828-solid-fill-v6-9-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Sep 2023 13:34:43 +0300
Message-ID: <CAA8EJpq4FE5AxOAYN+cQM3PB+cvvEVHTn25GONjT7R4d6J1U6A@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RFC v6 09/10] drm/msm/dpu: Use DRM
 solid_fill property
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

On Tue, 29 Aug 2023 at 03:06, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
> determine if the plane is solid fill. In addition drop the DPU plane
> color_fill field as we can now use drm_plane_state.solid_fill instead,
> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
> allow userspace to configure the alpha value for the solid fill color.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 +++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 114c803ff99b..639ecbeeacf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,7 +42,6 @@
>  #define SHARP_SMOOTH_THR_DEFAULT       8
>  #define SHARP_NOISE_THR_DEFAULT        2
>
> -#define DPU_PLANE_COLOR_FILL_FLAG      BIT(31)
>  #define DPU_ZPOS_MAX 255
>
>  /*
> @@ -82,7 +81,6 @@ struct dpu_plane {
>
>         enum dpu_sspp pipe;
>
> -       uint32_t color_fill;
>         bool is_error;
>         bool is_rt_pipe;
>         const struct dpu_mdss_cfg *catalog;
> @@ -606,19 +604,35 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>         _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
>  }
>
> +static uint32_t _dpu_plane_get_abgr_fill_color(struct drm_plane_state *state)
> +{
> +       struct drm_solid_fill solid_fill = state->solid_fill;
> +
> +       uint32_t ret = 0;
> +       uint8_t a = state->alpha & 0xFF;
> +       uint8_t b = solid_fill.b >> 24;
> +       uint8_t g = solid_fill.g >> 24;
> +       uint8_t r = solid_fill.r >> 24;
> +
> +       ret |= a << 24;
> +       ret |= b << 16;
> +       ret |= g << 8;
> +       ret |= r;
> +
> +       return ret;
> +}
> +
>  /**
>   * _dpu_plane_color_fill - enables color fill on plane
>   * @pdpu:   Pointer to DPU plane object
>   * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
>   * @alpha:  8-bit fill alpha value, 255 selects 100% alpha

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:632: warning: Excess
function parameter 'alpha' description in '_dpu_plane_color_fill'


>   */
> -static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
> -               uint32_t color, uint32_t alpha)
> +static void _dpu_plane_color_fill(struct dpu_plane *pdpu, uint32_t color)
>  {
>         const struct dpu_format *fmt;
>         const struct drm_plane *plane = &pdpu->base;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> -       u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
>
>         DPU_DEBUG_PLANE(pdpu, "\n");
>
> @@ -633,11 +647,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>
>         /* update sspp */
>         _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -                                  fill_color, fmt);
> +                                  color, fmt);
>
>         if (pstate->r_pipe.sspp)
>                 _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> -                                          fill_color, fmt);
> +                                          color, fmt);
>  }
>
>  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -976,10 +990,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>          */
>         if (pdpu->is_error)
>                 /* force white frame with 100% alpha pipe output on error */
> -               _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> -               /* force 100% alpha */
> -               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +               _dpu_plane_color_fill(pdpu, 0xFFFFFFFF);
> +       else if (drm_plane_solid_fill_enabled(plane->state))
> +               _dpu_plane_color_fill(pdpu, _dpu_plane_get_abgr_fill_color(plane->state));
>         else {
>                 dpu_plane_flush_csc(pdpu, &pstate->pipe);
>                 dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> @@ -1024,7 +1037,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>         }
>
>         /* override for color fill */
> -       if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> +       if (drm_plane_solid_fill_enabled(plane->state)) {
>                 _dpu_plane_set_qos_ctrl(plane, pipe, false);
>
>                 /* skip remaining processing on color fill */
>
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
