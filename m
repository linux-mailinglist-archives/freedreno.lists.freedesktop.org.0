Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F76547713
	for <lists+freedreno@lfdr.de>; Sat, 11 Jun 2022 20:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4E10E089;
	Sat, 11 Jun 2022 18:16:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0B810E089
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jun 2022 18:16:40 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1011df6971aso790165fac.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jun 2022 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kgRN1xEQcitAejCBLpzML1+JqkKMRkpU5jU1U59JtqE=;
 b=JSzeQQNZSFvyTFEakgnEEc1U3Ooj9KJ/WvCXS0bFwd92LVCZ/A/lElrk/VaSc/FbUO
 /wViRb+cDQhSRNLcI8pkoviXuMbZQz6l0Ke8ehmlTcJsupvN2jr5YvTbPL9ayvPuYtwe
 w7Bd73fXXEcKPoQJdgYcbqepmPDYT5ckwjz26eiqYmkeXytwT65GGUo8qFw0bBql6Unv
 tmy98DlvUK2XG28yo7bbnBpfaqx76zzuDQpfM0MyvrvaGoS09R8ztPNzxRKpMuCbvrJS
 vO8UpjMF7l1lOt7pW+7839VwMJdR9IqbdUne3QRkZdwMJexDFESHpA0SJaSDEIvIyzkB
 QTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kgRN1xEQcitAejCBLpzML1+JqkKMRkpU5jU1U59JtqE=;
 b=40MKFuG2jKA34HfBEtyGfxE4TRxw/tq14JQI93EAlhGuCpCewPjAwH3lhU/gVA4lv+
 92tzWm0gO4fnqv2y/dDlkSSnDv6j56DNkhn5OGGezt+k005+r8I/Z7rKuc7HCl/HVK5h
 ZDxS4DiKBc+wTMrMU5xGMreQ/5wov/KJ/tzsZfS2OJzRP7R/A9ggtCRJGgu98dUH3lsG
 Jizn01bWdJOeDUsZ5PRJLmZFbiMS2b8fiKMSrfi0nO6Brlk+jLoBhEHc7s+TFOiyYbz/
 ta7zMBmPg16E6V6+WQYKz/AiOPb44GNbzsDx4JH+J4ftpkdGsngYC9EHO2DQK5ZIotyi
 cIFQ==
X-Gm-Message-State: AOAM532b3hGTdulX8fUKUCbVKSYMFooBoQn8CDcvB9kbbSS71GcwDV25
 GwplW6bcMZVWDqmSgPyN1tPb5g==
X-Google-Smtp-Source: ABdhPJxH6EjZpF1SBHn+LX+TQys5+EfxFofNkvijYQT6OUdvv/+GF69NEHAXWY+ttpQglZ7ZTOqnZg==
X-Received: by 2002:a05:6870:889c:b0:f2:57f0:b7ef with SMTP id
 m28-20020a056870889c00b000f257f0b7efmr3130568oam.243.1654971399704; 
 Sat, 11 Jun 2022 11:16:39 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056870d68300b000f342119f41sm1352095oap.42.2022.06.11.11.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 11:16:35 -0700 (PDT)
Message-ID: <42e52572-726b-d94d-6523-7b42dbeecff1@kali.org>
Date: Sat, 11 Jun 2022 13:16:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220610172055.2337977-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220610172055.2337977-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/gem: Drop early returns in
 close/purge vma
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

On 6/10/22 12:20 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Keep the warn, but drop the early return.  If we do manage to hit this
> sort of issue, skipping the cleanup just makes things worse (dangling
> drm_mm_nodes when the msm_gem_vma is freed, etc).  Whereas the worst
> that happens if we tear down a mapping the GPU is accessing is that we
> get GPU iova faults, but otherwise the world keeps spinning.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 3c1dc9241831..c471aebcdbab 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -62,8 +62,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = vma->node.size;
>   
>   	/* Print a message if we try to purge a vma in use */
> -	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
> -		return;
> +	GEM_WARN_ON(msm_gem_vma_inuse(vma));
>   
>   	/* Don't do anything if the memory isn't mapped */
>   	if (!vma->mapped)
> @@ -128,8 +127,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
> -		return;
> +	GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
>   
>   	spin_lock(&aspace->lock);
>   	if (vma->iova)

I've seen the splat on the Lenovo Yoga C630 here, and have tested this 
patch, and as described, the splat still happens, but the system is 
still able to be used.

Tested-by: Steev Klimaszewski <steev@kali.org>

