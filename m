Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D672CBC9
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 18:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCF410E053;
	Mon, 12 Jun 2023 16:51:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD5C10E2C1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 16:51:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f619c2ba18so5156996e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686588660; x=1689180660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bc2XJlWre4e2gBDTdr+40bFjaee8RTH5UZuMdlZsuEU=;
 b=eZRgWXqo4hq6/oz9ha7x5zEK9V63CWuGLWH1lCsWH+9SQalC9QrdW9+Z8Sm1vPaZQW
 zjNDfoE6ARzQMwD+LgcM11ZFKqNHjtoz+e6al+L+ysHRyViWSg9iEGWzZDxB3xHFSiAL
 YyQ7LU2QpfIixZ3vpyayhXQh+zlMwNl/Vuk1TEiBH7bWjHFTRbVcVAfCeCygiqzO3BXU
 HdOIrIvijxV28fZ/XvnLZHMiz0XOdVl3768Q6DVJ/Zp68oUbRDTUzMEw17/bABFys7pQ
 OSG5P2bTuU7z6msDQPCa4G7wqBEjVeeirRTCPaUG9r3ebjQdOhvysO5ex8DjjOzNDAmz
 XoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686588660; x=1689180660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bc2XJlWre4e2gBDTdr+40bFjaee8RTH5UZuMdlZsuEU=;
 b=KF7ApOBmoh7deijkcLpbPPKtKkZE+mh82d3XwowKMIbJUurGbc0lL/z0E70PjkMtSQ
 z9FF1/nSzX1P+RN9tr/PDCjqWp+Nc88jVdFExYhUDA7yk6i0B901odrMjG7AOuNJ7bBM
 jSZ0k5zPou0kLyobY+cXOEUB+ZFn1i/W5EP+XCFgKe9kKRXOXKCdnQLXFZ7zIl5lh/A7
 CcY59c0nQoFwMnSI5KNn2GnqmbwZX/xYP62twI7I8sZ1huZpHyjNiwO8TmPhPC56V+P7
 L5pJ8a2rrnzQWwUPmlZSGQtJ5iuhxV53eDqsC1fsXMF1ihkeEU+bpGwmsNenvSfh1RRn
 Iz3g==
X-Gm-Message-State: AC+VfDxrWAyclglGdT5A1j4q8SPIwVeFzU8QOfvVdDhfXW2fAnNTR4Zx
 5iVH6C75uZn7Bk8hhx0vMA/wZg==
X-Google-Smtp-Source: ACHHUZ6EkKBZ+W8P5v+lv3YaBBS6PyGdorCb5izxLPIOXCqPw9kHf6veSA7sPnKJFqZWW7ZxSuYXRA==
X-Received: by 2002:a19:5f1c:0:b0:4f3:a69e:1d80 with SMTP id
 t28-20020a195f1c000000b004f3a69e1d80mr3863304lfb.0.1686588659862; 
 Mon, 12 Jun 2023 09:50:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac253a4000000b004f262997496sm1479085lfh.76.2023.06.12.09.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 09:50:59 -0700 (PDT)
Message-ID: <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
Date: Mon, 12 Jun 2023 18:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: sm8550: fix
 low_svs RPMhPD labels
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



On 12.06.2023 17:26, Neil Armstrong wrote:
> "low" was written "lov", fix this.
> 
> Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
https://lore.kernel.org/linux-arm-msm/1d3c05f5-c1bd-6844-1788-8df0b863a02e@linaro.org/

somebody forgot to run `b4 trailers -u` :P

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 75cd374943eb..972df1ef86ee 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d2: opp-52 {
> +					rpmhpd_opp_low_svs_d2: opp-52 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d1: opp-56 {
> +					rpmhpd_opp_low_svs_d1: opp-56 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d0: opp-60 {
> +					rpmhpd_opp_low_svs_d0: opp-60 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>  					};
>  
> 
