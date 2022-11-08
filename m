Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616B621E3C
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 22:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4D810E03C;
	Tue,  8 Nov 2022 21:10:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6F10E521
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 21:10:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s24so22947970ljs.11
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 13:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAafqOZBdpxx83ZFYFN1Hi8JWgUTuB0MF2wqgfb+j0=;
 b=BmbRlhuIxfQgv60+/uxmJD2mUTMS1D0a5vXHhZdSI+B0M5n7f+PY+aY+i3bYejK+47
 QAdInA8SRHniQJjhhghXtj43Y63XNmSMkmmTfTfgYedB6o8JaZTnyatSRXboWFXzzkD8
 g2QTiyGD9OFXonYu/wW1c7sVz7Lz7oaxfiWFJNRGfSlCfaPJrTkpgUNBuc9HeD98Ah24
 YpHZNx0F0/+cfv0RdCs+sd/hp7I/iGeLbyq/AyZr/jaiGdiBxohdkNnS+fx/fy2Hpfyr
 3WxJzj5MdugdN3Sot7qFgjiKrVQpDMLOmwPQXKT4N6+Tmja50fD0vqu1PTZ0NNp4I0Lt
 djPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAafqOZBdpxx83ZFYFN1Hi8JWgUTuB0MF2wqgfb+j0=;
 b=FfBMSdzx5/GkQ2JDaRMSt7bDP7inO8futGHA+An3Hu+0ksAVmNs5Zp5ZUKoCym3ktV
 YYk9Re4lcv56msAKo4KmzGqpuBVj76bVuZdi5bdDwOQuLUp/+ehXQqqfjP5Fum3CEzCs
 OWFLi3ZIwlW5+6gYCzEluqN/18316hYw74HhSRsJsf5xdlB0rZEtFWD5Wd1fOHaGtR9B
 a1vSiRXaPDKw/9zspH5MguvHF1Vnle6myORNLronqbVcEDgmhl3nUBKAdWp3PbE8t+uJ
 1uGkYkgEjA/ELJ/Og8h24L88InOvJF0kvB04wrYNavA9uU5cTNCLksRSElWz0jgci4zD
 gQDA==
X-Gm-Message-State: ACrzQf3mo3O2fYo9LzTRVRXHcyzdCJ2dCE3kb3CCJU+0TRQHTixKiu+8
 uHoBwUGjDO7YXMVKLIta7x1olQ==
X-Google-Smtp-Source: AMsMyM4fusBtXtXt1yqqm9JfpkjsgoZrmDOHZ38/STvFvd3nHz0ohLlYZyuEMRbdkEJIFvFcju188w==
X-Received: by 2002:a05:651c:1207:b0:277:276a:9d7b with SMTP id
 i7-20020a05651c120700b00277276a9d7bmr19141181lja.129.1667941831467; 
 Tue, 08 Nov 2022 13:10:31 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056512210d00b0049c29292250sm1932529lfr.149.2022.11.08.13.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:10:30 -0800 (PST)
Message-ID: <b482360f-16d2-6a7d-2cbe-72f2a1c6f50f@linaro.org>
Date: Tue, 8 Nov 2022 22:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-3-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 02/18] dt-bindings: msm:
 dsi-controller-main: Fix power-domain constraint
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
> has a similar dependency for example the aqp8064.
> 
> Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
> power-collapse the MDP without collapsing DSI.
> 
> For example the qcom vendor kernel commit for apq8084, msm8226, msm8916, msm8974
> 
> https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694
> 
> "ARM: dts: msm: add mdss gdsc supply to dsi controller device
> 
>  It is possible for the DSI controller to be active when MDP is
>  power collapsed. DSI controller needs to have it's own vote for
>  mdss gdsc to ensure that gdsc remains on in such cases."
> 
> This however doesn't appear to be the case for the apq8064 so we shouldn't
> be marking power-domain as required in yaml checks.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Your Cc list is huge and not necessary to store in git log. For example
I am appearing there twice. Please keep it under '---'.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

