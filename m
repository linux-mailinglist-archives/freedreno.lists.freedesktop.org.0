Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE2984EA6
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012C10E777;
	Tue, 24 Sep 2024 23:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bbEiEIVS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609110E797
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:06:40 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5356ab89665so7267981e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219199; x=1727823999; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ot0UCcvaEAKPUSxY4CDMqGuFsrwzINAe5eEjab+YIEg=;
 b=bbEiEIVSsBRv4zZNw3/317dSSJzPhSt3wXQEql7RLN46qaupJvoAp/6LstYtOdrwyR
 OEyL5YhqI6UQexOnTluG6Yb7MNzypvo2RM7QjUyAFM9+KWYtCcHnHE/3/Ps6CuGYJpdf
 7imBJpvqoWZC+EstrQKJx+bWqVkOL3NBjjincXqzH4bFXIeYEV4Z95iLWk3Hxusovy+5
 a11iMynxb17DCP8nW072V4/QMcJ7bwDvXn5XBMhVqd/yBBiuoeRzGvja7Fowzuo3pa+U
 Iv9xXj4f/hONXg+ap23fLx88WWkcSVstgVZ8oIKzcfDbHXEWLkblWxXUF9dwpNqHhZbj
 TZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219199; x=1727823999;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ot0UCcvaEAKPUSxY4CDMqGuFsrwzINAe5eEjab+YIEg=;
 b=XuW5t2hKZvnLAfQo8cfMXufpPVHouXLVRtjQHbsECCnbnpUvN3X90mr402AEvYl1rq
 GUOJ1u3xWiQTuBCIVZN2+jtb9ehi4QHawgWorRfp/dUQ1kq3J6OINS15HLYl7DEg/14O
 Tltq/g1SQy46F2roct85vUjsGVhJGYkYz+CWjrKvqc2C0IiNum02r75KJi6OgPGiB3pL
 PgWOE1powsN8bHZ6FWYRzPJB9zOKUwE4Dm2DPqHqXsCznxZSQSmn2HF4729ZFR2cbKhH
 XnsnDdglyvp9xQG5K9UFwPd3VtIp2g4eFrJZRHwnWkQmMqKywa2E6KocL1hpE5nuwZT4
 nX1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX1cae6bdRhyuhlVAbnxlKznqx22RAISVDpBTKNiZ+zQDmIP23mQGI7CoI3h8GZXsO93Q/IPQscg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXnMOyiRxOTVV0OwVOvM9sWU7TRL7AoFQpQnzvu1gtTfY8P1N8
 dxURxqaKVRsq2vp0fZTujG7ouY28Rzz7AZ3iLYK5rD/vejiiCSyKiTSGQWHeyfM=
X-Google-Smtp-Source: AGHT+IGdSmMW42umh+q5VuXZORxUx2TV5lqbdEctn2Rn3L/TYI6A/pArZFkotNwLnY3N3aHG3FKpiw==
X-Received: by 2002:ac2:568c:0:b0:536:9ef0:d854 with SMTP id
 2adb3069b0e04-53877530b7emr326255e87.32.1727219198658; 
 Tue, 24 Sep 2024 16:06:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864e26dsm354725e87.295.2024.09.24.16.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:06:38 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 01/22] drm: add clone mode check for CRTC
Message-ID: <y2apz5arp5d7jv2fqujh2qyl2gqovmpvkpvpvpxewitfcreke2@ihung7uzmcwu>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Sep 24, 2024 at 03:59:17PM GMT, Jessica Zhang wrote:
> Add helper to check if the given CRTC state is in clone mode
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/drm_crtc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..ecb93e2c4afc 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>  
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);

Missing kerneldoc

> +static inline bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
> +{
> +	if (!crtc_state)
> +		return false;
> +
> +	return hweight32(crtc_state->encoder_mask) > 1;
> +}
>  
>  #endif /* __DRM_CRTC_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
