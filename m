Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD876794E
	for <lists+freedreno@lfdr.de>; Sat, 29 Jul 2023 02:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D1510E7B2;
	Sat, 29 Jul 2023 00:04:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C57110E7AD
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 00:04:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-991c786369cso356938766b.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 17:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690589050; x=1691193850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfRG5rD0scPqsV1FykBsfcvR1VHSdVrA0sLu02AnWOM=;
 b=eUzCyV0J1fb+2uOtbl0SEoizsUk8+EHyYPjj46asco+D7r6nKAR5UdkQWLdBTxiBNR
 /kMUlDjX2Nx8COxm2TubVPSp8PwBvk74b0z67yuIFPL/D/Jl7Krlyzkw392cWq6g/5uX
 +k+lFYjONRxxC52gDChAF1VqCdQmWluIid4PmDezq2IuUUfHSlM1wsb3tMBGgRRTI5PR
 k3Fl5NkS71cYjavLyMhl5K65uVMyG/cIc1n03mDNl3KLZfYVSrgglB/AH6BW9XBHubIy
 YuqFnwAAvYtBvBKvofZ3GF5BvXTtr+OfKs0nxO39FO5OsaqA96RQ1YvjWwTmrSwxRswK
 RZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690589050; x=1691193850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfRG5rD0scPqsV1FykBsfcvR1VHSdVrA0sLu02AnWOM=;
 b=DxwyCTRS00CCprz1VZJD2ccXYzlzuZmp5JLAzgY5Wy+aK3ROmHoN1y4sLXCc5it9qG
 H3ZN9dbsmRnTkFm1aXC5ctWEDmFpgw73amz671jIftAtur1f/MizUFm/Bnv3IN3RslY2
 +Tl+pf+G+wi8GNWf0tiAgntiLJsNjxVPhm8dXkUZap24cmaLTB9knUHT20d9p8xREk62
 HBUqF/x6AKZBxLFccBjbynRS6YbiV4AtHKf+V10vM5OAqNH/laWOc8iPQFN5Qj79+966
 sVc8/xGvs9gYuE+mEhViUvkEU4ded4XamQBfFaDASTWXGpAwfYFK8s2BpYkONVa0fB0J
 zhtw==
X-Gm-Message-State: ABy/qLaLqSOlrwxqr+Ko08XyD/ji/QeCaD6eId2hus2QwZ0d4hXtTMu6
 /R2v4MBnyswd5+dDejKEbG59Vg==
X-Google-Smtp-Source: APBJJlGMAZ6zWddJfPSlsMqE6/T2h9lEEfiEuE7orHv0MziUXyZjseGTaz1a/33UmEYRkyhFTyDMzg==
X-Received: by 2002:a17:907:7850:b0:99b:44aa:fae0 with SMTP id
 lb16-20020a170907785000b0099b44aafae0mr610136ejc.21.1690589050045; 
 Fri, 28 Jul 2023 17:04:10 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a170906115200b00992665694f7sm2587634eja.107.2023.07.28.17.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 17:04:09 -0700 (PDT)
Message-ID: <de6abbcf-9c0d-f51e-b140-938f2c537f74@linaro.org>
Date: Sat, 29 Jul 2023 03:04:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-4-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-4-053dbefa909c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v5 04/10] drm/atomic: Add pixel source
 to plane state dump
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
Cc: sebastian.wick@redhat.com, contact@emersion.fr, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/07/2023 20:02, Jessica Zhang wrote:
> Add pixel source to the atomic plane state dump
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        |  1 +
>   drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>   drivers/gpu/drm/drm_plane.c         | 12 ++++++++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index b4c6ffc438da..c38014abc590 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -713,6 +713,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>   
>   	drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
>   	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
> +	drm_printf(p, "\tpixel-source=%s\n", drm_plane_get_pixel_source_name(state->pixel_source));
>   	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
>   	if (state->fb)
>   		drm_framebuffer_print_info(p, 2, state->fb);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 501a10edd0e1..75b59ec9f1be 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -38,6 +38,7 @@ enum drm_color_encoding;
>   enum drm_color_range;
>   enum drm_connector_force;
>   enum drm_mode_status;
> +enum drm_plane_pixel_source;
>   
>   struct drm_atomic_state;
>   struct drm_bridge;
> @@ -267,6 +268,7 @@ int drm_plane_check_pixel_format(struct drm_plane *plane,
>   				 u32 format, u64 modifier);
>   struct drm_mode_rect *
>   __drm_plane_get_damage_clips(const struct drm_plane_state *state);
> +const char *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_source);
>   
>   /* drm_bridge.c */
>   void drm_bridge_detach(struct drm_bridge *bridge);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index f342cf15412b..4188b3491625 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1487,6 +1487,18 @@ __drm_plane_get_damage_clips(const struct drm_plane_state *state)
>   					state->fb_damage_clips->data : NULL);
>   }
>   
> +const char *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_source)
> +{
> +	switch(pixel_source) {
> +	case DRM_PLANE_PIXEL_SOURCE_NONE:
> +		return "NONE";
> +	case DRM_PLANE_PIXEL_SOURCE_FB:
> +		return "fb";
> +	default:
> +		return "";
> +	}
> +}

Please use DRM_ENUM_NAME_FN instead.

> +
>   /**
>    * drm_plane_get_damage_clips - Returns damage clips.
>    * @state: Plane state.
> 

-- 
With best wishes
Dmitry

