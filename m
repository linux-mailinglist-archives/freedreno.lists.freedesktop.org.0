Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105206DE72C
	for <lists+freedreno@lfdr.de>; Wed, 12 Apr 2023 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EDC10E19E;
	Tue, 11 Apr 2023 22:22:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9A10E107
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 22:22:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h12so7342266lfj.8
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681251722; x=1683843722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bnJqJOHWM+i9yYeCdM/t4B9MeXWhn4I1ekLcXvd6lHg=;
 b=TtLJ4EI/MxAfwkyCoXHF6vMi538qX4N5Eh3lSLgwY9Hp1V9UsojQVkDRy6sCgac936
 uFPQGqPqWZyNDJLjGGmOWGvAvMGfrGZX8sOkuHeW0zbTJSYTISU1XlVRGlOxGxWj3Sdu
 neoJIWVtsAJztSlAfPxqyDVnYf3Z0p2Oj9ZXnjvQOl/pETNgaGclKKusfcjB96RcV3xo
 mpSQ4GjnUCMdcBtJ4qRcJSHycsfbM83mYhLTn7l5B7GEE8VKwNi4ihda3PuJKsyHMZLe
 BZ32ZRjiM1vFkTmvAiWeMM6tuKCDUbixQBJgpsYtiZlfNFxXsM+Jho5t4XBYk7t2fY5U
 ZcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681251722; x=1683843722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bnJqJOHWM+i9yYeCdM/t4B9MeXWhn4I1ekLcXvd6lHg=;
 b=NUhLoAneiQO9ycmivlrLhYK0xoLlxJRMg+71RZszRcW3IdhYUHm0HRZMuPZv4OHj4O
 U+SOfoNKzDRViAzeH8BdA6/6wDWlG4ZVXC/4qkry46eaWdvu/B9Wi0yb2WjUjUzUoZdA
 cQ22CTvQpeZ8urmM5zIx4R7HT43x/kP1dgoFBQIJZU5pCAilGZqwcmaJZmPYDELi0YDO
 OvK8qzwQefvlSHYasVhZF1ASJDKJgaD3z3Mg2Q19VjYoNsoVbpiZQhXP6kE6lhFaozCU
 2Ad5wu+WkqW6zBcD+6nfuEwB9WiFNovxXH5EKnvLI7AsDthuXztz07eXkj6hTELxMaQz
 q+Bg==
X-Gm-Message-State: AAQBX9cw5066QMNEZkGeR+jPNmJ2ddEKckzwgHj07GIjoIDGfLNp+Qol
 QHeAm4+OAGCjdntq6tsiL+lgfA==
X-Google-Smtp-Source: AKy350YCVh8sqlclvyGDYItY0bdZX5DwXT15GKdMRT6i4yqUjFGy9SGZz1hBjSstG6Pnf62SBVGXeg==
X-Received: by 2002:ac2:4315:0:b0:4ec:8e83:dafd with SMTP id
 l21-20020ac24315000000b004ec8e83dafdmr133404lfh.19.1681251722273; 
 Tue, 11 Apr 2023 15:22:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c11-20020ac244ab000000b004e792045b3dsm2706181lfm.106.2023.04.11.15.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 15:22:01 -0700 (PDT)
Message-ID: <cfb8b5c2-f5e0-48b3-fab2-9708190df1c3@linaro.org>
Date: Wed, 12 Apr 2023 01:22:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DSC range checking during
 resource reservation
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/04/2023 00:09, Kuogee Hsieh wrote:
> Perform DSC range checking to make sure correct DSC is requested before
> reserve resource for it.
> 
> Fixes: c985d7bb64ff ("drm/msm/disp/dpu1: Add DSC support in RM")

$ git log -p -1 c985d7bb64ff
fatal: ambiguous argument 'c985d7bb64ff': unknown revision or path not 
in the working tree.

I assume this was generated against some internal tree. Please. Please. 
Don't do this again. I hoped that this was pointed out ages ago, but 
probably not. No fixes, commits, tests against internal trees, no matter 
how precious they are to you.

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f4dda88..95e58f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> @@ -250,6 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		struct dpu_hw_dsc *hw;
>   		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>   
> +		if (dsc->id < DSC_0 || dsc->id >= DSC_MAX) {
> +			DPU_ERROR("skip dsc %d with invalid id\n", dsc->id);
> +			continue;
> +		}
> +
>   		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
>   		if (IS_ERR_OR_NULL(hw)) {
>   			rc = PTR_ERR(hw);
> @@ -557,8 +563,10 @@ static int _dpu_rm_make_reservation(
>   	}
>   
>   	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> -	if (ret)
> +	if (ret) {
> +		DPU_ERROR("unable to find appropriate DSC\n");
>   		return ret;
> +	}
>   
>   	return ret;
>   }

-- 
With best wishes
Dmitry

