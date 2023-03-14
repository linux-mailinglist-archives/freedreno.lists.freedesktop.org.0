Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA16BA208
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 23:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274610E2C7;
	Tue, 14 Mar 2023 22:10:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC110E2BB
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 22:10:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x17so5798316lfu.5
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678831842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xa6qL+0cyQtdd06tlhVcRMFF8+ijkQsFwj/v1CH/YRY=;
 b=DGMqSQPQuS+r9I5ntAoMsVOVOjmu/EuPgstaOB9ABRALVI14LAFehPzSOqHKG9eOT9
 zJqBzEOouvJ16zWawVP1+pYWnAj/0BUbcH2jzF3rE516SDvyE4Ok4EThPx7urw8Tsdtu
 L3lwgQJkXGAw+HuQltEGgpzNfovW4bf7tbtu+1Ph2f91kXlKgg/OMTvVlII+bdGeyt2n
 xqOBVu95Bp21eag5csmSue1xiBQMVqXoKSlqZXTfa3oFkRcmPc2pZBTn9LincDMXtBaO
 wIki9/weLTQYXMdtOCLRxBvFUTYcf4q+R9vGKeJk1QXtM/u2oKSeZn8nbJmeHwmHUV/T
 y77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678831842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xa6qL+0cyQtdd06tlhVcRMFF8+ijkQsFwj/v1CH/YRY=;
 b=xWBMOnhGy3C25uaZof/lbgrUGM/VBZO1QeCXHKh3YFJjnVK8WKxUyke9hKWASrUnqp
 7xChss5HTAeib6qHMY+pVVF5tiRvfwa0p320HzauWfkDjg3HX3ghwNz4/vmV78IaBE+r
 69gSR7w7cz289c36pkicLsXhgBAgbCmBQlgsL/t2FLcSF+4JrvnzicmbRtG9fAd2kRoX
 VqiEXqShzsYdh1THLPFjW9dUDG4Hkofm57r7exaCtrTlXjHB6htEZs9QD6Lp6r6UvDMS
 b8X3II3mXJ16yAAVmu8aLcbB5zsTwFoJRfkI4Vs0sMNJSdbVZ2WMq20oaPSPQXVWztdZ
 eitg==
X-Gm-Message-State: AO0yUKUrjbYEJR+2ufAhaAhk9iyRoPTepkGpnp9HC7h85VTXwNHLQGtU
 ogkMYswagllTMioV5CRVuxDc/A==
X-Google-Smtp-Source: AK7set/CL8Ze4Qk9YgtnTcm6u3tNa1jyupEcdr8xxX4+Sr4/EUKmodC99ZABfJHlPuVuyJ8q2JycLQ==
X-Received: by 2002:a05:6512:7c:b0:4cd:ae0b:9397 with SMTP id
 i28-20020a056512007c00b004cdae0b9397mr1176558lfo.67.1678831842680; 
 Tue, 14 Mar 2023 15:10:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac241c2000000b004db1b99055dsm552935lfi.229.2023.03.14.15.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 15:10:42 -0700 (PDT)
Message-ID: <68a26435-4f00-1571-88ef-1f3c0a254cef@linaro.org>
Date: Tue, 14 Mar 2023 23:10:40 +0100
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
 <20230206-topic-sm8450-upstream-dp-controller-v4-3-dca33f531e0d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v4-3-dca33f531e0d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 3/5] arm64: dts: qcom: sm8350: add dp
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
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
Downstream doesn't seem to use this lowest freq

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
>  				};
>  			};
>  
> 
