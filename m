Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4B68BA9D
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 11:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE16C10E36A;
	Mon,  6 Feb 2023 10:44:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D210E366
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 10:44:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hx15so32806853ejc.11
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1Iempz3M09BbHziizB4P4d8THx1f4RE8dK1qpEI8Bw=;
 b=JZDcosQ+KeXXz65xlrHSr3okKyEdYut5ZN4GuFh2DGYLko78Zr/JFAVgxmJnsElbqA
 BPop+rdVObU3p2nis1b/l0Gm+N05WgRnCQdrl5xCwT5PTxs663kcTgfTexiIeRFq8wEV
 5mxlHWuLEAu9MXkm3r4gC08H/zgHbsZe1l/ewjc0ekv/Jprq5YL42dtkaTwB3XPLgKST
 qAxrh7zinJFpWDjSuN1dZWwkgKSsCKie4hT3T2po1T84Pu+0zJcjQo8PEEjQDqw9xLTp
 1uPS+Qu13fH3QKSgzK6pFzSx7EI565Q1ozbwLafxkHv+ijLIXzAr4DSWSF+17yOawXn0
 +UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1Iempz3M09BbHziizB4P4d8THx1f4RE8dK1qpEI8Bw=;
 b=J3RaIvFpcuOcZjQ0fCMJU5sY9BAyti7/ifN4MGvI87pr20lwo12qE3IhkR1DpyERtN
 m31oB1AdRXyA3+vygBDIomZCtpJo+nDnrpdf4txqX7MmtCbxLGZEXclvknhJKnS3MRdi
 UnETGZPEuBhW5O0EEb2Ra3ImB8dKE/SNEb+urdV4v3GjgHog9zQY1OaUNkK9+cGTbRB7
 8TUCcupTWJ2vecp66A/sp5rhqEkViZp8kDngfCZI0vfLn60orb1BB9gNYzWXX0wIEXwG
 hzrrsq9DkT3ItIBzAumTszllO9rbFoF7CFXWFTTzoW275OpEBUd/trE32HUKlG4QnqBZ
 0wvA==
X-Gm-Message-State: AO0yUKXMR1iViTrxaNiUO68KuQUGr5lDl+Fe+ySRTawQAHth4Zmw2BYe
 nMQemjlsgpAw7fQTMSSxRIR0AA==
X-Google-Smtp-Source: AK7set9epcGwzF22cdUrtDa7YO+sKgIkS6xcAldSY/IvGSqQATO+wss5yMLF5C8bWbidZHuCbpuFwA==
X-Received: by 2002:a17:907:72c1:b0:871:178d:fc1e with SMTP id
 du1-20020a17090772c100b00871178dfc1emr23906772ejc.77.1675680278961; 
 Mon, 06 Feb 2023 02:44:38 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a170906348800b0073d796a1043sm5186319ejb.123.2023.02.06.02.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:44:38 -0800 (PST)
Message-ID: <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
Date: Mon, 6 Feb 2023 11:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 6.02.2023 01:27, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8350.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
Wrong patch?

Konrad
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4a30d10e6b7d..1bf8e87ecd7e 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -211,6 +211,7 @@
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>  #define RPMH_REGULATOR_LEVEL_SVS	128
>  #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>  #define RPMH_REGULATOR_LEVEL_SVS_L1	192
