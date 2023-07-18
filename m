Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80B757662
	for <lists+freedreno@lfdr.de>; Tue, 18 Jul 2023 10:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5120B10E2EE;
	Tue, 18 Jul 2023 08:16:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA7C10E2EE
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jul 2023 08:15:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so8888192e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jul 2023 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689668157; x=1690272957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iw8rToh05r7bUfycHBeb+uZz00o8lFw7cQSPQLUCF2M=;
 b=tdM8sAUVKS2LHDZxtM7iRxFyCeKyFP/DhzOJ/LcgkJwYR8tK31PrRanIjDLxCKerFi
 Azz0AXE1Bv825E9D+/EbPXgtfE0b3ojU6znaC34tqB8U8GnLTnIG3CL+itF0HepL57GV
 L0LF8vZrF8UM1vUgvgiRpLgB2XXgiWYkxr0Kqt2KJqM8J9aEtD3mJQuaNvHvWmghxJng
 DjVZvsJjcISaQuZopEULICVLNs053lZBG5qjSo087RcINyWrmaoNUvyo0Q8qqhjjbZUA
 LZPc6EoevtJBR1R+ahTfTwnIWOMVhauDS6WtldaFOHXUUGJswcOZvMBwtVXrqwJ1iFzN
 ZUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689668157; x=1690272957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iw8rToh05r7bUfycHBeb+uZz00o8lFw7cQSPQLUCF2M=;
 b=L0BO65qiUvr8Bw3yebQO3VSklHAMuRQ05B1beaNLWX4FUS0gTiZDydGZMBjYLJmzpr
 ABAFbUrOcV3FxsxYf9bZRgde/qdWgx3DmmLQztOKMNsHzFrRZX5p2ybrboAuPwGwuAyz
 KZe7G4wVA+M8y1nth7xjqjnXFTUpC2qVEtDcHxVS0AsnaFFktdvhrpYp51t8oKh3cNaT
 Fc0FLoaWLRknaF/FND49ugCR5SC6INdHVJteafXPL4MfVWKhGkUiI9uF9eQW+iG/joi1
 +5rOrg0a93u/LfWeAdwEbKkJNOlXe952aMzCOnFnHqIYhMjz44q92d8fhQQ4t2olGsdL
 xCnw==
X-Gm-Message-State: ABy/qLZsQL0cjPEcwGbKmwS5PidL2/eNBpSbkcG3Ws7lby795/p+TsgK
 NMAWNH9KYvNzOW7qsyB9m1Ag/w==
X-Google-Smtp-Source: APBJJlG0i+8oZJSxOcAnNcuG+MiAU7YhlOlYb4AgmHWdYRATrnr8cHmgyMEWL/+T3Tpu+68WeMapPQ==
X-Received: by 2002:a05:6512:b1d:b0:4f8:4719:1f4a with SMTP id
 w29-20020a0565120b1d00b004f847191f4amr9888796lfu.7.1689668157012; 
 Tue, 18 Jul 2023 01:15:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05651211c800b004f9c44b3e6dsm320705lfr.127.2023.07.18.01.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 01:15:56 -0700 (PDT)
Message-ID: <c17625f5-515e-3c8a-29b8-0bef9f125dc4@linaro.org>
Date: Tue, 18 Jul 2023 11:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: sunran001@208suo.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230718081139.16918-1-xujianghui@cdjrlc.com>
 <c07be8cdf5ceceeec6bc7918774c18e0@208suo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c07be8cdf5ceceeec6bc7918774c18e0@208suo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: add missing put_device()
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/07/2023 11:13, sunran001@208suo.com wrote:
> The of_find_device_by_node() takes a reference to the underlying device
> structure, we should release that reference.
> 
> Detected by coccinelle with the following ERROR:
> ./drivers/gpu/drm/msm/dsi/dsi.c:50:1-7: ERROR: missing put_device; call
> of_find_device_by_node on line 32, but without a corresponding object
> release within this function.
> 
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index baab79ab6e74..81461e8852a7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -46,7 +46,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>           DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", 
> __func__);
>           return -EPROBE_DEFER;
>       }
> -
> +    put_device(&pdev->dev);

NAK. First, you are putting pdev instead of phy_pdev. Next, the 
reference to the phy dev is correctly stored and then put in 
dsi_destroy(). Please do not make blind patches when reviewing static 
analyser warnings.

>       return 0;
>   }

-- 
With best wishes
Dmitry

