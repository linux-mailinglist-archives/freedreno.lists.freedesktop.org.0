Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73206359B7
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 11:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897EC10E212;
	Wed, 23 Nov 2022 10:24:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C90D10E212
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 10:24:55 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l8so20832917ljh.13
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 02:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
 b=tccV9u0DPOr7WGHaeW7SHV7zoLGrY+IccG2qq+rPFQuqHwLHQPSTKvIQal19aGStQS
 qFuS0TCuUZbKwURtutPUto8/iBsAVhSPMbolATkWfeAE288vQ2/1PjzJzIpouG09dAE5
 egZt69Z7OqqkLA8/BKMIE8YoGoKKb0nAMP5ppVPvVZPtjH3ZoaY/RTgcs3/hg2D+GxkY
 w0Q1PD3Tgaam+isXAgN7hIbbMUV3kDAIQFYtp97WK4jvOvzE8XgtTHHN5YMIf11YkmAS
 nNQ04rpP0i3riYxq7Vqe32Qr4Q6JQClc+92LYISNzEw4ng6mgRNUAhdDXDzMcV5xBi0s
 Rn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2cZ2aGvz+KFwNkBLj5Eji6CLqnLqwcqLWGZReHxQoo=;
 b=ggIizst5Q3dXT+7ppg0t2+rar+i95JfvHlLm6kIjvNdzWMS/0n1JwPbSjl9tUjwWJY
 56J/+dSIv2dF7dZc6f04MIsiAKXlB4UaQ8qi36JVe7o0DhPxSV0lnlQCPGYtTrJ4CGr/
 yhsm66muXi9tpSqre15uBWHN2jsU20dHTFP0no4j3qkoOwBkHqa2kZvo236CRo/hzLG2
 GGgy/IkiswAik7HNArXuckIYuWBmA6QSBTK8u40E97Xl89hiit3rHMFT7+6pGjoq51MO
 vNRWsHZ6csiTEAGHPqT6vle8u9LiGl7HE6Z/YHkcu+HCboNR1RKNIsAs/lJ6oi4TdSHs
 FhsQ==
X-Gm-Message-State: ANoB5pk3R92R6kX6sE1KwZhjSpRiVD84T35zsrrrTi7mN8qWP8hJ1+Xg
 yOGWBmticYiHptfj92J3x7g2hg==
X-Google-Smtp-Source: AA0mqf56iGGSkxj6TllkNQuinXzUirCmomHmNOpMWrybBSVRIH2xAEjCe0t5105VGr4MUVvDU2OuHg==
X-Received: by 2002:a2e:6d02:0:b0:279:4a4a:ca9d with SMTP id
 i2-20020a2e6d02000000b002794a4aca9dmr4481353ljc.27.1669199093716; 
 Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u26-20020ac248ba000000b004abc977ad7fsm2843143lfg.294.2022.11.23.02.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:24:53 -0800 (PST)
Message-ID: <d7629871-1c29-e23d-1741-33714f187bbd@linaro.org>
Date: Wed, 23 Nov 2022 11:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 04/11] dt-bindings: display/msm: add
 sm8350 and sm8450 DSI PHYs
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

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Didn't you have here tag? What changed?

Best regards,
Krzysztof

