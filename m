Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372604B0015
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 23:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA4A10E4C4;
	Wed,  9 Feb 2022 22:25:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BD210E31A
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 22:25:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a25so5411743lji.9
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 14:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hIcx7fgKf79oX3DQejLBFipd+nYlJybj4bCOUvRVfTk=;
 b=AlKhd6Y+1pFKRAL1Gs0aGJemkU9izAFnRZhqMlBaMSz8KC/XHIV+ftQIqR0T+2Pv0g
 iHaSekL2qjqYoQg48jXn6Li+zsiiNBgZOavlJPwPpmx7FS3as0roA3vYdVTGL+5Hl8p6
 0/yHjvl7FFo92P3shC64MLzA5PjgKri39OfSj5KVgWTvfUybQVEUd5eAk3A39OGl2/Up
 aTcL1aLw+i22DqH2LVq2zkGsp5X9y53Vebd/FxsxVz7DN29WnCQvXejtpuUrq9EAkqCy
 RhD5ZgxUos3uDuChqgQkq2qbYHRNGLF2F+h1QkMbhrFCdk5aYjTLTP1RWGhOf4+v54Zn
 oPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hIcx7fgKf79oX3DQejLBFipd+nYlJybj4bCOUvRVfTk=;
 b=0IANnVZeZ9rUFIsfET1d9aPq9PDuAgEScTtagQJYexrisZjbxcylhUwNK+cVqPjGq4
 N7brAO34o/fOu11HHl/M9MwqNhsZOfPRXUoPtzsjleAndvozs4F8MW6qF+6Zsi9Nod0G
 xCr/9vIeapptJvL6nCd31ebLB8OpUETkryr9L7tEUkv6Q8T4nS8St5NWR9qlJnncplXF
 SQw9b/XA0viB77Hc0u3d0FzaKz06e1U1Ejlbg3yKr0wQPgUd/MR5ehvWEhN320v0gfJM
 wB6V52ADdgG+4Ds4hwFXjmpdA83+TrFvyYCw4qblHUaMqFKJskGO5UHKGvn0V2vGT/GC
 dEvw==
X-Gm-Message-State: AOAM530ym+ZmQJ7jSbwBvJsJvEnOVTjGrGuQIfMOcqOYt0bumZS40aJo
 FC7VKosSjd3B+tCNDq/aYWFu91q54a0xtA==
X-Google-Smtp-Source: ABdhPJwBNTpjejPUqQ20I3Mf4h67E5BFHnM2+lhr2w2BSwR1xW8oumn+pmF/vKAuybdKMNJNXLT2LA==
X-Received: by 2002:a05:651c:54d:: with SMTP id
 q13mr2950529ljp.352.1644445508012; 
 Wed, 09 Feb 2022 14:25:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bi16sm1131966lfb.309.2022.02.09.14.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:25:07 -0800 (PST)
Message-ID: <fa5f1cd9-d274-a5ed-18a2-eb16ffe82196@linaro.org>
Date: Thu, 10 Feb 2022 01:25:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220114185742.283539-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220114185742.283539-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/rd: Add chip-id
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
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/01/2022 21:57, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices which deprecate gpu-id and do matching based on
> chip-id, we need this information in cmdstream dumps so that the
> decoding tools know how to decode them.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_rd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 81432ec07012..7e4d6460719e 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -62,6 +62,7 @@ enum rd_sect_type {
>   	RD_FRAG_SHADER,
>   	RD_BUFFER_CONTENTS,
>   	RD_GPU_ID,
> +	RD_CHIP_ID,
>   };
>   
>   #define BUF_SZ 512  /* should be power of 2 */
> @@ -202,6 +203,9 @@ static int rd_open(struct inode *inode, struct file *file)
>   
>   	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
>   
> +	gpu->funcs->get_param(gpu, MSM_PARAM_CHIP_ID, &val);
> +	rd_write_section(rd, RD_CHIP_ID, &val, sizeof(val));
> +
>   out:
>   	mutex_unlock(&gpu->lock);
>   	return ret;


-- 
With best wishes
Dmitry
