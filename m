Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC3642D52
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 17:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3A910E256;
	Mon,  5 Dec 2022 16:44:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D85110E0DA
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 16:43:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ud5so29224428ejc.4
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 08:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+T6ZUg9Uts/RCycJHNnU8zCmKcz9otv2yooZkgV/xEU=;
 b=Hxf6ckTx/c9ffNaO6EJZVXKMHXYgAllbIT83I+FhPvda0enX81HjSLXcVncB/kIZXy
 y7dH0rONJeGnSkh54tMeyIT3ypay8TyFiSFQXwlI5rCzGebgG9JMygMZjSDTd6duJ+WW
 3zw0JselUsVxZIn484XFKVnFaQuEF6VLnGG5LiZ04OAaltGl4U1DNcrvEzuvaCJIBCJz
 eovtEsjDyYtwOw57TGsTiiNiXn5r1Ze7VilXhV1fAsEIyzBjmfWNHOVkWrHSsg4GcB7Z
 8TZxXt4JH/TGVWSTamS8NIl/RWXDcoKzCCe/0cZZ0gx/2KN1puFz7qDdVjbShH8meKdF
 jo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+T6ZUg9Uts/RCycJHNnU8zCmKcz9otv2yooZkgV/xEU=;
 b=6v8evMOIASDQO+6lYMtzsEre7ExCsdtVw4T0d7spCS38uwmDpx+s5+zvkO0i5uoKOI
 l564uAIkK/ZRVQvbrd+wYjlmtFQ5z4669xkrkKU44ZQaeoxhZiyCfr9Dq3yjFnxStjdb
 J6skrcjvQyGxD35b1ANct7tf5ZlCSsTR3dfEjx88z38nYVgjHyCxiwAAtZQdQ06TAhxY
 IfpJ4GVW+nStxPGOJ5bewLMV/IOutzJYQk/erFmqSmGsY2xIstrszl/nGB3sq9n4tlVE
 eh89LCUhRRjnO3JXlA20j58/348qp/a9ApnGv/mU62tgk/RC7py381wLOYHaD8T0QOAt
 Tp/w==
X-Gm-Message-State: ANoB5pmWLCOSb8xZfHjQxs9hcLTuIzWEamKHU0peMdv/yWVjvyTCBN+7
 oqKwbDLLwSMpfjgiBnMh5//prw==
X-Google-Smtp-Source: AA0mqf7pPnPhnBxvry/tioTaBmpBBDvwmqAlEex+xduk5phI5NL2OfmBidmBJ6uVRoYg0YjMdARM3g==
X-Received: by 2002:a17:907:9555:b0:7c0:b87f:95c5 with SMTP id
 ex21-20020a170907955500b007c0b87f95c5mr14978369ejc.86.1670258631856; 
 Mon, 05 Dec 2022 08:43:51 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 ha7-20020a170906a88700b007c0bb571da5sm4652996ejb.41.2022.12.05.08.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 08:43:50 -0800 (PST)
Message-ID: <f448712f-6915-eeb0-2f9a-37658512db37@linaro.org>
Date: Mon, 5 Dec 2022 17:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 swboyd@chromium.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-6-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
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



On 05/12/2022 17:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> subsystem unit used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
