Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FBC64656D
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 00:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA8210E440;
	Wed,  7 Dec 2022 23:51:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818110E426
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 23:50:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b3so31160026lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 15:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pq17unfSto09mroIVDYeSKKbTNZYwLPO1fJ1295vloI=;
 b=eYb5vcySkHkPVwZt6SBLHmnTWkrCb3H/dugfnLcE1CIivRcZ60CXDA6a67yai9s0tY
 eEncVrzjhKuXjLgTpMS5Fc9ECD2nJEk8rqzKivT/iJSl5SCONdv46ID8WHJlEXc/kM15
 uTeuA+q7zsQJ1jrGPLf25h0ZM++E7r0zLxfWHOfHKHKDQDXykUAV32872BrhNUqdYc+U
 kZ/1Fpo42UJjJd0/NWjzGSQKdYUVoaDhE+AH6Sb3ZnlTU0WG95MYitVbcjVdOPg2k0R6
 u5i0Vu5v0AX7ZgHscxrXMigmJRlX2ZjHp7aKAozZiUURa8dsA4HRBtawozB8KefVAshJ
 UPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pq17unfSto09mroIVDYeSKKbTNZYwLPO1fJ1295vloI=;
 b=39K6Bl5P3MKCOQAv1TUUu2AVsws0g+2IOk8fyR5LIIlB/DuxCH0hmdzCd3uIanSiiY
 nxPyO4m/1KqfyeA3lpEgJKdcAy7sBBYCTNGTkhQhSyleV//ZfhqKNe9/9UMXlnmurfFO
 HJ7pe5BWwDaciILs3vf1cUr+jMWjJpxtqCNSIqtxBEqlXpawNxQREavsuBbkIZJHeRS6
 sIqFNDHz0VcyNVyYyELMaUHzQPrDAhJXopcDaiQWtXqqvCKv2xrQbxQAPbYmtjVxGwm6
 S1kGFC7zwtYe1J4sNLF8IDmGLrxG82gP7ce0q7Fscs/cuybrO+oT2r9W+w4Tmabh9IBl
 Kxvw==
X-Gm-Message-State: ANoB5plM+MaXerBnocuqO8Q909yU76eYXHBNpmv+6GqggNZ6sTccMMMk
 /GLq6bzlZd9prP65/7l/LS+NMw==
X-Google-Smtp-Source: AA0mqf4IX6sJj2egyuPhOCNjryyQqIJH/9UIiMi7b8QIo2VyPbST/fg5I5gtP9WXpE8XjARg//rlRA==
X-Received: by 2002:ac2:5e6b:0:b0:4a2:7c20:15a5 with SMTP id
 a11-20020ac25e6b000000b004a27c2015a5mr26894754lfr.587.1670457053135; 
 Wed, 07 Dec 2022 15:50:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004994117b0fdsm3038581lft.281.2022.12.07.15.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 15:50:52 -0800 (PST)
Message-ID: <feda0561-1291-daa7-ea01-db5729a1a415@linaro.org>
Date: Thu, 8 Dec 2022 01:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-6-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-6-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 05/11] drm/msm: Add support for SM8350
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> subsystem unit used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index a2264fb517a1..39746b972cdd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> +	case DPU_HW_VER_700:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> +		break;

Judging from the vendor kernel, the highest_rank_bit is 3, with usual 
todo for 2 for LP_DDR4.

>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
> +	{ .compatible = "qcom,sm8350-mdss" },
>   	{ .compatible = "qcom,sm8450-mdss" },
>   	{}
>   };

-- 
With best wishes
Dmitry

