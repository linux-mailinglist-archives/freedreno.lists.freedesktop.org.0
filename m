Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3986CBFB1
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 14:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964BC10E897;
	Tue, 28 Mar 2023 12:49:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11D910E899
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 12:49:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id q16so15651288lfe.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680007774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VidQzNASsjux63fhI4uuQ2DTo+OMQ7IeAyjim1gV9U=;
 b=Yfxn63WyrzAfO1tKDAfFXoAxKnk6BCSIbXkw8TEZ3p7jxTrOECdb5AHNR+w+7SYsnw
 xBKd+uFhn7qCc/r3TcsIsaVF975bOzOrmJSx2HRjK7xPOZiCypLmgOgkREtZNZSYRg1Z
 6osNuvxfJkMdo+4Xyf/UwTfYKoaTSMeszkoI+Rc/ut1buFEspBG3mV9hBRisJj6MwHmM
 0V+RUhtMX3UEoXJM6VNjsDuN7NHFgZlEKIiOkH4z9r/Ier2+HTS1ec3MnOCxf587tl/S
 VHbaO+a/QOoEUrt8rN6OYAC0qno3U3ULfO01L4+18XOKp38dkyQxXqxbC6JO/HP3DXLP
 JpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1VidQzNASsjux63fhI4uuQ2DTo+OMQ7IeAyjim1gV9U=;
 b=LJRo0BHaApgR2/QyJeHWUom9onylt9g3XYYfvj4/0hTb+N5cQxP7mq4+1me68bzBrN
 qWGlbeCQ2z7/9F0zruzCmf8lhR/ge995ypgBP3oJ9gexwqOnA/Sc1EhlMSPn4OXCnvIz
 D7aIUpHDQ1WnFMWVqjbSrPuuDJoNMEgkIKGgJRqQEJflWLuCU/KoPIJYv6HtUty8jXcK
 IYUDLJGT19sfN0Ga8cf6zHZrn9CEP2nK07j7BTevRcg0VI8EBCeJK65SZSctEDVi53hm
 ZO9LDR2WLFY7ckjK3lH003vINpQfyJI6fKUN6dic0BnvbYFjLs81+9vrfwd8gZYghnhI
 qLug==
X-Gm-Message-State: AAQBX9ez43BTF8ZhLkIpWtQPk5o2PusG2GUTLPlaEhd51rUciipW2CZ7
 Gpultlx0L3hAvnk+vUIiRiL+TA==
X-Google-Smtp-Source: AKy350b+rejnzP2zxrXGmRaUOdHxM2i1U5qKBX8wGs8qd7uzaDxdvUIU3FUVEmqrn6C7LJ1eUJGuvA==
X-Received: by 2002:ac2:5598:0:b0:4ac:b7bf:697a with SMTP id
 v24-20020ac25598000000b004acb7bf697amr4967288lfg.4.1680007773949; 
 Tue, 28 Mar 2023 05:49:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a19ad06000000b004a2c447598fsm5028496lfc.159.2023.03.28.05.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:49:33 -0700 (PDT)
Message-ID: <74e44866-1de6-e74c-7d06-7189fe328aa5@linaro.org>
Date: Tue, 28 Mar 2023 15:49:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-3-johan+linaro@kernel.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 02/10] Revert "drm/msm: Fix failure paths in
 msm_drm_init()"
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> This reverts commit 8636500300a01740d92b345c680b036b94555b1b.
> 
> A recent commit tried to address a drm device leak in the early
> msm_drm_uninit() error paths but ended up making things worse.
> 
> Specifically, it moved the drm device reference put in msm_drm_uninit()
> to msm_drm_init() which means that the drm would now be leaked on normal
> unbind.
> 
> For reasons that were never spelled out, it also added kms NULL pointer
> checks to a couple of helper functions that had nothing to do with the
> paths modified by the patch.
> 
> Instead of trying to salvage this incrementally, let's revert the bad
> commit so that clean and backportable fixes can be added in its place.
> 
> Fixes: 8636500300a0 ("drm/msm: Fix failure paths in msm_drm_init()")
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Ok, let's do it this way

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 ---
>   drivers/gpu/drm/msm/msm_drv.c                | 11 ++++-------
>   2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> index b73031cd48e4..e75b97127c0d 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -129,9 +129,6 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
>   	}
>   
>   	priv = drm_dev->dev_private;
> -	if (!priv->kms)
> -		return;
> -
>   	kms = priv->kms;
>   
>   	if (kms->dump_worker)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b7f5a78eadd4..9ded384acba4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -150,9 +150,6 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   
> -	if (!priv->kms)
> -		return;
> -
>   	kms->funcs->irq_uninstall(kms);
>   	if (kms->irq_requested)
>   		free_irq(kms->irq, dev);
> @@ -270,6 +267,8 @@ static int msm_drm_uninit(struct device *dev)
>   	component_unbind_all(dev, ddev);
>   
>   	ddev->dev_private = NULL;
> +	drm_dev_put(ddev);
> +
>   	destroy_workqueue(priv->wq);
>   
>   	return 0;
> @@ -442,12 +441,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
> -		goto err_drm_dev_put;
> +		return ret;
>   
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
> -		goto err_drm_dev_put;
> +		return ret;
>   
>   	dma_set_max_seg_size(dev, UINT_MAX);
>   
> @@ -542,8 +541,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   err_msm_uninit:
>   	msm_drm_uninit(dev);
> -err_drm_dev_put:
> -	drm_dev_put(ddev);
>   	return ret;
>   }
>   

-- 
With best wishes
Dmitry

