Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83F742480
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 12:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A8810E156;
	Thu, 29 Jun 2023 10:56:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE2510E137
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 10:56:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so797640e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688036213; x=1690628213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XudBHNh6EIvicDJvP3l5PakLMCO2XVjkw1Un1jKRhd0=;
 b=uu7ZjOBoQU8Zuc6xF9IASCisl5i3RJN+o5oEwL0m8WNpxK4h7tBhSvxhOCqQRrjq87
 Hkg7yfdzH0v8pIDmxRQAGR0u2DHKqAjQaV2OCkDaYZObNHJXM4/nLOXobEn13seseI6X
 T/XY7LDx1LM++ixk5soYZgowssC0pWDGzuVTcdV5WnF/uIYj0WWxjOZn2qju8TU2Emgw
 10SG3XblmYyhBTrBCl95QTy0tnbNfHFsKBYPqn6sxYmBUku97ztxomjEPhya+HRs9NYt
 gEodLw7pzi0dZm1rldmPfx3Obbtqx7P3KOpXnk3n28Rucp/+1cm01JhaxQmMww0TL7bL
 sAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688036213; x=1690628213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XudBHNh6EIvicDJvP3l5PakLMCO2XVjkw1Un1jKRhd0=;
 b=aLjSWrHDJhoWEANRwM/IoiK3gYmuwuBl38mpBLK0yVnR8qdhDdNFoGRLwXhsv8+VDa
 jMSZk8hW7Xg11u+TMNk7Wu5Bn5imRwilM7QHw28PkrCi2hH4muvjSQBk+TGh+Ytm6+qF
 ObEYfLcSKJsVxUaDn7y1yerPQi4UZVcf62GR9npl2Dx6FKQM9LO+jkN/5vh0DPccC76J
 ZinmhvVrdv4MVVnd6I3r348I57ghQj88fSdowMRfvbIh30OSx0BR9vvIqR/LW0wG+dhe
 K9I2NYU2RSOG9OGngszvw1PMcY18acACSIGcl0n/3PWKvErucapGbBm8uK952gBZvFl5
 2p2A==
X-Gm-Message-State: AC+VfDzJ8J9CEu1INKPTyy3xElMtZBnZGgDFCwqcnrtyQW4yEtfhg9Bw
 n6EiUL1bWgLoxoqwbIB8wi2zEg==
X-Google-Smtp-Source: ACHHUZ67QQf0NeeCiPkk8c2GdI8jXCRn30dGTaBROv29CmYfqAcSa310+UuNTx97NP8aEBPeMY55Vg==
X-Received: by 2002:a19:4f04:0:b0:4f8:56c8:e6b4 with SMTP id
 d4-20020a194f04000000b004f856c8e6b4mr22003723lfb.47.1688036212712; 
 Thu, 29 Jun 2023 03:56:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac248bb000000b004f861e64f24sm2276659lfg.113.2023.06.29.03.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:56:52 -0700 (PDT)
Message-ID: <9ea758a7-236a-6367-1832-fb65cb2ec75b@linaro.org>
Date: Thu, 29 Jun 2023 13:56:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-14-03e430a2078c@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-14-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 14/15] arm64: dts: qcom: sm6125: Add
 display hardware nodes
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/06/2023 23:14, Marijn Suijten wrote:
> Add the DT nodes that describe the MDSS hardware on SM6125, containing
> one MDP (display controller) together with a single DSI and DSI PHY.  No
> DisplayPort support is added for now.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 191 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 189 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index a5cc0d43d2d9..b21fa1256f95 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -1204,12 +1204,199 @@ sram@4690000 {
>   			reg = <0x04690000 0x10000>;
>   		};
>   

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

