Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A145700C7
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 13:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1D48DBCB;
	Mon, 11 Jul 2022 11:37:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1938A8DBCB
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 11:37:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d12so8164068lfq.12
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
 b=ZMw7KZQ3z67YtPsjQBn2Ndo6Quz211hdWH+61kRV6pTN8Jb1Wjr0yQuQkRDk4S8Tsa
 y6gkScoDmAu0WaLA6/lxe1dKYtywgB4mxbh5oDwYWASvma5bsJpi2pg7LIFco+Ek2tbM
 9yXtNRhGeIVPsCE/WuiqPyCjWlvXxciMaX4f5FzFIUJ+a7qV5oc3h9pK9EppSLVQPtD1
 gQHrJRis95eq0DYSilPMkb3/K0xM3FWU1+Lv5Hl6co6uxDD8E5okWczRwpwzYYDEPbzn
 /21+P6KDY5OAQvFK0N4escrzif6ZMIs1gNXpLw889qpP6YtQXvUT1OdLvuBhv3to4V/I
 7uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
 b=Edi8enclSpb1xHzjUJymAK+AYfoZuhfiZY73HYwVRvANz35IrHZJFPrZMYZnTGtc/Z
 VTrkJYLhO65hErrJtmHP65KYJp7hxOQcCW3WTw7RZgWG38viGxcVtMRbyssfMiXd156A
 dj1M5J1CskyDmwyaFMI5qYBffuexG40RRhBDc/HVk+3EGk4iq6yrlOdCmG+rQiykXDyS
 hm1qm8iumBa4mgCZtd7qPLW6GHrmXB1wcFtTief+T2TrPE6v7y5oeGmh2kWVdazQeGUU
 83GZH7LWxtLaPk4hmoblutLcVo13bajIV2Pw4Xb6Z/Yb4xnYMH1fJxH/xvHPsVN80eu3
 xL4Q==
X-Gm-Message-State: AJIora+KRzVBoV9iJS2cppqzp/D/QP53Y3E4cgjw9SJg4KQcdF8R+dDd
 6zQoc9Gn1WYP/Gi8w6s84VfVJQ==
X-Google-Smtp-Source: AGRyM1u/zuOZEHQSioAp2lToRg2hUW+1+7Vg4tCi+2Nk5KkWA+Awxx0SdA1o6LpLrslnO04WuATicg==
X-Received: by 2002:a05:6512:1111:b0:481:22b1:8db9 with SMTP id
 l17-20020a056512111100b0048122b18db9mr11247160lfg.333.1657539436440; 
 Mon, 11 Jul 2022 04:37:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05651236ca00b00489d7fec4f5sm937284lfs.122.2022.07.11.04.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:37:15 -0700 (PDT)
Message-ID: <677d6387-6225-29c2-3190-8f443222019f@linaro.org>
Date: Mon, 11 Jul 2022 13:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/11] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/07/2022 11:00, Dmitry Baryshkov wrote:

Thank you for your patch. There is something to discuss/improve.

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":

You used some unusual pattern. It's just "[0-9a-f]+" - the device
schema's job is not to validate patterns in unit addresses.

Another question - why do you allow "@0" alone?

> +    type: object
> +    # TODO: add reference once the mdp5 is converted
> +
> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
> +    $ref: dsi-controller-main.yaml#


Best regards,
Krzysztof
