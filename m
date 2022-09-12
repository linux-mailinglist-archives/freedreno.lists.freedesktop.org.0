Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835A5B5FB0
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 19:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9425210E03B;
	Mon, 12 Sep 2022 17:59:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2A10E04C
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 17:59:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y29so11504769ljq.7
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gY3yxu1ESuLTH+rFoedO2iickM2TO6Q0hqHsiCe2Ku4=;
 b=wYpcprvARNdYcXgSJt3ZWMMwP1MsNWeiJhjE1d1nRwLzuWDJzFFJ9P5TPtcaRAsgvi
 8rBqiBy05mg1wceEso9dDYtdMo1v+zDsFdbISALDSwEv+z8A6pcfkeQn+pbUAsEOlveJ
 F1YxtO90PtnKuD02p2YH/uI7JJhkAxR5DBSXQ3aFOrGZ3myQO2Gh3ShInwLxQFoJnDkW
 SBmbgKTzmBLaCv7uwIge4yGuMx8yq2qYiOVPyNkT8QoOWUK+BKtZeR6zerNogFU66zRz
 9H91hFfyr4WABE3FE7mmqbv4/7S/Qw7u7p926bvMROK4uuLpPcjO/xMF0eCSoplyHOME
 8AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gY3yxu1ESuLTH+rFoedO2iickM2TO6Q0hqHsiCe2Ku4=;
 b=v5K6VZGaaYr1hjJv0+zziIeB8PpsU5/4Iq0Ic2QEgq+8h0YEt+d8/0uaHoBqNc6871
 nznecZMXZyeywN1BaHtbJOh3wlxNsJq/dM2Q4pOEYfOINRifD7rBpXCS47b93z31Qdrg
 VR+VyWYHAkXjQnsS38ABRcjV1KXskcoMyKdMw78a1UW2ay1pYChNhatheH8egRniY6cT
 AOapk+9Iz8iHW2Hj3JXRpE8NBrvC3Wn+e/57a0Mk5mGDlCMNN1hrwRtfYLA0FC67qIaq
 p4aWHMrRkzqa/ITziWG89hhFYaswhgwKEh8mT9tWuIUSsR+Itm1GiJ0QjVX13VJsJqWc
 jQdg==
X-Gm-Message-State: ACgBeo2ekJYf4hY8RCADvVdFunjUPmpfbsXBxPwVWWJWUX+AxtMTJzsT
 Cvn+vnuMN/KDBn2DdCLKTimY7w==
X-Google-Smtp-Source: AA6agR4VksOY8OzBgoRlszD2ydAjq5P8zmjOf9DeDDMq1Ex1NRMA9d8g9FQjBRLjWR/w5X/3ahn7Dg==
X-Received: by 2002:a2e:9681:0:b0:261:c515:2b13 with SMTP id
 q1-20020a2e9681000000b00261c5152b13mr8229151lji.210.1663005544796; 
 Mon, 12 Sep 2022 10:59:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a05651c032200b002618e5c2664sm1176437ljp.103.2022.09.12.10.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 10:59:04 -0700 (PDT)
Message-ID: <5aac31ea-fdf0-268e-5c6a-bd89b3dad79a@linaro.org>
Date: Mon, 12 Sep 2022 20:59:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-7-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/7] drm/msm/hdmi: fix IRQ lifetime
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 18:40, Johan Hovold wrote:
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
> 
> This is specifically true for the HDMI IRQ, which will otherwise remain
> requested so that the next bind attempt fails when requesting the IRQ a
> second time.
> 
> Fix this by tying the device-managed lifetime of the HDMI IRQ to the DRM
> device so that it is released when bind fails.
> 
> Fixes: 067fef372c73 ("drm/msm/hdmi: refactor bind/init")
> Cc: stable@vger.kernel.org      # 3.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index a0ed6aa8e4e1..f28fb21e3891 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -344,7 +344,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   		goto fail;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, hdmi->irq,
> +	ret = devm_request_irq(dev->dev, hdmi->irq,
>   			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>   			"hdmi_isr", hdmi);
>   	if (ret < 0) {

-- 
With best wishes
Dmitry

