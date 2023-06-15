Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAE573150A
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 12:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8754410E093;
	Thu, 15 Jun 2023 10:17:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1944410E093
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 10:17:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f76a223ca5so2159329e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686824239; x=1689416239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VrkMso6gSzSG+XS+vDDk4F97yS4RBvowjqFaI7E2vg=;
 b=lFCG8OVwrXZfc2r+DuTaZta5qrr5aKjP9qp3I7Af60jPV5Zs8aGyAg23iIIOtMX6em
 1oMsb6LnatM7muokbqrSQfJolYKeCFgrOCO0lgTzB7tgZftHc7Pk4Ef3LcG+vOtY8tVT
 jsBvY0Xxm/BeshihIC4/3VK5jtg6XOzZZY92SBlWi/FYMSgBVXZ+Xr/s7/HORWFL2oE9
 hZj2wQElM+PFbhLC+vk5s90Sj8EaGIRYhwgxn5sI+pES9xlg0WTKG3rcIvuyTTdBdh5w
 cS4sUzSH0klZ0ytYF5RByUn/HU6gH8+YQToyJI4r0wPO+n1s6mJtllsy1Yd4lV5PYLjq
 qlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686824239; x=1689416239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2VrkMso6gSzSG+XS+vDDk4F97yS4RBvowjqFaI7E2vg=;
 b=W1V73pskZCUOywrfuzkANIkZQYn1uvBo3V28U7OkYY43uwu7323lT4wvCZaSLiv6Gy
 EbCSrMpMHf13RSkA+p7qZ9E34P19PdXUSMEcVxVzfrITfaQBBdO5ZTXQ/a1BRIIVixyO
 BE0pp38VSjlQQG79nzkWC8P8FPobSskzg7dJsRWT41GyGNU+JB7XVYKNQR11WAmRkmZh
 7/VAqbo8OaMJVykWZE4L/PjkhAE7e9Qc2+gvhfXjHvaihalwmtB/55d9h/QdMuUNbrlP
 hzEzJOuCkEG86XCL2ZqWhjY2c3pv6bOj1pRjQbot8s/lBKiatkh9E3PyEYu5Rb/vRW0l
 ibNw==
X-Gm-Message-State: AC+VfDwova5OiQMH7HsSlc/q7VB7Sgm+F7ORk7rUNMieOeM66BFqp57Z
 OGO6jKuDZLJ2fIaeg2lVz1nzmQ==
X-Google-Smtp-Source: ACHHUZ5lzsyAA1o0LiPPDL3xlSM2j3ov9rzuDZ//SwNmj5QBrOYfKbAmu+BpH8v0thDXRV9AvtQznw==
X-Received: by 2002:a19:da12:0:b0:4f7:4098:9905 with SMTP id
 r18-20020a19da12000000b004f740989905mr8220883lfg.65.1686824238738; 
 Thu, 15 Jun 2023 03:17:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a19750c000000b004ef92c6e645sm2100795lfe.263.2023.06.15.03.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 03:17:18 -0700 (PDT)
Message-ID: <c60a0278-dc45-3e6d-e925-902cafb68d0a@linaro.org>
Date: Thu, 15 Jun 2023 13:17:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Free resources after
 unregistering them
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/06/2023 01:02, Bjorn Andersson wrote:
> The DP component's unbind operation walks through the submodules to
> unregister and clean things up. But if the unbind happens because the DP
> controller itself is being removed, all the memory for those submodules
> has just been freed.
> 
> Change the order of these operations to avoid the many use-after-free
> that otherwise happens in this code path.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbb0550a022b..ebc84b8fddf8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1337,9 +1337,9 @@ static int dp_display_remove(struct platform_device *pdev)
>   {
>   	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
>   
> +	component_del(&pdev->dev, &dp_display_comp_ops);
>   	dp_display_deinit_sub_modules(dp);
>   
> -	component_del(&pdev->dev, &dp_display_comp_ops);
>   	platform_set_drvdata(pdev, NULL);

This matches more or less the order in dp_display_probe().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A note for the possible followup: the driver initializes DP debugfs from 
dpu_kms (ugh) by calling msm_dp_debugfs_init() -> dp_debug_get(). I 
think that dp_debug_put() in dp_display_deinit_sub_modules() does not 
look correct.

>   
>   	return 0;

-- 
With best wishes
Dmitry

