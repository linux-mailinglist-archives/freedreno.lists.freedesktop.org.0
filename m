Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A3691F18
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 13:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FE410ED04;
	Fri, 10 Feb 2023 12:28:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB42410ED0F
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 12:28:32 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so15446781ejc.4
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 04:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MISpw0Ywy9/GGrDCiIfVSWiguaYD6aHQRvEnwMDid1U=;
 b=xfypag1TvZ7OKj0C7m+I+7D/cOsS4DNQkRvD0uvkuPzIyRI7ygDVr278S4oGZo/VVN
 GoiBpHDQfJ28j3FBfbkQBLoqzWfX8B/rxmnssWTgEq0L71r6Fgjj7mUfjMEUhwG45Ed9
 U7v+umcfDPQum0jUD1YjSS6E90VWG+BM8sEESlJE5wGUG9VlNGQsWvOWv9rPGikpjLM/
 SstyKiJpRMZUEeLUbZcvb4TuTFXAnPAyxPgNb9xNDIDPUycLcpeXGolSNiExLhxMEPG/
 +QxNQT5kYF8HV9OAOe+xK7d3ldfExDUi5JCYMfZ7bNE2W/1lzP/TAXB4bnkn3zWXYY1w
 Kmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MISpw0Ywy9/GGrDCiIfVSWiguaYD6aHQRvEnwMDid1U=;
 b=bBhhrR7pt1MuhPQ8E1sbbwHsOI+j/33euXrcofYa19x0oWHgE3WdrzFxOxHzEjsJ9g
 Y8typQE+segTLkihFwLhizLWE8ckuE4sQCo84DfLROZP/1/Zx6U4VT2Wt1Cj+PoIyogk
 kMzuoxnd/Dw2Pe3T4BYZyaNBRJ/GWulXEMwfq2ZOYfZPXDwN+TRbcb5iIbLOyhoEQ0vp
 OoyrNmmCGp+vjlC13WwqhquG0TGmN0iFqIi6s7SswCcj/pVAUsKQfEjkhrU6VsCNSHkA
 AlYxO4RiKq7uZ8DmLTiK2q9xEzLj+htvoF2yZ9cozZN6m0ETa+Q18nEjge7J2X0agVVS
 LEpw==
X-Gm-Message-State: AO0yUKVuPF2U/nPqa4pCzwbStJK+cS0rEVv9MvyqhuAIMH0+XH3Ko1D/
 FSdRd9fyiZFLgu7v2pGDrTni0Q==
X-Google-Smtp-Source: AK7set/y1xP26UOmnMgJCW2UgOFzL6HRx3ZySveIZ24qoL6xMia2A8c/BGmvU8hytR9U08dkrEp1rg==
X-Received: by 2002:a17:907:86a3:b0:8ae:d191:aa2b with SMTP id
 qa35-20020a17090786a300b008aed191aa2bmr10860216ejc.6.1676032111249; 
 Fri, 10 Feb 2023 04:28:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a1709064d0d00b0080345493023sm2283583eju.167.2023.02.10.04.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:28:30 -0800 (PST)
Message-ID: <23846ff0-e410-b7ab-3cc9-b45fdbf4a7d6@linaro.org>
Date: Fri, 10 Feb 2023 14:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-4-529da2203659@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-4-529da2203659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/5] arm64: dst: qcom: sm8450: switch to
 usb3/dp combo phy
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2023 12:34, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 41 ++++++++++++------------------------
>   1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d66dcd8fe61f..6248adc546f2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -748,7 +748,7 @@ gcc: clock-controller@100000 {
>   				 <&ufs_mem_phy_lanes 0>,
>   				 <&ufs_mem_phy_lanes 1>,
>   				 <&ufs_mem_phy_lanes 2>,
> -				 <0>;
> +				 <&usb_1_qmpphy 0>;
>   			clock-names = "bi_tcxo",
>   				      "sleep_clk",
>   				      "pcie_0_pipe_clk",

Same comments as for patch 2, please use new defines for the QMP PHY 
clocks and PHY enumeration

-- 
With best wishes
Dmitry

