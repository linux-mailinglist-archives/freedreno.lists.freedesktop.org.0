Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A204D6C350A
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 16:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616C810E229;
	Tue, 21 Mar 2023 15:06:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37B10E1F5
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 15:06:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h9so15875076ljq.2
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679411187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiHy9zm4LtANP3nP8u7ZmP1cRrMSZ1F7M7tdsLnmL5c=;
 b=WVxB8OnWOd82MsZge6qyZe78WYMa2VOUhdSVwMf3MO1ts2efmgCXrK7E+I183v5A2n
 wafE6+D1bTvLkU05rFTK8YrVEGqojO5lVkhDjzhuQoMa2yuJehT4diwB7sqHX97KFmK7
 Wy8n+S49oALnfBvUtGOjNpT4gzttfgzwZyimCUmun85ePPSwKwdXXSz2MqZjk3dTamwy
 Rb2d3JESU3vv2o9p/lMpvyVXGq6JCa3N6vdYnNjMVngtRu3NPx4rlEudBTU3CLp5S/IG
 4myTBrJo6qPEpVhoYmopspUmjFuBdAiCQWFUoEzzfuDE4hVuKaPlVh4krCKX9R/IRLTP
 y8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679411187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiHy9zm4LtANP3nP8u7ZmP1cRrMSZ1F7M7tdsLnmL5c=;
 b=Qi+pjaONXtLfqqRcApO9Zs2dxwWxicej9cKbhVof9k0sohAvQMGqsWU/cEEzw8b3AX
 6mLnQ0JYiuPGiktTU611j+6e5R7m5/qtYIwc6zP/nJaIvXGYz4HEkQIHhygRP/UopDzU
 dl3BbtwYuhoe7WNUKZYZffOw8yZHyJquO1D9mtpsDWjTyK2AbpJjm5Z//jjPy3RHQ9/8
 UszJwjw/xGxTwLQGAC/pMLuml7oCRw60uBy9LS28YZtLPmnJYT4GwsZ20sZjkoQ1aC5a
 rPwr7plW+vsdQVfXndr82DMu/s3CLz2IrKfWQieWR913l3Ypr944guIiwtfA6VVmmiPf
 WbXg==
X-Gm-Message-State: AO0yUKVy4j0+Cu/Z00O9PJIzVY/0xN8X+T3Cq6eOgqZYo6obajV4X4uQ
 AjjZ5j/uwkLEePxC8mLUyLvv2w==
X-Google-Smtp-Source: AK7set+e5ls0OWebGd/IN1tP2tPlzD51sw/ZlRWK0EpUUVd/5kDr0H3DXsUwYYPYx8qvcnam7pB+jw==
X-Received: by 2002:a05:651c:144:b0:298:acea:d261 with SMTP id
 c4-20020a05651c014400b00298acead261mr1128029ljd.21.1679411187677; 
 Tue, 21 Mar 2023 08:06:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a2e3216000000b0029e84187ce2sm725080ljy.139.2023.03.21.08.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:06:27 -0700 (PDT)
Message-ID: <c0ac71a0-4407-de19-ef7a-05004c3e0a2b@linaro.org>
Date: Tue, 21 Mar 2023 17:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/10] drm/msm: fix NULL-deref on snapshot
 tear down
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
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> In case of early initialisation errors and on platforms that do not use
> the DPU controller, the deinitilisation code can be called with the kms
> pointer set to NULL.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Cc: stable@vger.kernel.org      # 5.14
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9ded384acba4..17a59d73fe01 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -242,7 +242,8 @@ static int msm_drm_uninit(struct device *dev)
>   		msm_fbdev_free(ddev);
>   #endif
>   
> -	msm_disp_snapshot_destroy(ddev);
> +	if (kms)
> +		msm_disp_snapshot_destroy(ddev);
>   
>   	drm_mode_config_cleanup(ddev);
>   

-- 
With best wishes
Dmitry

