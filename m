Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE07668AD1
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 05:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5829010E984;
	Fri, 13 Jan 2023 04:23:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4F910E1D5
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 04:23:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j17so31434220lfr.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 20:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E3qVpAD4e4r2YgJT6QopKVtu7JfoDub68cT+znrlhg8=;
 b=g1sA+mRdgmsO8AavsUumHfQvlLAtB4VWYXXDCq1VVzPS/3nhZ0fXsMdyNXfCxkN4Px
 NAkp+2C1iN5sx/f49xoGjCrPBJHCZyugZ6Xt+Ox1mjao5V9sWHSK8LFAXfzHbwXtg3nC
 H4FqkcaaJHGoG+b6f00MIrTH95LvcwhSwWN068Gjcn9WOVVt9I3JUxVLsfW6Jjnb7JQU
 ErjD5maMc0S8NBiEn8iG5SD0lq5Txbq+ivp8B85ILpdPAwfObjm0jin09Z0p6ZcQf0yG
 Hq/ueqdpP2iEvYF3/VcAX1wr8GoVyfYfUf9wYdVJGsB5VgePWFw5C79Xkp3HcNOR+YhV
 t87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E3qVpAD4e4r2YgJT6QopKVtu7JfoDub68cT+znrlhg8=;
 b=AImHDGRJUBTYbdFMZ/fGCPPsSDyeV9ee+V77aPUXpVq+fIFXGZI7+4ZBIIXsHszxBY
 rdhERW4xq5HSmwOHqUS0XriSFtZSBnp7xywJT0KKrHbOL2/5JPPdPmk8a0ys3qBqKjQA
 BkflRQfCtPiwY8EpSKF8y2LjS9tbeJistRJB9v3/gz5RZ8ItD+i3cgQJCtTfFVXXf/dy
 JgT/xptoLd0sb3vi5WE8cc+J4GnxxyEXjXOAs1SNWYk2rdGnKQW+NkY5RauTlRsoA9XF
 Hi1r1wtksLXPSwXhZwQY74+Afm8KAhBEN7DfCL2qfdHaNYcOlZvH14R2HvK9WRBcg9vD
 Kg8Q==
X-Gm-Message-State: AFqh2kpmnkfxPgQczc0yNFLYu/ngyDOrYM8DH2Cm910+qFe2uaZZjWIq
 GIw+L0Q1M4TBvb7vIOTCAtD7eg==
X-Google-Smtp-Source: AMrXdXv/7anjVIOUNJ+YbJdMSEKH2cBrncksS4VLSL3bLyFOCJQTjCjx5DOLn66H/eEOHhRBYmPXnQ==
X-Received: by 2002:a05:6512:2316:b0:4ce:e95c:f300 with SMTP id
 o22-20020a056512231600b004cee95cf300mr918390lfu.39.1673583803336; 
 Thu, 12 Jan 2023 20:23:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a056512201a00b004ce437fe97dsm392242lfb.102.2023.01.12.20.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 20:23:22 -0800 (PST)
Message-ID: <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
Date: Fri, 13 Jan 2023 06:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Johan Hovold <johan@kernel.org>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Initialize mode_config earlier
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/01/2023 06:10, Bjorn Andersson wrote:
> Invoking drm_bridge_hpd_notify() on a drm_bridge with a HPD-enabled
> bridge_connector ends up in drm_bridge_connector_hpd_cb() calling
> drm_kms_helper_hotplug_event(), which assumes that the associated
> drm_device's mode_config.funcs is a valid pointer.
> 
> But in the MSM DisplayPort driver the HPD enablement happens at bind
> time and mode_config.funcs is initialized late in msm_drm_init(). This
> means that there's a window for hot plug events to dereference a NULL
> mode_config.funcs.
> 
> Move the assignment of mode_config.funcs before the bind, to avoid this
> scenario.

Cam we make DP driver not to report HPD events until the enable_hpd() 
was called? I think this is what was fixed by your internal_hpd patchset.

> 
> Reported-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ee2f60b6f09b..7ac670f3e6ab 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -438,6 +438,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	drm_mode_config_init(ddev);
>   
> +	ddev->mode_config.funcs = &mode_config_funcs;
> +	ddev->mode_config.helper_private = &mode_config_helper_funcs;
> +
>   	ret = msm_init_vram(ddev);
>   	if (ret)
>   		return ret;
> @@ -479,9 +482,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	drm_helper_move_panel_connectors_to_head(ddev);
>   
> -	ddev->mode_config.funcs = &mode_config_funcs;
> -	ddev->mode_config.helper_private = &mode_config_helper_funcs;
> -
>   	for (i = 0; i < priv->num_crtcs; i++) {
>   		/* initialize event thread */
>   		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;

-- 
With best wishes
Dmitry

