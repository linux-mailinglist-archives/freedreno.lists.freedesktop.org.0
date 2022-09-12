Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B925B5FD8
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 20:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D5210E08A;
	Mon, 12 Sep 2022 18:06:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE8F10E08A
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 18:06:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k10so16172973lfm.4
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YId2qFc2g35/E70lSaVSWi+LP5D0a4HgnSmJlhd/KK8=;
 b=jHsdErwX5dPLdoPW3dgGmcCoDgcakypIm+495tvOKtQL9QPtt8V7/gJ1h9q5lB7rwn
 6gFbbO3m+ZzJRGyxQO6lM6CRqm6uPwUTtqDDolmemItUbKsGh2vKuFIvy+y1ec4MzufQ
 Cx05prXleITG2xd7YWduVE4k3k/9CSrk6Z3j8KvYuCSKeLDMMn79fHpxx7lHh1qvslW7
 SHfTyc96VKkN0HTMzfYoEUfkLuFU180L8Z0D8gv8moFUpOcMTNAeBeTzQHCkPUziVQvW
 YHlm2eCYkTORmbcUMbmlWYl0Psi3+D/Xv68JwW69eh2CrkfN7klNFNe1zWZUXdHxSWbM
 L8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YId2qFc2g35/E70lSaVSWi+LP5D0a4HgnSmJlhd/KK8=;
 b=1Yu6UsEgszhNBk7RKJ/5Yf9W37YQ8m2IEYkG6Uwefr4m3lAq5eDMpX/C44k/Ro6jsQ
 bphAzZ0nhMX16MSaZL88zdbmVSlhimB96E3n4ppyecFhjUuZxIlCFC6Gk+v4bOfUVLOD
 WWBeJ1GVyrj+fU3gdGvqZQJrenAWvOB4OAsuPVwPuk28zkmywcnTCYODi5ZGAK9zmS1H
 +FlndxNp2qJd7wnkCA0/ETScvwOVvi65MMwp0wrFEEl1/RfOPVbUQaUalAJlMD68dC6m
 dj8+pzkWJYk+J1YjEdS0bfV5ZIuOBlgLaPoMdYDwMdSyjF09Jeqx2lKbgh1t+0t3Em53
 EbqA==
X-Gm-Message-State: ACgBeo0m2mj0oJ/icPNjTEV3g7f9y0LmC05FPorGmZdrKBITSu8HLesE
 TgiUMZKKfTbQ1IZT9Gn3WQ5vIg==
X-Google-Smtp-Source: AA6agR72bENrYaV3AGytGeVqlM0eFcCOub+TVap9NDCtWO6DvsFG7u89q0BJcB/dxfhSP2zC9MhO2A==
X-Received: by 2002:a05:6512:1044:b0:48b:49b1:cc85 with SMTP id
 c4-20020a056512104400b0048b49b1cc85mr9327400lfb.57.1663006009387; 
 Mon, 12 Sep 2022 11:06:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a05651c039b00b0026bf04aafd2sm1141288ljp.9.2022.09.12.11.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:06:48 -0700 (PDT)
Message-ID: <9ac13738-ea89-e2de-6316-ab8020580569@linaro.org>
Date: Mon, 12 Sep 2022 21:06:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm/dp: fix IRQ lifetime
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
> This is specifically true for the DP IRQ, which will otherwise remain
> requested so that the next bind attempt fails when requesting the IRQ a
> second time.
> 
> Since commit c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> this can happen when the aux-bus panel driver has not yet been loaded so
> that probe is deferred.
> 
> Fix this by tying the device-managed lifetime of the DP IRQ to the DRM
> device so that it is released when bind fails.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Cc: stable@vger.kernel.org      # 5.10
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fbe950edaefe..ba557328710a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1258,7 +1258,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>   		return -EINVAL;
>   	}
>   
> -	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
> +	rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
>   			dp_display_irq_handler,
>   			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>   	if (rc < 0) {

-- 
With best wishes
Dmitry

