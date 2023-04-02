Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798236D379F
	for <lists+freedreno@lfdr.de>; Sun,  2 Apr 2023 13:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370410E2DE;
	Sun,  2 Apr 2023 11:28:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE53310E307
 for <freedreno@lists.freedesktop.org>; Sun,  2 Apr 2023 11:28:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j11so34509386lfg.13
 for <freedreno@lists.freedesktop.org>; Sun, 02 Apr 2023 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680434879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dRjeb1n7Wvcw6uGzT8QJh1z7gswxsKnW33SjxwiLi4=;
 b=LTGvv2ApCNo2eU5PUkM8zq/+mHd6wL+Cvp1AGN4xnd0b4sC4vOyetIGPrbgGaQCGQi
 cLLrGomHxi7PJRTyl9BgnTP1oU7jBlSy2vSsgz4x7EJ7WlPBeBn4l6fg33Wpn0iyO+vx
 nqiQwM9YNyfYP5gftfobtSlpDhKGHY1cS+DDsOA9/Z7lpdJjjXRTplq38ta+nX5+B3xt
 XD9rt+v3VDiI+Y+SyqGus/0M2Faeiaq3c1sjJVm8gkyzqUKdJ9JKHmxK0uCjcto3APfx
 4m6/KWfp6a1iD9fBkNQHY1w5c5VAQCP13TsYVc4Gwf3EQesKgcYoW6Yk4EK5BR+5wBMs
 g0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680434879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dRjeb1n7Wvcw6uGzT8QJh1z7gswxsKnW33SjxwiLi4=;
 b=vJEHTGp79HzmYMe0Q4IiNJ2VwEiLFMTqWVVNbxbyJY3ZKKQubG/u7LQnzrZHSX6dH9
 uXNTLB5zMl9g2hwCJw7j/RGl28WiyCssdEzM8A0cxGNJrCriNGJTV2tYjhDqHY0DYuvZ
 VhrFt8b7i8dCPf1dQTkAy6db7WMQI8LWtyznYlKvC/Y/QblnArnBYOva+JbJUmCFwt0P
 Z2W1JSP21jrYft3DHHg2EeM6B7FSsoxt3OxCshx8KTGcQKr4SX7QKzhPXjObmkOvtL4z
 xtkhnnMzCVajCkHaoANPt5LO0vbvyHIXhR1Lqd5CGNprtvh1tom1eG6/7UBmh9TLUREV
 H1Kw==
X-Gm-Message-State: AAQBX9df/j/N9sR9QaeIyBlEUUjp8PIPw2xC4PMuA3Qs/aCqWIC3R6lM
 V6kQfBWBFIkc/OlYCRDwsfCwNw==
X-Google-Smtp-Source: AKy350bkjJYdW21mqXfNhkBCKfo6mfSqbS6Hv4aapsFlBOMGs2rz+G8zFTST84NIdoN/yaApZnI1dw==
X-Received: by 2002:a19:ad45:0:b0:4eb:1495:44ee with SMTP id
 s5-20020a19ad45000000b004eb149544eemr5587315lfd.48.1680434879673; 
 Sun, 02 Apr 2023 04:27:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512006f00b004dc4d26c30dsm1250315lfo.63.2023.04.02.04.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 04:27:59 -0700 (PDT)
Message-ID: <b3a9fecd-0677-482b-7066-03465d5f0dd0@linaro.org>
Date: Sun, 2 Apr 2023 14:27:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v2 4/6] drm/msm/dpu: Fix
 slice_last_group_size calculation
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/03/2023 21:49, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index b952f7d2b7f5..9312a8d7fbd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	if (is_cmd_mode)
>   		initial_lines += 1;
>   
> -	slice_last_group_size = 3 - (dsc->slice_width % 3);
> +	slice_last_group_size = dsc->slice_width % 3;
> +
> +	if (slice_last_group_size == 0)
> +		slice_last_group_size = 3;

Hmm. As I went on checking this against techpack:

mod = dsc->slice_width % 3

mod | techpack | old | your_patch
0   | 2        | 3   | 3
1   | 0        | 2   | 1
2   | 1        | 1   | 2

So, obviously neither old nor new code match the calculations of the 
techpack. If we assume that sde_dsc_helper code is correct (which I have 
no reasons to doubt), then the proper code should be:

slice_last_group_size = (dsc->slice_width + 2) % 3;

Could you please doublecheck and adjust.

> +
>   	data = (initial_lines << 20);
>   	data |= ((slice_last_group_size - 1) << 18);
>   	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> 

-- 
With best wishes
Dmitry

