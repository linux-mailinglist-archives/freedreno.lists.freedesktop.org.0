Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35033E1027
	for <lists+freedreno@lfdr.de>; Thu,  5 Aug 2021 10:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CB46E2DF;
	Thu,  5 Aug 2021 08:23:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45886E2C0
 for <freedreno@lists.freedesktop.org>; Thu,  5 Aug 2021 08:23:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bq29so9523818lfb.5
 for <freedreno@lists.freedesktop.org>; Thu, 05 Aug 2021 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
 b=g9Fw9rp8HJt6YVrjbNKeYQ1cxVRtK7R5x5yue0bGcwObp8XT8wnN1ueN0WXsG0n46f
 hJtSGe20wDlez9DuciC9s+qlj4cmcdzZ+oVIymjn3Q3IQhU7zhoft9qfOpmHlSZYhIxJ
 jCN/BeTXg3D3L/XQuJdM3DSCT7/P3KFXDJcYKPza+o7lLDyn2iFtMQyThi6k1g749Go9
 pjt2FCuQ0EwfxacwyBIZvcZqGDT2MwhoULpYjSx0CfoCY6YYZFl9Fdp0l7mlN2eTpVCn
 h0IPLKTpJ0fMHtpT7TsyuuRGsE311a+5PgEy0+im9sj5WD1OOa+3+hKnyNEDVkQJ71Fz
 5btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
 b=BbKxTu3dnMBxR9Xsu9MG1re7IKseRar0zwlP7HJHOKMiISOhuzjE26zhqW5lDvg0JU
 f5ifzW1vqiY9MI+cGAG9B3pQkln+HyICY9RQhlGl3jSn88mTBNKYXzFwp/rH7cWvJKRf
 oS/3y89B87eEzquFmlZoKQL8oSQs4+Zyyyiad8Km4gKotHjwtN+cb7NQlEOkrUi0/qYu
 vBAG7XIxnXlD0aGqgavOhWo+9l1RDV6C1mJUFvFUnfBfXOlEPGipfwpPenER9vk9dVex
 qCJN9DW2Dv4iOH+l7qXfHH7v4wRkiWaHKVY+vSK9+frtLy+md3ZKjsNKGwqP4cV0BnD5
 L13g==
X-Gm-Message-State: AOAM53389yOkb+Z2f6PdnvLdA0uAbnJwnJqpNNNMqm+1YjOrl5L4kkO3
 PXxIVL1wKpbI7XlPNveZTP+BTw==
X-Google-Smtp-Source: ABdhPJy/d8s2887ufCuc62214Nvv1BektY4zjKTu/arCogjXCRDEpuyLUIGwPdFqdI23mNRuLRdaqw==
X-Received: by 2002:ac2:569e:: with SMTP id 30mr2756171lfr.322.1628151787049; 
 Thu, 05 Aug 2021 01:23:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w10sm440434lfa.66.2021.08.05.01.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:23:06 -0700 (PDT)
To: Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: weiyongjun1@huawei.com, yuehaibing@huawei.com, yangjihong1@huawei.com,
 yukuai3@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210609072838.1369371-1-libaokun1@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <0ac0b93f-65f6-930b-a224-12ebf919ad9d@linaro.org>
Date: Thu, 5 Aug 2021 11:23:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210609072838.1369371-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH -next v2] drm/msm: Use list_move_tail
 instead of list_del/list_add_tail in msm_gem.c
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

On 09/06/2021 10:28, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in msm_gem.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> V1->V2:
> 	CC mailist
> 
>   drivers/gpu/drm/msm/msm_gem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 1865919368f2..5b7d63d3750a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -854,8 +854,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>   		mutex_lock(&priv->mm_lock);
>   		if (msm_obj->evictable)
>   			mark_unevictable(msm_obj);
> -		list_del(&msm_obj->mm_list);
> -		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +		list_move_tail(&msm_obj->mm_list, &gpu->active_list);
>   		mutex_unlock(&priv->mm_lock);
>   	}
>   }
> 


-- 
With best wishes
Dmitry
