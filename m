Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D65699A50
	for <lists+freedreno@lfdr.de>; Thu, 16 Feb 2023 17:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D77610EE10;
	Thu, 16 Feb 2023 16:41:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CF710EE10
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 16:41:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x40so3469249lfu.12
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SMnX1HaH2NBclXeVG8VG3N1zQtjFM/4YnRJFVyQLDD8=;
 b=jQke9uCozYVKmQfyOWRZ2twqTstxxeFR0evUWdL8IvoBWvRzH5hKAZNdD1m+wmG/KX
 zCOW68zPjxJ0xC5Tj/wgOO0uiYVncKpbNUk3ScdM2XdxHaXAsDd0nynpbWlxOnNQGvvj
 sWcp0uoZJspqIjA1MI72jOTpCQXovGUJEtkmDrfOQi8cJIghONGDe+f00OL7/q0xGP4i
 W6bYz4w9BMv45fNzUa+0Gtz90kf+ugaXKasDcycnG7798XhIEksfGGoUGoMKuh+cywsg
 qJrOQ4gnj54NIC4KAy0fDdgEqtZhSRpRlyQ0RQmVG//sGDrJN71xDzv8p/2bAuaI6eEI
 aTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SMnX1HaH2NBclXeVG8VG3N1zQtjFM/4YnRJFVyQLDD8=;
 b=06xORiEJmTwwRKh3gG2XRVfrBD1PKM/qmkF9Wq9I7oQlgeNeHbiwPCgHd2/LaTPhQ2
 bgtjZ4+aHwWKDUiDYXiT/77XCRCFhkykpmP3jk6ddVNEmrDx62boijkhqnHhW6UMPSUI
 TJzmu91q7R58UkKcz/ZeN8xRgn5ptmhr7I3UwQ83FrjhzMtFSzLK5mpfvlYrpz+hzH/o
 U9d+E+wi0woszMDT28uLZy1UGjymcZtKDAwtijslGNxjxSSyFM3BKWmE1hPodz/WE1gK
 L3fyrJZjE4GjmU+eiZ2VbwNNa+Jzh55Oy89mdES9z0ag+st6uM0RuYtqMHyqJ8Q9CcuD
 Rcjg==
X-Gm-Message-State: AO0yUKWQlO9bUZbYgJBXdBLT3SrwrdNx6JMimog48MS555pBc8INN3xg
 qWIsv9+7i9dTEZlQGjxvYvMDXW9NJSUUZ/uk
X-Google-Smtp-Source: AK7set/LQizZ5sM7tq/Gdq4hfmltV90P0uwRAz1nBb7Qf4+ZzkfNgvnGWpuPedwMWF+lEpXpUgzkKg==
X-Received: by 2002:a19:ac42:0:b0:4a4:68b9:19f6 with SMTP id
 r2-20020a19ac42000000b004a468b919f6mr1907767lfc.30.1676565709087; 
 Thu, 16 Feb 2023 08:41:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a19c203000000b004ceb053c3ebsm349490lfc.179.2023.02.16.08.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:41:48 -0800 (PST)
Message-ID: <8b14864b-89fa-ef02-f025-00d7713a0bc7@linaro.org>
Date: Thu, 16 Feb 2023 18:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230215235048.1166484-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230215235048.1166484-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix potential invalid ptr free
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Daniel Vetter <daniel@ffwll.ch>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, David Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/02/2023 01:50, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The error path cleanup expects that chain and syncobj are either NULL or
> valid pointers.  But post_deps was not allocated with __GFP_ZERO.
> 
> Fixes: ab723b7a992a ("drm/msm: Add syncobj support.")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This makes me want to rewrite the ab723b7a992a ("drm/msm: Add syncobj 
support.") in the usual explicit-error-path way. WDYT?

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 6503220e5a4b..e4d13540300e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -640,8 +640,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>   	int ret = 0;
>   	uint32_t i, j;
>   
> -	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
> -	                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> +	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
> +			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
>   	if (!post_deps)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -656,7 +656,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>   		}
>   
>   		post_deps[i].point = syncobj_desc.point;
> -		post_deps[i].chain = NULL;
>   
>   		if (syncobj_desc.flags) {
>   			ret = -EINVAL;

-- 
With best wishes
Dmitry

