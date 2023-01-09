Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93F662246
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ACC10E11B;
	Mon,  9 Jan 2023 09:59:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE7010E366
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:59:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id l26so5842074wme.5
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Cn4vLeVySoBtqVu3i41sS2U3Dt5cRoRgiGZVokmaYA=;
 b=q4AYeeRaibX7fUgiXkPtELQBLJ0kUN05+wyCDe6L3i2eK7oPhTomiBOt6eT3u5F9Ld
 1fuZ4+l3AgKXVPYUDY/08kPnKo94oALnGFF6UeF+5qiRcAUPjX2IqeQwtadDluJY1VL5
 ndIAwNeUBRRqNTDwD5m/Eu/bQCy0CoRHSR2Qmf+YIrDK6+iqr9iZzOVKJJcZ5xstms5z
 L74fDxuHfftSR/DFNqQG9rj4XQQ0Fe2k2DtwBskfQcgyrRWvInLRUY3MuyJSrQvZgZnD
 fk/5djVGFzQPsHyPlw1/z4KUfVK4Y6BIw9y46Q9YgkxUaVlj4mYPa5FT7dVXHN6gYQ+t
 8F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Cn4vLeVySoBtqVu3i41sS2U3Dt5cRoRgiGZVokmaYA=;
 b=3F6kItUcvLdyIDqd7XY2xaL/QAMPczjnNeRwX30m6kGph3q2AHtoypBWq2DYKK0dOW
 w2ggSKVrCVXOjtuhe8zeqKddZ6b4JiUJr3nHjblYypwI7kRROvxToPBfv6meq5YsuoIs
 QSWZPKt6IbBifUA9whJE1nb6uXs5hOi6f1YyKBpzSEctHEky9LYlSD2MT7lTIS2L864C
 SicAVHUbnm6aXhmpjMQUz2ouA0rWEZ4KU65YLjD/hTbeugMmPNYauDHeNV//kqEk4Xzo
 AwyF94qjA8wBd77iL+EigKb2xI4qGuXC/SNG5y1oSc0Ngubd9ase40oROPiPGA97dF/p
 L52g==
X-Gm-Message-State: AFqh2krTUKBBm+Kak//YDXElGwCOQO4eJmS1LtF/21ykpeZakPVAWlC2
 sCqvDqEIp/65REoc/5bbyKAgGA==
X-Google-Smtp-Source: AMrXdXumq0LLDXjebDPOt/mbrfyEvhtsOKdsYIqeFv1T90LrZOYUbvJ/vcGt8U4kT2anrYBvrbe3cw==
X-Received: by 2002:a05:600c:1d89:b0:3d3:58cb:f6a6 with SMTP id
 p9-20020a05600c1d8900b003d358cbf6a6mr45676516wms.41.1673258375373; 
 Mon, 09 Jan 2023 01:59:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm17318996wmb.42.2023.01.09.01.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:59:34 -0800 (PST)
Message-ID: <1c2312e6-73cc-af77-3ce5-75de2bc70213@linaro.org>
Date: Mon, 9 Jan 2023 10:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: gpu: add rbcpr
 clock
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

On 09/01/2023 06:44, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

