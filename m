Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891356ADBC
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7004113856;
	Thu,  7 Jul 2022 21:35:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD787113CE3
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:35:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i18so33290935lfu.8
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SD0NxvCJo32HYd+2WD+ONWSoll8afsUSYzd6YC6f2ac=;
 b=Yd0rw0t7ckAq+3RTm6AZOhVD5TIdiSyr2zkVbGg0YMmzpPjSBZrfpkkLZnKgXan7Pj
 dEsi8Jpkd1Bhm89Bfp+vTzdZiT2ydU3CAp6VVx64w//Eh2wWBQp3TKdtdYsbJUv1DgfI
 Uj0311zBVQEtAC0LBOoA+qJcL3woCe1W83n+ASzjW8Lct/UohtvCvqj29Gn+VCbymwff
 jHKwaTPdJ6M81cT9nFb36WAfYM/e4mqk7q22zULxugh8oqHHe1m+Xwf5N+J2E56JM8/W
 aY9yYy7zPXWEuStZfNAjd7PfGmXs0NE0AUpKMrE6qPPa1gr6MxPjFu6Kw472nk1jO7cH
 SgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SD0NxvCJo32HYd+2WD+ONWSoll8afsUSYzd6YC6f2ac=;
 b=btkIo0eNh79ZDyD3YNkfi64ePrP3W8f3RJUHAKt+ztu+ltZwgBmro+bSvTeU3q+LJU
 pU9FLr1xke3OE/3j7vygLJR0R9L8RWkZRQdSc7KF+xfy2mKV/xEZIlA4fSSFP+D8tYGx
 SYZ4jCRv04gDXOGnbVZjSYmRm/+HnzMoIdBogziDjf29ku3rshbWvvcIWtAfGrT7DHFP
 MT5EM3YO7Hl745lFM41rzfHU4w7S+fm/Azd9aMR1vIz7HPF0KupWugI1W49WI31PVuJc
 szRc44O5yKlzDRT4rPptxE1ZT4a4ITop1waZa3vW9dGvggldF9A9C9rThT10mlGppNjl
 bCSw==
X-Gm-Message-State: AJIora8OzMqLK/HTspI5euGrqpfQSPF3i5QXcAV9cjrqZmxFokAE0tIK
 SZiVZ/zRTh/79nBsq3Fu+UNaKA==
X-Google-Smtp-Source: AGRyM1s01Ak2ESoCsiR0hzOAkFb6zGRLzecc9aB/OcMWeyDDvPq67Rf/HR/PYmmWNLqShfF28ejfig==
X-Received: by 2002:a05:6512:2810:b0:47f:a76c:8770 with SMTP id
 cf16-20020a056512281000b0047fa76c8770mr182935lfb.116.1657229711019; 
 Thu, 07 Jul 2022 14:35:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05651220ca00b0048957b0c58fsm182205lfr.47.2022.07.07.14.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 14:35:10 -0700 (PDT)
Message-ID: <92483e36-e0bc-3cdb-a9b9-fa354c948c19@linaro.org>
Date: Fri, 8 Jul 2022 00:35:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220707212003.1710163-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220707212003.1710163-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix for non-visible planes
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Fernando Ramos <greenfoo@u92.eu>, Mark Yacoub <markyacoub@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/07/2022 00:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes `kms_cursor_crc --run-subtest cursor-offscreen`.. when the cursor
> moves offscreen the plane becomes non-visible, so we need to skip over
> it in crtc atomic test and mixer setup.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4dd0ce09ca74..4ba000951a90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -422,6 +422,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (!state)
>   			continue;
>   
> +		if (!state->visible)
> +			continue;
> +
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> @@ -1195,6 +1198,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   		if (cnt >= DPU_STAGE_MAX * 4)
>   			continue;
>   
> +		if (!pstate->visible)
> +			continue;
> +
>   		pstates[cnt].dpu_pstate = dpu_pstate;
>   		pstates[cnt].drm_pstate = pstate;
>   		pstates[cnt].stage = pstate->normalized_zpos;


-- 
With best wishes
Dmitry
