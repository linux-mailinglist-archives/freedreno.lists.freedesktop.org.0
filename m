Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BE9F8BEF
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 06:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6391510EEBC;
	Fri, 20 Dec 2024 05:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ghHsurDD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4EC10EEC7
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 05:44:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso1674307e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734673450; x=1735278250; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
 b=ghHsurDD9hNIhrBg1YPx2VInZbYsi8HfNi72TwnPYSumiv2CsaDhx3DBpfdeOm99h9
 bFVdxPkHCPFtYhMA2h9S+eOzJrxwSi9ZPzcx87OUOzsbF0P78uahZwlH3BCWZmBwyMn7
 S73V76Jah5UznC3Lqzk1YaOhPnwfnCtnlIDr167bxg1I1UlMFAldtqZvUlSfloL+QOxA
 D6jBlnqlxDXOk+2Ce/Pzz4O2Z7HSrJyQWtLlG7UUIfEASzCNOuV9UIb0UTXgnNCpf2hY
 26tmyNxc7DB7yE+tey1hGYNTSfViSZwzV4+Ucm0OQZ4ZVlc/y9g6x6nmuboUnanCtGfT
 3rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734673450; x=1735278250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFCI50HxO0YjIkrdRDdASpuN36VkzFYj3QrjgcaAwJg=;
 b=Q03J+EzCbbRUX87UKaIv706KgJDuzRsYhQDuK4b78wMdhypzUdk9+Ue3L1BAuTCqkU
 1dOMn4j2xmU9SAqbk08ymJZwf3Qvh8sHIP/NLKoGvdH+clMnnTtAzagjI76Mc0JK+9JT
 TDWkgpptapQpoaRz/OTqL0Tg/qD+PTO3BGXxKxn3rj1ozGD+TLgCAu9dKq4LHk7wA28j
 t1T3uD+xV5Gm/NqflHySfg+lE1x0cibYyhS7OU17TTshwkQSgXr2VyJ+ZTkKU3PznESw
 M+IMZWKzk8mMpuaQeWTMKuCVW37hKllbU/QrWsPUQ7sX5eq4kqB4cidKQR/jrOv/n1Z1
 z6Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdX2iy6XBVKkTdpirG7FngBiRi27rVuwOaYNjFNh+6ntl5bZnJjGPqZvA7YwUwUxDsZxc0jkEx+vg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmU9/VczOxC9ORp8hNAbk8lVWrzVmWTXzRiyFGqHfCSAHI+r3D
 XffNJzG4d6MdE7jyk7aO1uByPznE4+jZhPiWg4kQqrUz5Ngl2puC+bwHoEBlIuQ=
X-Gm-Gg: ASbGncszxhPwO8kRK4nxlHf4ceu4JyAOX7IRgyEQ/kLp5XDO+KxStX6ur9fMcwXjIAh
 MEudjQnKP8sqtz3MOd5TsDRMxIB5QlLRt1ow6TaCkJRXVL/8HmAL2I3m+iudn9AXD/5xRU9V7FQ
 NA5YSjOw+OVR0N7TE1oiZZl0vhI3h/TrtIGpJ+6AhmHgj6IDxYx4ZUyiIxkx9jPfH52KLuuSqBs
 XT/ASg3zqYm14CuN6Q+fQivoVREvNny7uSdf3bXwP1MaIrX3hXJh2dquyNI9f1FQNnaAb18PE6D
 rokxpK6Ow9zVQ72PW8fhJ1jLoxR3uxLv7KMK
X-Google-Smtp-Source: AGHT+IG1bm19MGRUcfrW96Z6d6TtKC4b/8GqwGpE6HtAltw9S1z+lUZCzMntZDup7UjIvLEdtD1Wjw==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id
 2adb3069b0e04-542295989femr303192e87.52.1734673450312; 
 Thu, 19 Dec 2024 21:44:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238215f2sm377633e87.199.2024.12.19.21.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:44:09 -0800 (PST)
Date: Fri, 20 Dec 2024 07:44:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Message-ID: <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
> We cannot support both CWB and CDM simultaneously as this would require
> 2 CDM blocks and currently our hardware only supports 1 CDM block at
> most.

Why would CWB require a second CDM block? I think that YUV output over
DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
work. Am I wrong?

> 
> Thus return an error if both CWB and CDM are enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9bb920d28bae2706b3892c167fe2bec3fd8857f4..a6372eee916e8aba702bbefc3615d8882ddcaad9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1261,6 +1261,10 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>  		return 0;
>  
>  	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
> +
> +	if (topology.cwb_enabled && topology.needs_cdm)
> +		return -EINVAL;
> +
>  	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>  			     crtc, &topology);
>  	if (ret)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
