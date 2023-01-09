Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E26621FA
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7B310E39F;
	Mon,  9 Jan 2023 09:47:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8B10E3A1
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:47:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6161014wmq.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
 b=ey8mA2Qpdik4m8Fl6j+lkcKYW2b48xTqXYdkAwGAM559ANUSIAbk+CVADLNpZIutzj
 fRPdSiW0RKPwMnzzxPZxhPZwyfL+9FMEMqlzlJePYi40/HtT4ovai/k6zWPZ7AwQuo3u
 zZrkhB1o5mJy/IpuRHWNlJ59pLvExgxPMy9bmqAPQC8bv3vqjd/y0f2UiZs1w7idKbHk
 V2pRmgwv7FzK2Ep0dfdvi7s/If0kI4L8/+WouRcLZO1Nfk4On4fhycVqnpEkbVbL4qWX
 V40rSXpgfkKGIqccZwqzs5iK03pz1ROfihyrqE4rSWX1f6eTHRvlK+zV9ORg+mnixl2t
 UTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
 b=CNMUQPfKkBORdVsb53nBTUyMNCzv4bxJlcVXQpLfwd/26x7K2HwMb/E6NQZf2JxWB3
 wkI0DK0igdcYdNmyxiVrOAJwacOl7s2oxmSISuh9dhJPEdFg5DKPs02wIDpCtCKuEZWE
 YbxphoEuPOZwHtiHo0Ga1JJlZk5u9UzgQ0RYZ7H2Ezrqg/hGEEJ5oFq2WwAUj6NJsmke
 CBsWIuOR2i+XNx8YPaWdWB36RcbNPxW/DyEj/KuIVcOSMc8p9P+cKwhmSj5yz99l2TeG
 +DADOYbYIgdkqV73Z0q4PZUwNS6TTDIFLMaujCUVtWKcxRtDaKeyRWwvmg+h1L99dkQq
 5V/g==
X-Gm-Message-State: AFqh2kq1ng9iOXUgArLlGvu/NERRUo6y00hIY80Db5MME4SM9+0fKrRM
 Yg9FOrZMjyuPW2iekjDDCgF4zg==
X-Google-Smtp-Source: AMrXdXuW5epZtV+HpY5xI25+04xlHHlJnY6+V4z4ksJEU4Swz5Wc6Gy1UxaqAFE3mLDJ3ppkOtIoOg==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr44159365wmj.8.1673257628549; 
 Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm16749798wmq.20.2023.01.09.01.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Message-ID: <c2363f3a-1eb1-5e12-1616-b201dc05bdf3@linaro.org>
Date: Mon, 9 Jan 2023 10:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/7] dt-bindings: display/msm: document
 MDSS on SM8550
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

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the MDSS hardware found on the Qualcomm SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>  1 file changed, 331 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

