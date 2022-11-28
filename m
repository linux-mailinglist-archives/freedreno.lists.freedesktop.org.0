Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C463A6EF
	for <lists+freedreno@lfdr.de>; Mon, 28 Nov 2022 12:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801610E1F4;
	Mon, 28 Nov 2022 11:17:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3978B10E201
 for <freedreno@lists.freedesktop.org>; Mon, 28 Nov 2022 11:17:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u27so5793562lfc.9
 for <freedreno@lists.freedesktop.org>; Mon, 28 Nov 2022 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBmx5gM1HUSGFAXNgKvH4/Z5Wwc3nSXAxC+/qB18ydM=;
 b=d8P29DNgM6zk6DvP7foPnQjFiGLcCG93PrYsmwjoD8PgpUNBVhDBgt0/jB4jfO5EqJ
 zwd5pAIcXybs3emROmpUpWQa4JcAKQSq6m5VejGtL7+pS/AcM6C7HlCmgqBx4X+hdpI6
 NccIZqwOZln0jwHauWRITUW7BT1RwqzurcDPm+3RPqxlnoilCG2lMwc+2PHcjyQ8PIs3
 c3zGNfyCh0oI/aYqSzENtxM4vSeOC9F+AiZo3cdMbDzS6ccdXf4aIhMtbfJvWl6zOdp2
 LI4mxl4i0qUpKXtOZ/fgSKHIkicqaXcp7AlonvlUHTorWvcbLk2UOPLIc4nKCwo/GxJX
 RilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBmx5gM1HUSGFAXNgKvH4/Z5Wwc3nSXAxC+/qB18ydM=;
 b=cXsnhnLdx7NNk9AZTnttlgx4+wJwai+IW31I1YVVRjNN+ye58rJ7QO+seatKpTySym
 wEYd2hEkyKKSs6zjy7r+ylEu1wcE8NObhVMlxQ7qCFaggbPZFoPsNvp3LhNG12cUf2rL
 DwR+xONjCIGFJhYTSucERDF9ieKDrWuxPo88UoTaDqAREabKCfpSVB0pk4yFJ7GntEwG
 OF6qY8YZI8wy67QrkfvsrUN/KT04c/kq1QnHVSbOBwiCf/94WaQP3wiW/drrp5AgumFf
 bfZboGibTYKv/byIZc641fKIxp3O1uv62cJ7ySUdIKKx8GSiJUXlN3VHM+rIvRuHSe0P
 dc5Q==
X-Gm-Message-State: ANoB5pm3tj85Xx1Zj4Dyf7alKbz/enedGaA0O93WcvJlrzTjCoPmxWuC
 0ZYtFl67ndNo10gexSgnuGDTWg==
X-Google-Smtp-Source: AA0mqf58DjNRcqLx332BX2KbrAmcyHS1EHrpnKwFkJJpWTuwx5iOEtDmizl4E6ASsmL2TwdG887eYg==
X-Received: by 2002:ac2:4189:0:b0:4b1:2447:6971 with SMTP id
 z9-20020ac24189000000b004b124476971mr11783136lfh.83.1669634268446; 
 Mon, 28 Nov 2022 03:17:48 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac250d0000000b00498fe38ea0fsm1691138lfm.174.2022.11.28.03.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 03:17:47 -0800 (PST)
Message-ID: <f244d3c1-e52d-8226-0d6f-58f6b5503f47@linaro.org>
Date: Mon, 28 Nov 2022 12:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
 <20221123210403.3593366-5-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123210403.3593366-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 04/10] dt-bindings: display/msm: add
 support for the display on SM8450
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/11/2022 22:03, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 343 ++++++++++++++++++
>  2 files changed, 482 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

