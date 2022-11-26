Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854286397EF
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 20:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A9F10E173;
	Sat, 26 Nov 2022 19:02:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECFD10E16B
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 19:01:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id d3so8709653ljl.1
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQoHlC2Pdlwgfa2bUPL9C6broHykNZtXKHJwgg+dRIA=;
 b=V9YEua+Zk7h3HYX9vVyUNTFYeQN8e1KuNXcwoXqKcfcM8pb9C/iLWFgYTldTzR0F2x
 8SfBWdusXO2qS/GuV7GAWRBldelUF3idP/EgGzU8wLkG8Jn/lc0RnUhqatxk/koDYFbK
 1cgRC9+97XDhb8ImL0cigCDazc8NkqvikWu/EKtHoDXdSoOuHN6pai24F2Yy+7+8hh53
 JYMy8/cFn4wQQooN18fTmkes6yIl6MTbO20gt9wmw0IJpd9owtrJPJ5CifzSIha8i9un
 MLPtRcWVI//3jKHo60pCWbrDjw92+040AhliWyfQXNHAlFvn+nQdYW+VB6j1puYtTLZF
 fYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQoHlC2Pdlwgfa2bUPL9C6broHykNZtXKHJwgg+dRIA=;
 b=u+9XWEld/9uXnMsgRyUwIvZ8sNph6Mb0m+IQ0OYsDW5NKF5RAgzZaQ1f03XOdr0GNZ
 ikrl4se3me0WvT7mKzrtWBQvQ83XYhjHoHFz6MYbkwFCIMJwPb5FtPl97fQ572SCHFDC
 O76L7dNMP8ylG3Ucr8tHE1OY1chvOY+Z0AgItXCCdwAP7vDR7p5/i2B32RIocSuftp54
 VjnMd+OrHmpKZajADLgJhqEo0N9jkCGFTf+DsrK8VHXlJpv/hGacHcS9Z7cXlvzQsh6m
 3JKjvtxQ9RK650ek7gfE83HOp2iFKTWslUG4IOO8JTXr/waL13mBYqvlz3YyXmx3+mnm
 qaiA==
X-Gm-Message-State: ANoB5pkG38JiOBw7fZdBYMjokwDafbwAGkkosvYQF+LU5oyhdEH89LKw
 PKdh/2THcs/W3nc4pVLJGlFNrQ==
X-Google-Smtp-Source: AA0mqf7Co0RbImgxBoz9uho2nQkc5quGSLc79FmN4jaZHLDR6BOFeLLrsWAnVZNzVyida3S7W9F9jQ==
X-Received: by 2002:a05:651c:1061:b0:26c:532e:3cc with SMTP id
 y1-20020a05651c106100b0026c532e03ccmr13754556ljm.66.1669489314425; 
 Sat, 26 Nov 2022 11:01:54 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a194f52000000b00494643db68fsm1009392lfk.81.2022.11.26.11.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:01:54 -0800 (PST)
Message-ID: <dde4b173-f9d6-3ef5-39ff-24c3eeb6b93a@linaro.org>
Date: Sat, 26 Nov 2022 21:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-16-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-16-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 15/18] arm64: dts: qcom: sdm630: Add
 compat qcom, sdm630-dsi-ctrl
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
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm630 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

