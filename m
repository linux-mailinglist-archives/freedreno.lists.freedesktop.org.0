Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6AF6397CE
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844FC10E15B;
	Sat, 26 Nov 2022 18:59:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DC710E15A
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g12so11538763lfh.3
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9dPNvqf/nW/Gl7aRq2n+ie1oFu43zgJVOTcJXhFlCP4=;
 b=gfd+al0NKAYkhHejNHt4tGjHFPyPvShABp+kCQ8jvDoBkxmXgKqaDieUr7U+ch9jip
 L2GMwi07CTqA/XKFWt1Qwv8ytUFeXFi0I6zXw706W+i4koDxfL6cOiC96BWW8fc5uB3M
 pEGdoLnSDYR1BXmpjYlkneXn9gFnVjrSZD8ypSeZcgTTzhU+oa/yZl2wnQ/eKhrAGFxD
 dnbmzhQsfWwf0f0a1044K32Jtkq+5aFqcxiY4l/BA5W7BETRw5PIW7QCw6K9tlRjXf9c
 KhZ30ntZCS1uTx/t0QVznNDaV9Oq5Zw8wIA6nmhD2egkWZkOQdBipGmxaaptELUGJt83
 WIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9dPNvqf/nW/Gl7aRq2n+ie1oFu43zgJVOTcJXhFlCP4=;
 b=2ywkqRDQ4nslBvZag7ezvUrJxS2dECa9YpoY/BjPhjgi+5CgvtTzP7HeyJaGpNJAPD
 vVGew2mtn9639Rf/bUZklQ/DaFHIiuLij1W/Bobs88zfACawjmTpBMF2Y/WgLf7ln3Vd
 XgGRcNGLgBRRRJ/plKxS6iJTWhxxl84bU13LjNMSbx8TLuSv2B4JYlDAydVb64n63yGt
 QsR3uJ1BfUww7gKyzcZ+ytND2KfXVUCYQPfBQ0kdmrfxDM0NTZqx2Uxkgc1+09UpRpaN
 byPKWTmulicsReMupbUmgAnC3BpnGxPyZoWa83v/aT2JaD2S0fYZt+ahQ3rXMbdtIU+h
 OVxg==
X-Gm-Message-State: ANoB5pnwRrM9sFE+1EDli6fpk2lvlV9rfqmRmUHjB42+U9yNrqiFnZio
 ION2Z6tgKKBd57DJzbFOfBQveA==
X-Google-Smtp-Source: AA0mqf7dtJSa1X6rpHx8sJKrn3MVILRRe3MDDJBNhKwyPFRmZtKaAjIvKABpV4rjdL+t4mvK2Nl6AA==
X-Received: by 2002:a05:6512:2242:b0:4b4:b6b2:aad with SMTP id
 i2-20020a056512224200b004b4b6b20aadmr8607501lfu.543.1669489156645; 
 Sat, 26 Nov 2022 10:59:16 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a0565120e9a00b004b4b0a68f67sm1004708lfb.185.2022.11.26.10.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:59:16 -0800 (PST)
Message-ID: <b3143072-6af0-de26-402c-5cf93918145a@linaro.org>
Date: Sat, 26 Nov 2022 20:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-12-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 11/18] arm64: dts: qcom: msm8916: Add
 compat qcom, msm8916-dsi-ctrl
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
> Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8916 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

