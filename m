Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F69654039
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662B10E11C;
	Thu, 22 Dec 2022 11:54:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8010E121
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:54:55 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id cf42so2415730lfb.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tpAVb3+cVXQa1lG9/26ZmhtnuZCNmgaIflq0pQhJ+MI=;
 b=WMfKHcAIqLmzoW3u9ksF8dcVFMxOlA4FFCTklAZueBNiqdfZJxFULrasW0YNolRL+g
 l9jJDrVgFXPItkMc+8qNlt8q/YPFS5++54Bm0/0OI8of/bwkqlSkmzsmzKt7OsjaNydB
 SaqvlyDt9nOVrNT6g540uS3yNsE3He0u5hog7cxv1Yoq/o8dNjEvdiwyScVUi8v0kVus
 wZjM0eUwGZaLYbXorLZ2538sie1yaa2L0cKFZ16svZSc/0fVVc4sc/dZzbOdEE2EpdT8
 A65vkWXlxfO7u1FaBJpolVnrLNVZPrxCkG95fXXxiOxUU7N4vmu9A3fE+w6WQybg1H1v
 kryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tpAVb3+cVXQa1lG9/26ZmhtnuZCNmgaIflq0pQhJ+MI=;
 b=jwa8jMUrmVBnEWal8lWEssbx5uilOdjSKCfTF1xKZubWcpcPWfObugl8P3zLe79j3F
 CvwYqTzdf9IqLZmm0bl1MKesrYSr14BGuGL6shxGm6BDEQ+G/kCNFPWuqoGBaAk5FBht
 l5vQL3jCjjfPYf0FDoUgjsrdzRXW/XZy/WnWiQ6wDIOIryFY065SbLNmw3USP1wGO52b
 NsnHRJABk/6nl6QASEBIA3GvJQmy9qhz9yGsKcN2VMvv1b1a5fOLV84d42Dta2DZCy+7
 QfQg4Muv1iBXd4Td+RqxwP3wq7pFK4+mfpA7n8+veXk3IgxT2r1wy5jR/yzP7e+PnTB+
 Bmgg==
X-Gm-Message-State: AFqh2kqswWOoyLDFl5qU0KR3/qvjvbCSu7t9bEX3a/6ME7Gx9fiqddpa
 ea3BfwxiP9XR+kPzzmxPzqPI4g==
X-Google-Smtp-Source: AMrXdXtON0Zmt7ZIsbCnFjMaae522gN6PEYbg49HK+urLOAHDo4Cg/TkyZaKta1OtYFRq6DDHDoIaA==
X-Received: by 2002:ac2:5318:0:b0:4b5:7720:5fe4 with SMTP id
 c24-20020ac25318000000b004b577205fe4mr1728513lfh.67.1671710094036; 
 Thu, 22 Dec 2022 03:54:54 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05651236c200b004b55f60c65asm44401lfs.284.2022.12.22.03.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:54:53 -0800 (PST)
Message-ID: <dbf60b16-9331-64ae-93eb-0a67576adf1f@linaro.org>
Date: Thu, 22 Dec 2022 12:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-9-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 08/21] dt-bindings: msm:
 dsi-controller-main: Add vdd* descriptions back in
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. In the .txt description we marked these regulators as required,
> however, that requirement appears to have been in error.
> 
> Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
> come from GPIO controlled external regulators, not the SoC and in this case
> there's no need for vddio to power an I/O bus. Similarly the regulators for
> the LCD are controlled by the panel driver not by the dsi-ctrl driver.
> 
> It would be possible to connect a different type of panel to the DSI bus
> here in which case we may or may not want to make use of vdd, vdda or
> vddio.
> 
> This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
> regulators in the dsi-ctrl block are helpers not dependencies.
> 
> Add the description of vdd, vdda and vddio back in for the existing
> upstream dts where vdd, vdda or vddio are already declared but, don't
> declare those regulators required - they are not SoC requirements.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

You got here ack, didn't you?

Best regards,
Krzysztof

