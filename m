Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B336F515DA5
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 15:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4F710E523;
	Sat, 30 Apr 2022 13:35:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDAF10E523
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 13:35:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y19so13543421ljd.4
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iFd3GeSeIxlhnThIEOE0AizZsykGoTGqF7fBHefKcRw=;
 b=Yr3jeQ0YjWaMXpO8OQ1W8EZfdyqJVppd6BhrmMbbvqLP6S68HZZwKkRIGYf/qV4dul
 4tSM8t5PhEMHmFvJxCgcOfOycXb3VPC2jFS1TEFNpOwsIHLh+2GgoT1GqcGpd3dyJ57W
 uiPLQbMfEaN95s8/7JTye6E5Mm91v8JTXIjRYw+zsaVTuQVj1XFWMeGeM6meUp9F6Xmj
 Anq5Qavha3apIlnPE6w9suHpOo7vTCSfTjkMlJ/M4qUj8lXfKlwgWBLI67R14M6Xwql0
 6KW0oLcXMv87mPpVMpf0ns2D+x26Ece7Jzjy7EAI89JSntU4q3hjjWUXRf+fhMWEGK7S
 DBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFd3GeSeIxlhnThIEOE0AizZsykGoTGqF7fBHefKcRw=;
 b=lw/Lhxr2dVaRcSOlVF13s238+vbSerHlWuQHXuH7hBneVdVlzh5LF2wxdSwxfwKykQ
 i+oXypeF58jnE6I5E5ZkeSabXv8OaqbnWBrWUcgnifZ7GV3FHSwsFp/CjK17ri6tsKRk
 lFby6tiXZ2d9stsCAmF8FURCIflQmK2RlPUkOvVhcIa7ghv4TEgXG3zMmxnFvP4bqeQj
 SxBkEEztwrgLdxmC0Oj6eaLrNrvvBe9DBujdUNAlre8x/nDtwXbPxtQYp7yG0WE0JD5b
 /ZW7G/8CEvoJx0O2cZdjZ6Q2r8PAH6fq+MMjgVdqdBNy/Dy9cQR7a0UetCraLK2223hg
 pSJg==
X-Gm-Message-State: AOAM531UomdW9gzGFnYmS6ATpHRh2o5tfMbXlAc3h1Rn31PgJDJm0tHQ
 HoND327dQbaaRokUd+qYuxP1J8gxexa6XQ==
X-Google-Smtp-Source: ABdhPJzNLw1eQyaosYQdzqMuY+hEWVebXW38tY390DGAvqBSK2Y0QLCP3hM9BFw9y1b5xpiCcdKFZQ==
X-Received: by 2002:a2e:a58a:0:b0:24f:328f:3a5c with SMTP id
 m10-20020a2ea58a000000b0024f328f3a5cmr2566255ljp.25.1651325751235; 
 Sat, 30 Apr 2022 06:35:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac25594000000b0047255d211ffsm193099lfg.302.2022.04.30.06.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 06:35:50 -0700 (PDT)
Message-ID: <45513aa3-cc0b-2952-a282-94829021f552@linaro.org>
Date: Sat, 30 Apr 2022 16:35:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220430005210.339-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430005210.339-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Clean up CRC debug logs
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/04/2022 03:52, Jessica Zhang wrote:
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
> 
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
> 
> Changes since V1:
> - Added reported-by and suggested-by tags
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558ef566..16ba9f9b9a78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
>   
>   		if (rc) {
> -			DRM_DEBUG_DRIVER("MISR read failed\n");
> +			if (rc != -ENODATA)
> +				DRM_DEBUG_DRIVER("MISR read failed\n");
>   			return rc;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 86363c0ec834..462f5082099e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>   	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
>   
>   	if (!(ctrl & LM_MISR_CTRL_ENABLE))
> -		return -EINVAL;
> +		return -ENODATA;
>   
>   	if (!(ctrl & LM_MISR_CTRL_STATUS))
>   		return -EINVAL;


-- 
With best wishes
Dmitry
