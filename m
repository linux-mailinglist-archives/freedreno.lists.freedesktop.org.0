Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C7668AF3
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 05:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3483E10E98A;
	Fri, 13 Jan 2023 04:39:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6F10E988
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 04:39:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y25so31428009lfa.9
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 20:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rwPWckFN6l5Z0VUc2rVprLclAK1KfD6OaLDUvXSlPdU=;
 b=Hus9WhNP0DRji76qhUZD9CGZBPjXVgznHEyqxtiuCZvdjakWb7/pqgsZ6ogIyK7Bas
 RsErYkEFYFFIuWWrKINuUrESd+Q8tdxJf1d5ez8gVaAHyvNDYrWKz+4+lrB5q7j9GYMu
 Uwww3O2Q2Jxw9UbU0ybbDPjjoR4tTUYQPAhVnw8tJw51QJ/E1OPPLBJMeb+t7w3pfPa6
 CSe8ErQK9BiqMatIMuosQmkfJIKPHD/sKx5P80j5/PeKsZBUeh03LzSzkftt0bLsryFG
 3JMlDzzlKx7V4TvIax8OnW7Xc/tnqfICLmsXlZjikwo2c5ElObaf/PtYaw1k6R4hGmqw
 pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwPWckFN6l5Z0VUc2rVprLclAK1KfD6OaLDUvXSlPdU=;
 b=J6iB4re6RmfNn0tVkWcOcCarKpeZboGFSaThfSgX7C6suWANgdf5tnHeW1vR/vadnn
 irEUaoC8VRVFoqUjn/qZVKI479HDQfsD8S00b8lmoopmFd7PG6kOutqw6C/cbb83PX9m
 E+mPHPvmkoA3PL+8dAq7uDz3Qst4cYQH6OAKUOY0jn778ZHSIyPhjUFZP5twJam+q/hF
 gZKOn6tMN6mHVbQAaY1fpYDVD6mOxdkZE8locjoha0L83UKF6WLKEK+ZsrQ6NGbHaueN
 mZP/Ad0gZKi4oFUtI9VDdznlqcq7Dg9VwZpiFhelsHoRS83TGt34a0RNRanqEryNgwRJ
 qitA==
X-Gm-Message-State: AFqh2krQbTSL32ilqown/3IuKbA75+j+DcSSF1gadDeby1ot3HzsGlK2
 F2vpIE+nGrvNWvnA/8vKY9xFKw==
X-Google-Smtp-Source: AMrXdXuk1hI4hpqDsFfaxA0tg5vvn/WEymEIKE6fD6oI7k5DMiFrZUHrVB69K4e5s7uzDhfzb3cLVw==
X-Received: by 2002:a19:c20d:0:b0:4b5:7859:349f with SMTP id
 l13-20020a19c20d000000b004b57859349fmr18986772lfc.48.1673584757132; 
 Thu, 12 Jan 2023 20:39:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056512358800b004cb2c720b97sm3639604lfr.260.2023.01.12.20.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 20:39:16 -0800 (PST)
Message-ID: <6c6bb40e-3601-f795-a170-43117b39b5a3@linaro.org>
Date: Fri, 13 Jan 2023 06:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Robert Foss <rfoss@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20230113035939.185064-1-mailingradian@gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113035939.185064-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: add hw revision 410
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

On 13/01/2023 05:59, Richard Acayan wrote:
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1.0. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
> 
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

This should come together with the qcom,sdm670-dpu and with the bindings 
update. Also unless there is a strong reason not to do this, add 
corresponding qcom,sdm670-mdss support to the driver and bindings.

Otherwise the patch look good to me, minor nit below.

> ---
> Changes since v1:
>   - proper use of DSC_BLK()
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0f3da480b066..56709d508a6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -504,6 +504,25 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sdm670_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45C,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.highest_bank_bit = 0x1,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2BC, .bit_off = 8},

lowercase hex please

> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,

-- 
With best wishes
Dmitry

