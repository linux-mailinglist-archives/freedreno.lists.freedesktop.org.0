Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16B661A8B
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 23:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8E510E217;
	Sun,  8 Jan 2023 22:45:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D0210E217
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 22:45:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so10388730lfb.4
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xNjDFq7jF6Xutyrz7TZXPQsfgSYhgyOTeZIcCQictVc=;
 b=e8zj826Zagy7Wr+2jC7vyR1XimbGVyk4hS7mMWuWs5jS5BMhe4INZZPZZ3dqZGd4zW
 vVuWxQoKEM2XVg1AJ1pcgxxZxdOmVRvTv6n/91dmCmyvQWOCv4w0hTImVuK4BUK86s0O
 KIsslORjq5lajLYSh379zvq7zEUKgf0Wx2NeMGPciJ/W/W3IS6b0ICpuHi1WlLXLMQRH
 P2ZwoeLK3bIf0AE1GtJdSaO4K/qofXQUK/AihEXhvsbAow2S5HtG3N558XOuEXrTX2h+
 bFCWrkB2ARluw63iPTDc17QjyIKCcm7vZy1eGqwWusrs7OooTfKMoVqVarn+L5fLGiwo
 bR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xNjDFq7jF6Xutyrz7TZXPQsfgSYhgyOTeZIcCQictVc=;
 b=Ocu+qQ6IexspkT49wHDh3C84qHVXfIY9/8XpmLt+zIV6dv3VnZXikYpqfwV8s/eqBi
 AxQ3+67xd13XDq/Qni6ZYEmp21I4atRAxPG2CcgG6/DLhBzJvjojTXlZi1Ovxp08UkJ1
 b5DAvq0EoFEwgBthneFAuhmfO3hfweE5WS3d4F0Zb87BthlSOBh2rAqje/fVG7tzi6fK
 M/qXwsGm41L6YCfs+0Ooll9+QAF+jUpYsZpK+odsJR2W9iSlp6Ktr92UF+PTkae07S39
 9AZMs2vyXEVacmhnDVXouU7jirMQCowkPomZCjkWkutSEPq1YVgDYkxna35qv2gpJEu8
 ybeA==
X-Gm-Message-State: AFqh2kp8BzsvEnypOZWqBertuFgO1GP6ZvUyskzwf4pVURrM1q9jaQK9
 puAD4qlDrfz9kXUMPH5n0DizPw==
X-Google-Smtp-Source: AMrXdXvwzFkEAxmdB2Z6hlU44qt3jw6D5B4obR6CvQwIXBWaGQgM0nax26AbcjwKQIqDWuaHbP3Z5g==
X-Received: by 2002:a05:6512:304a:b0:4b5:5098:e6f7 with SMTP id
 b10-20020a056512304a00b004b55098e6f7mr19827844lfb.68.1673217905625; 
 Sun, 08 Jan 2023 14:45:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b0049464d89e40sm1257366lfq.72.2023.01.08.14.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:45:05 -0800 (PST)
Message-ID: <9b53d5f0-e1b1-1ecd-b9b9-efa20b11c916@linaro.org>
Date: Mon, 9 Jan 2023 00:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20230106084712.29675-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106084712.29675-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm: Add missing check and
 destroy for alloc_ordered_workqueue
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/01/2023 10:47, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8b0b0ac74a6f..b82d938226ad 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -418,6 +418,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	priv->dev = ddev;
>   
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
> +	if (!priv->wq)
> +		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&priv->objects);
>   	mutex_init(&priv->obj_lock);
> @@ -440,12 +442,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
> -		return ret;
> +		goto err_destroy_workqueue;
>   
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
> -		return ret;
> +		goto err_destroy_workqueue;
>   
>   	dma_set_max_seg_size(dev, UINT_MAX);
>   
> @@ -540,6 +542,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   err_msm_uninit:
>   	msm_drm_uninit(dev);

return ret is missing here. Your code will result in double free.

However the intent was to unroll each and every action of msm_drm_init() 
in msm_drm_uninit(). So in all your cases please goto err_msm_unit.

> +err_destroy_workqueue:
> +	destroy_workqueue(priv->wq);
>   	return ret;
>   }
>   

-- 
With best wishes
Dmitry

