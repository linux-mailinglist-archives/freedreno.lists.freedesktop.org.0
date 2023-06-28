Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D09741916
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 21:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315B10E0DA;
	Wed, 28 Jun 2023 19:54:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BCE10E075
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 19:54:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fb10fd9ae9so3419145e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687982061; x=1690574061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n/1WCRqInbEQkf2duMLeRlZtPpMeZ3I2eJEdWnZJEsE=;
 b=wiPuQnqHresP/hP0AhH1LIlgDRlJXchiEYdcoJEDzHt+UEmeFgraxKndgHVw2OY4aR
 4HUeN7Jck9SA3LDs7HeM7rY382ov4iowO5DNF9tkJk8C0LAfThHl2opwboerfshAvRcy
 iTVg/XJEfYET1X0VT8BFLN73IoV0I0h9W4VNlxOEApz0pU9MYDaS+dXuWtGLPG2YkKtA
 cQWE+2GWR4RbF7YmvjlnJ6+yd9RzhRVt+buHpFXgq8o78DUxox9bdD3kPJPvRDScCYrf
 pjoi1g3TTAJlC8Q9ufWLwix5Vek1E+ehCKgCB/y/cXspQICa+BVJAxHFblMY3rh8nBch
 c3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687982061; x=1690574061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n/1WCRqInbEQkf2duMLeRlZtPpMeZ3I2eJEdWnZJEsE=;
 b=c/itZmgvJ1b3xAI3VeOLIigrarb2fOvdi8AEDhFIHkvTAncJP5xGdzYt4lTAGRoyGX
 Nu11lrJNcKMwKfe2s0k1sRPSTFysy1gBoMYqWw3eI/1dGIx7tnxuSD6zGjGBUoCADnOh
 3HxA7qT8q2uT53XxqHuZgnbP8rELynBoJoW9Oi/bbkBv1z+mPLJzXNxQgGAowU3PQmpv
 SAEYuRNgbaGmGPKxGv94euDznlAmBwL7pERTjLLoHpEAotruTGNuXvtJCKQMc1+hARN6
 uBcAD8kgYwal+g8D/+GSZqSqNzo8jsV8xKFTt1+BQuVSed4dOUdUP4eZzq51yTmnqBpc
 kEsQ==
X-Gm-Message-State: AC+VfDxH7ocosZLR5m83Ek11S1P9P5uftskVBmWbbpAH5DEHLg3Zh4Bm
 9sTfJdiztNNppSnEZMUVbOajZA==
X-Google-Smtp-Source: ACHHUZ4W+0A/p+ZwDwpOl46I6quIlwSWSeRsQ9uhmc+nS4yPI9mGFeGKCLwc1djZ2BtqVpoSvJ2zRQ==
X-Received: by 2002:a05:600c:2041:b0:3fa:7808:3e16 with SMTP id
 p1-20020a05600c204100b003fa78083e16mr12935716wmg.29.1687982061246; 
 Wed, 28 Jun 2023 12:54:21 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003fb41491670sm7241386wmj.24.2023.06.28.12.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 12:54:20 -0700 (PDT)
Message-ID: <ef074384-1eee-ec88-b02f-c4ada72037a4@linaro.org>
Date: Wed, 28 Jun 2023 22:54:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Assign revn to A635
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/06/2023 22:05, Konrad Dybcio wrote:
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635). Fill it in as a stopgap solution for
> -fixes.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'd have probably added:

Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified 
before being set")

or

Fixes: 192f4ee3e408 ("drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu")


> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb94cfd137a8..8ea7eae9fc52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
>   		.address_space_size = SZ_16G,
>   	}, {
>   		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +		.revn = 635,
>   		.fw = {
>   			[ADRENO_FW_SQE] = "a660_sqe.fw",
>   			[ADRENO_FW_GMU] = "a660_gmu.bin",
> 
> ---
> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> change-id: 20230628-topic-a635-1b3c2c987417
> 
> Best regards,

-- 
With best wishes
Dmitry

