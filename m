Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC74B6DD5
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 14:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61E10E509;
	Tue, 15 Feb 2022 13:42:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48F10E509
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 13:42:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u20so8378276lff.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hY0Up7/tECmXoFbl+HD7sgq/lhDX16Q/eetVj5TEA+A=;
 b=GJRNsptHtcwMCCI5t8nKm74awQJH4mTGXqy79eq6kuo0MWFnru3J/Wciju/WVxNwWc
 HhXeuLmmBgNboXt3XHJiNj4hLpei7bs9RhvJS+ZWEQObdNNe/eiSOzMBO2DLwgokGlgh
 vq0YAafZnPsjIiwvjB5+UlyxKB9JQOnz7zsSQUDTChUadhOgpDvCr5emUsQdvY6Zgoof
 3G9FE2IsO/xhkYzfCw4Wp5kSjiKagHMQv7bp3AWpfjRFPb6P0cGhq7lCZkZjr8NzoRep
 g+ZcGSLdcX+tKB3rHzkzxcycXQj42sM6G5p+IHRXYdlhYE76KjnjIvseDbx0UCBfmqIA
 42lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hY0Up7/tECmXoFbl+HD7sgq/lhDX16Q/eetVj5TEA+A=;
 b=t1D8pP4DOJ/3dJN0N87C1/u1SV/lZasXHxQScNFy3/yH0PXkitFsLpprl9qLiotGKq
 0sh+4OUtZ5TZXMdNfF78qwY+jRU+16wUUgXnArBcch5RJnefTxKDl+7WvkBQY18EwrDD
 A23bLgNnjx6H99kT3zNB/GV0aUjC/NsDJxzZxqZqOxN3aql+zbGMdUCmJc0HCQ1wZoZI
 K65qYn1dSrRpJJT8WxpSuVdBmLc9MRHRYAYX+cTxbzPGdU4ho+FBCbgZRnKIzPeHm70O
 IxZ7tRHcpyhL9Uqf/Jj1hSiCKzyt2S/h/yo8cl55Lvdh48WP/b/1kdvr4+YeB9178LqH
 W1Tg==
X-Gm-Message-State: AOAM533JF6WYpyLCHuB6HxkFPzToR8JDy8m/f4klmb2S8qJOBxav8Pi1
 jQ4RZeTQb312k8hRvjuP01m9pw==
X-Google-Smtp-Source: ABdhPJyygcLbWYZapMlywGrtm+oGAbrJxcLx9ZuA+tZLQURE0YAg6PKPf+a/5npgmFrFOtPH26QoQA==
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr3238337lfr.444.1644932528534; 
 Tue, 15 Feb 2022 05:42:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm4522430lfu.48.2022.02.15.05.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:42:08 -0800 (PST)
Message-ID: <34f2eea3-c486-87ff-668d-7191b59c7d6f@linaro.org>
Date: Tue, 15 Feb 2022 16:42:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: Add INTF_5 interrupts
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/02/2022 07:33, Bjorn Andersson wrote:
> SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
> register block for this interface to the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes since v1:
> - None
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index a77a5eaa78ad..dd2161e7bdb6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -23,6 +23,7 @@
>   #define MDP_INTF_2_OFF			0x6B000
>   #define MDP_INTF_3_OFF			0x6B800
>   #define MDP_INTF_4_OFF			0x6C000
> +#define MDP_INTF_5_OFF			0x6C800
>   #define MDP_AD4_0_OFF			0x7C000
>   #define MDP_AD4_1_OFF			0x7D000
>   #define MDP_AD4_INTR_EN_OFF		0x41c
> @@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_4_OFF+INTF_INTR_EN,
>   		MDP_INTF_4_OFF+INTF_INTR_STATUS
>   	},
> +	{
> +		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
> +		MDP_INTF_5_OFF+INTF_INTR_EN,
> +		MDP_INTF_5_OFF+INTF_INTR_STATUS
> +	},
>   	{
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 1ab75cccd145..37379966d8ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF2_INTR,
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
> +	MDP_INTF5_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,


-- 
With best wishes
Dmitry
