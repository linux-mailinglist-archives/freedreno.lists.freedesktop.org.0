Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911268C779
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 21:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761610EA36;
	Mon,  6 Feb 2023 20:19:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58B310E43A
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 20:19:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id eq11so12887449edb.6
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YpSBEYnC1yN1Z48asglOX+KVnSlBsHak3KW73YE2TaY=;
 b=s9pgKZv6vt41rE7EzzpJpXmOr8fEaNHTztldIuVXDDqVfSasjl0BdM+YCYYLO7FI8j
 kAwYc1wep9rcIEHW4U9+b8nl4MPCpdIMbhVFY2XORAaEB/Be3SzjtYIcR/quaYvu8IgF
 ON01RjCIkRDY3QJh7VI+qAx+VM3S6AR394PONdrpTVQKg88aZDFm+db5EnUWIKFAB+/3
 g55mHYoOqsrG4EY2lWxJZDWL82fxrAnywPNM74BaNGQg3ei5MfnZ4qcOgcOh1UArAd2n
 LzgYa/5PP6CorgICmOMufzvuZ0y/NLkztmzJM/LCMnROIbxXKrPGJak69BAhnahjeHAP
 OWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YpSBEYnC1yN1Z48asglOX+KVnSlBsHak3KW73YE2TaY=;
 b=1CutneP9WNZayF5yFFD5Er+8C1pUSXFQQrsR6w4mOxW9G+hlD3vcpxCONB9a2BLvrP
 4k18wiXSv8UUqSmVWfPQ+2LFO/eIRdN9pQBxXFUr6Bn4/y2gn8SqwHcReWEw1yJzYXNk
 ljIkmKzKPDi3wToS2PgXOClAZAGsyde2GGIs+V0GFudy8dCeLJPEDPloBUgmmDSMBFG7
 B6tCXTGo+bsyn85A8ZwkwARLGcwvlsILxyc7kC9lCjNkXLTEKVSljE/IgdiyvjYgUKUd
 E0E74jxncMZ7N8xw8SKydAVnCDqGUYdtElvgvo3uiDS93OJU5qkohxqMZpu/lNXD6L22
 M9WA==
X-Gm-Message-State: AO0yUKXWFHUQ0TNBbMgaqEbjQeybIsUt2jH0HYpX4KRh9gckUqvuyeoT
 E20XeuiLRMTuyR9swrueLKY8dg==
X-Google-Smtp-Source: AK7set+93id+gKLuBNqT3Prum9OcgkVfpgKbUX+ICOlvjJ2gZ2QBT5DFEuY9o/3ohDGDi2lvDi2s1Q==
X-Received: by 2002:a50:d7da:0:b0:4aa:b36a:7601 with SMTP id
 m26-20020a50d7da000000b004aab36a7601mr998335edj.24.1675714744222; 
 Mon, 06 Feb 2023 12:19:04 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 i3-20020aa7c9c3000000b004a087d1d313sm5478682edt.64.2023.02.06.12.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:19:03 -0800 (PST)
Message-ID: <6ee1f7d7-a923-8f93-f68b-decdc263987a@linaro.org>
Date: Mon, 6 Feb 2023 21:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/8] dt-bindings: power: qcom,
 rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 6.02.2023 15:57, Dmitry Baryshkov wrote:
> Add define for another power saving state used on SM8350 for the GPU.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
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
