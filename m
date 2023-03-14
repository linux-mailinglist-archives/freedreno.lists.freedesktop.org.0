Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AF6BA211
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 23:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EFF10E2CD;
	Tue, 14 Mar 2023 22:12:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E410E2CD
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 22:12:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r27so21906129lfe.10
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678831943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q7IZ9/42Vz12w/UhWJvvh9TDHZc4aTylvTdpvECO9YY=;
 b=crYJ+AsWsbvri0SBzNdxKp2m4z3iMgx3xNd45aNqdiVGwSrH0uBCa4Eb5Bt5LHQ4Js
 XQ+DkqM3moFi59nk0XtrglzfB7MVYbvol+nhffaM2KutBLwh/3vTn5pEbpuiwD57oW/O
 Baf5SRSb028y5hszarmDhzHfLBjkQhEaWsRx5qbsem8wA2wWGTRKx9sJiM46YI7NCGaK
 mPXFlZooGYc2pUlvUOfJ89ZJYc4omf+2fv2SbQ01HDYnUaP7TNE28u2O+MEOLqxz+D9K
 1TlHeL1o3LCOmAtulgpp4eGYcCFEjnu79UAiXYBsHlpOLGBGRgQLqTF1VcBM/fvtluWu
 EhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678831943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7IZ9/42Vz12w/UhWJvvh9TDHZc4aTylvTdpvECO9YY=;
 b=TjSY5l5knFNEwHcaqZC+chJbmfy+R33xULXpOJDBMghhxW1B7i0wAP1EuU1OaLUeYU
 7sHMAbjeFwrxMofmfYU9+s3ClQpmCNp92vX309U+YKZGN28tB4U0eBMEM5gcrv7a6J2h
 QU0gV7Yhlbd5VopN0Q3WofDAhU6zh/PopL7JoYUrhFYfXBKZT4GUT2VRVCq0JvLGQpky
 ih9CyPM5ORfaOMXkbbKnjYjuv6ufAAwpziud1hSkE39waDyKI2C7txcPMtww+om/TTBn
 5Ape3Je1JsGLQEqmrsnwFZyKYsFo0Rmh7r8ABqURVyPRCnkg56xxqvSB1bFEDAv3BWDU
 pBdg==
X-Gm-Message-State: AO0yUKVamm6xvieMLxDT6bCXCfkOblO/4ltuMa+V14TaNIizVjPXAP73
 g2tx2d7gitTFRATpVuCkk3GvugxTsiwvXe+DgYQ=
X-Google-Smtp-Source: AK7set/ZJKSOqYo3eqRe7cU87LMkjRpUBViavrajwK8eZnXV7MJyrHv254VUmXBH2Bu1YB16/ZZt/w==
X-Received: by 2002:ac2:44db:0:b0:4e8:5112:1ff2 with SMTP id
 d27-20020ac244db000000b004e851121ff2mr811415lfm.27.1678831942897; 
 Tue, 14 Mar 2023 15:12:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05651221c300b004e1b880ba20sm552430lft.292.2023.03.14.15.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 15:12:22 -0700 (PDT)
Message-ID: <c63ecdc2-11e0-79d2-8647-284913f0c0da@linaro.org>
Date: Tue, 14 Mar 2023 23:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v4-5-dca33f531e0d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v4-5-dca33f531e0d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 5/5] arm64: dts: qcom: sm8450: add dp
 controller
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



On 9.03.2023 10:19, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
Downstream seems to use 19200000 here

Otherwise,

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> 
