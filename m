Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E3399591
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 23:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968196E8CC;
	Wed,  2 Jun 2021 21:45:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DCF6E8CC
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 21:45:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r5so5628143lfr.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7sNxat3i9/RN2yykF6irefH0yK7Y1BVv/cXFGY3PCQ8=;
 b=gYX6BAVAoigjrGq4AHuBLFG+Ap19bznrpH06DcwQhRwrJBBkgUMuXX1w5XHhSw2YOg
 LuqytIGNmUaCWMbVWwOJ/vVGWk3OvFfaUtw7y5GMsm0CUUMB60UUBUo4qQLZv2m3k0jn
 nzlFjimGVmJWwhHMseLNRYBWZQiOP8glwmjUZkpvjOhjC95dArdz9kfndDfkOkPPHTP0
 jkF9AdtNuu5ZH1zKg+9JyWbr4n/0bYL2qmY2X+W96yZ8SGSeSJKEsNMGgP3BqdeIFi9N
 Cxh/rV36CmCv2C4xP8YXO+yjeYrF0gOFE5YOkNZhiKM+wkiZGLXloSIWAKqITk3SRq2E
 aCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7sNxat3i9/RN2yykF6irefH0yK7Y1BVv/cXFGY3PCQ8=;
 b=ga27VougRhHaNluiQBtQ4S10NzJ88boKo64oGEFv6pVsW1D5QQ+EbKajGlm8iOO7hA
 kkm4RspxtKxzY9sOJPlR0RdXtYlWIzYHQcd8WZ2FMr7zUgwWhCfzPcuj2MPMY/X/Nra2
 /psEduVZL0FocDus69KZ7CLqmxzbhHA4kbiV7ut//VsJIPnhREIvfX5W4Xj9LLKMVp5F
 cuV3GFkSHHkSK2lRLEttZpTW6CRw44iXc2/wfh4Imj2Im0amOeavDn7jd5VZLVOVOOJb
 rbQbLtHNaDOfn2Jcjv8x3O7N2O/h2mG9g/QEquwbRZfUKgKZapWnRpthsbQawlYFly3N
 VaOg==
X-Gm-Message-State: AOAM531tFX9vVHlKay1Hw6zALYKDtrCaa3W70wwE8t8+n/tE5M6VDavH
 5Tz969YKbxbcVwh4z+DDvR1jVFCmtWwicg==
X-Google-Smtp-Source: ABdhPJyLab5zzBNyzPzXm77Co4XUVWe+ObknhW7ybl82GSpdoxVmftuwnJLvpsRiaVkEX81lTkNUAA==
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr23206848lfs.482.1622670343227; 
 Wed, 02 Jun 2021 14:45:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m19sm108033lfb.121.2021.06.02.14.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 14:45:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
Message-ID: <52307126-b252-f6d1-3a38-a6a262b2fed2@linaro.org>
Date: Thu, 3 Jun 2021 00:45:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
Content-Language: en-GB
Subject: Re: [Freedreno] (no subject)
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/05/2021 01:57, Dmitry Baryshkov wrote:
>  From Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # This line is ignored.
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reply-To:
> Subject: [PATCH v2 0/6] drm/msm/dpu: simplify RM code
> In-Reply-To:
> 
> There is no need to request most of hardware blocks through the resource
> manager (RM), since typically there is 1:1 or N:1 relationship between
> corresponding blocks. Each LM is tied to the single PP. Each MERGE_3D
> can be used by the specified pair of PPs.  Each DSPP is also tied to
> single LM. So instead of allocating them through the RM, get them via
> static configuration.
> 
> Depends on: https://lore.kernel.org/linux-arm-msm/20210515190909.1809050-1-dmitry.baryshkov@linaro.org
> 
> Changes since v1:
>   - Split into separate patch series to ease review.

Another gracious ping, now for this series.

I want to send next version with minor changes, but I'd like to hear 
your overall opinion before doing that.

> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (6):
>        drm/msm/dpu: get DSPP blocks directly rather than through RM
>        drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
>        drm/msm/dpu: get PINGPONG blocks directly rather than through RM
>        drm/msm/dpu: get INTF blocks directly rather than through RM
>        drm/msm/dpu: drop unused lm_max_width from RM
>        drm/msm/dpu: simplify peer LM handling
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  54 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  14 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  53 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 310 ++-------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   9 +-
>   16 files changed, 115 insertions(+), 401 deletions(-)
> 
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
