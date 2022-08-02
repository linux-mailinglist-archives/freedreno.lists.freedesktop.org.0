Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8225877A5
	for <lists+freedreno@lfdr.de>; Tue,  2 Aug 2022 09:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDF82B19B;
	Tue,  2 Aug 2022 07:15:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6187892DE
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 07:15:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z25so20720567lfr.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=c61IBeGENLBrfZtlLVNhveGWmLmYNBW+8+c+xekhbN4=;
 b=xisHHreQsg8+3CNQvjUzLiFcibwj9uUxJ2QlQewRTagHGQoP36+CZbvfc/rrpsOTsr
 5esKvZs4yhrgNcCEKQfRA3I3wq+Z+aiJ4Y9V4JV9TjrlXTOYVgTtCTsuw7qLBwDyRZ8r
 WFsaNN8T6wlUS6CDzl9oPjiDS/FhO/T5pJ2zo8hhy/FhwQRYsHZfYcgHV10LIKiWJ/Po
 lUoNmmJpUGJxZvrh8NRphScyouZmrcNiWwwzMayOFyD/ettTncNk4fs4mGCUJ4OyrRKU
 1kIDK3/XM4M0j7gW7SDCyhs9oNuaWY1jF6MdTEPNM1s52BlkfE+Zztk6ElhqAeojqbnP
 NYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=c61IBeGENLBrfZtlLVNhveGWmLmYNBW+8+c+xekhbN4=;
 b=mCBCikzQ+049W4zUqJJeNU0UpywI4tqA5pVKHeeMLc1EnfiPYtIIRZaoA9zJQnx0SE
 tV8ZU5iBU47m438EwnN03t5wALDBfqiWTQcEB3z/D4LVW+xsatg0WOJPjw2nRAZok0Y/
 asAsfN9tp4551dhPqktsMLV0bN8iQlvUXeA1BRnVzQTZRdBxNIVEDwoF3v0CdlCoxo6i
 lg15JIuc48poABsDVktiTYsnwZMVRRdQ0rXS1jUM/HZkrCdUs49QCNkmzuq7I9D+iUEz
 BLcCrj8HzALJsyAFOjOz4eH+Eq5xxN32zanrs0cbC19vSG50QGiEdpJ7QN9paFSjSkL+
 IM5A==
X-Gm-Message-State: ACgBeo2iD9fWuYa997KYYj1uQDt7zVeMJP5YcP+6XZqqJxu5AoBXy00q
 oYjvHy3goA+tqC8Nti9HpsXxDg==
X-Google-Smtp-Source: AA6agR4DKQ54iF2lBgq5cgDu5t0vw5ELL8IbGd6dlICfMebN3W4GFM72tUtCrYKW0uIY59zfuFAv0Q==
X-Received: by 2002:a05:6512:3c8d:b0:48a:f74a:67b6 with SMTP id
 h13-20020a0565123c8d00b0048af74a67b6mr3619423lfv.231.1659424528774; 
 Tue, 02 Aug 2022 00:15:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a2ea4ac000000b0025e48907929sm922293ljm.23.2022.08.02.00.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:15:28 -0700 (PDT)
Message-ID: <9098554e-5327-0b7f-f4d0-a81880556136@linaro.org>
Date: Tue, 2 Aug 2022 10:15:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.3.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220730144713.3.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/5] clk: qcom: gpucc-sc7280: Add cx
 collapse reset support
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/07/2022 12:17, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/clk/qcom/gpucc-sc7280.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..f5df51d 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,18 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>   	.fast_io = true,
>   };
>   
> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> +	[GPU_CX_COLLAPSE] = { .op = gdsc_wait_for_collapse, .priv = &cx_gdsc },
> +};
> +
>   static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>   	.config = &gpu_cc_sc7280_regmap_config,
>   	.clks = gpu_cc_sc7280_clocks,
>   	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>   	.gdscs = gpu_cc_sc7180_gdscs,
>   	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> +	.resets = gpucc_sc7280_resets,
> +	.num_resets = ARRAY_SIZE(gpucc_sc7280_resets),

An implementation question. Do we have to poll for the GDSC on platforms 
like sm8150/sm8250 which have the plain BCR resets?

>   };
>   
>   static const struct of_device_id gpu_cc_sc7280_match_table[] = {


-- 
With best wishes
Dmitry
