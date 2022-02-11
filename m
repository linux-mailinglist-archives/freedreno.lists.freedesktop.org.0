Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED634B1BB6
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 02:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714C10E99F;
	Fri, 11 Feb 2022 01:58:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2734410E99F
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 01:58:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m18so13757896lfq.4
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 17:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZC1uqgrvXsIBWCW6+/3AKBzj42cmqBCOtVTeIFF9gQ8=;
 b=usHybndeVb5TLwmLHBrShLJ3L1mMv30/AbKTRRK0Ad6jZV65pXh9Q31cjz2Cro9LSk
 t6g3qVrJg+S6Sh5Ecifk8Yc6UnujpCzAR+fuM1WxKz6MAxYR1LX6EIGRstOl6sAj3PWV
 u20BxdMOhz4lP/eSyY6lSVZwhejtrjhWu7otHFsokV0pX5bogNboJJSznGEjRdLyLe1B
 4F552vHRBffa1K5SyUr+9s5tPaS8DkpddoYfeuPZIhiBJ/nbU6F5fYgAAP7QSRvnb+LG
 kVFKHUi1UveP7f+29emKd3/O6tmwoUnSbBtijITh2oPwZ/MPd+jsHQ1L7d9CsEBIk4sI
 XScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZC1uqgrvXsIBWCW6+/3AKBzj42cmqBCOtVTeIFF9gQ8=;
 b=nh0IUa/e7nZIMG784rvpMVCErU6rTZEUiD/Yuk2fNh64L0GHZnQN9xnCyhyEjHYmAK
 GztGfPROAWc9Y4O5hmJ54DB1KppGfKu9/FM15CIl3xAG0xofezBZ+17t51qrRZBEhaMM
 sOq3n5YGAUCYn3XTW9HJONG40uDC9cAzAV14n4G2PjCPVDNbM6fKlB3BFg0vYLqy0QaU
 0CY00W197TTZQc8jo/m4KX3f/rlT77mGozZDiunwPEAtEM8k3YDdWSO11B1a8EbpkZ/J
 d7jVhBhMDz7gWJ96N6Fo+Ee5hiBV2ttRp4F3tz35Z7OEBd6xck6u0NDgNZz1+64M4AK6
 zZkA==
X-Gm-Message-State: AOAM533JqFYo0l7Yti7WBwWMu3HvpcIjmtO9OAc5WbL5bjOfy+cR4jLv
 a8V3Afnf53iP7ViU2D5x9VzhDSfqM0TKLg==
X-Google-Smtp-Source: ABdhPJxZobwbFRhHRkhxhuImyV2J0FBbZMpweM4eIPj6Ttm7k/ck8K4S97TAzRwglr9idQtgDZfXdw==
X-Received: by 2002:a05:6512:1191:: with SMTP id
 g17mr7068991lfr.55.1644544698491; 
 Thu, 10 Feb 2022 17:58:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f22sm2956990lfc.149.2022.02.10.17.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:58:18 -0800 (PST)
Message-ID: <cff9e31c-4564-1219-2b12-709f3f140f70@linaro.org>
Date: Fri, 11 Feb 2022 04:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210114106.290669-1-vkoul@kernel.org>
 <20220210114106.290669-2-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-2-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Update the comment style
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 14:41, Vinod Koul wrote:
> The multi line comment style is wrongly used as kernel-doc comment. This
> gives a warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17:
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst
> 
> Update the style to fix this.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index a77a5eaa78ad..9341c88a336f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -13,7 +13,7 @@
>   #include "dpu_hw_mdss.h"
>   #include "dpu_trace.h"
>   
> -/**
> +/*
>    * Register offsets in MDSS register file for the interrupt registers
>    * w.r.t. to the MDP base
>    */


-- 
With best wishes
Dmitry
