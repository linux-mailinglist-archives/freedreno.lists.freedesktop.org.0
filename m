Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1446621F1
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD75B10E398;
	Mon,  9 Jan 2023 09:45:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706310E398
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:45:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8532435wms.5
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
 b=U/h+91bn+r91+v1YTW1nvU4AvAAw8s6Tk2cgo4doYUseV/Bpu0rMpft+Vd9LPM0gxz
 5ohKV0lwD8VU3mmrlDRbttFGt47lR55lUefIlsgAxmIy/NigXmj1CIvn9C1LKYlMlW/C
 TYv3fERgIl3xTwlbQ7vsBaUo0CJGtENI9dO5SDFVQL1+zWVxSpz7ffyOEiC0kmfEgjKL
 pSr4f23TMg0SyxkZ+ZxkISWFKNv/HC4Hf7dPQi0gi2DM6an9hE9XLyCHsrAnx+EhoAmv
 25MNiWxPhnLAKDCH+7hgOqOnoToUXta71Ewav8+oV+s8pzy10kQ7KO9Xq9tzlz08xuak
 0KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
 b=WzCqcGlOvLd0+Au5eoa9aa+oA2ADy4RGdoy/ZjygvciOO5pwiSmCCAjhlDOMUd68UK
 7LMsp2vvrSkSKH6uBVL9LbVXhT5Sx37TEPveBgPHsR31E3HW59uCE+YB+LSez3AaBA2z
 y9ImOM4HLmbmI5PBLCB3w49+QEkt1YhND2t0IV06PJCpn8EEOliGrlsIcn26kmPkdjM3
 Rp0eXyQPKCjQR/ae70MtmWGCiASjshDkgVJz84ZfIqlK3cS33eYxqbVgFWKB5K3h5vk1
 Mi8VQmpVb1NqNRaEab84XBZbIRiUV/+5A6lgryvB4Ksd8rnYrJSay5GD2pHVEVxOayEw
 mkvQ==
X-Gm-Message-State: AFqh2ko5KV4wRwbRLxQG4Tr02dZczCG8Zs6PU9osNyUMP7VPd2d23YuD
 r1nzDI/t3f1J/S43hT+Qasay/w==
X-Google-Smtp-Source: AMrXdXsNwwIJlURsNnzcw8mgN/L8ukGjkVQPEV1pXW7YTj9pGd9SrJeJnJMo3fMmM8r37up3DG8GMg==
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id
 a7-20020a05600c068700b003cfe7c80494mr45806546wmn.29.1673257512932; 
 Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b003c21ba7d7d6sm11313513wmn.44.2023.01.09.01.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Message-ID: <e706b0b9-6b2f-7b0d-fdd1-e66bd3d6c736@linaro.org>
Date: Mon, 9 Jan 2023 10:45:10 +0100
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
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/7] dt-bindings: display/msm: document
 the SM8550 DSI PHY
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
> Document the SM8550 DSI PHY which is very close from the 7nm
> and 5nm DSI PHYs found in earlier platforms.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

