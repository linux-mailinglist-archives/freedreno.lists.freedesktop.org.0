Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2646397C1
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9DC10E157;
	Sat, 26 Nov 2022 18:59:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E8910E158
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b3so11537158lfv.2
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9Q+kwBqp4GZ8Niq6ZmZJP3/Rtvnjh5Frv97VKLaAyc=;
 b=k76ic81CY+jrZWPp62GjFg0/QRT7OpK2gmyR7jSWBNezRFH4DIbl7aOHdQh+YFW/Dh
 NMdMDtGERw4xQRyjJ7JG1JDl589L2wRIhN5tZzgIIL4mURXshTnbVriFngSJuCO17oEQ
 TdABo4c7eazDYnM/WUpqNq4vISNKqmZOnDJFiLgqr7D9BORYaOFzN8MPOTp5c3btzHXt
 gM7T0YERknAU2IKgAR33QjQi5chTSIa+K2qCPV1w+0wdkRu4cFPwc9b6zwDhwvnsG3Pb
 x76w4d3adMT6LI+fgpGiI88e4sg+lizoeZAZdgIQyr0oaD55K80MrLyUiDRcm4JLPHwB
 U66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9Q+kwBqp4GZ8Niq6ZmZJP3/Rtvnjh5Frv97VKLaAyc=;
 b=lyKQuJYwROSFv6oOqzqZ3T1wPI2t4RGeusS3LH9lSQukmEGHJaqhnUNx+PY+dyBa0q
 v0jNSjFl20V6WDmo+fTz9VfHJbRNA325mf/sd83dLW5VgC1glXtErnTDvwim0jBpJXA0
 UISwhiWTCpptAKHfizXLmaO/4vpavNLr5GKzWmHF+I7OxcIGx1TPokf9hhfPSbHwx46r
 hlODymocHkrFKGTXdnszak1jxqXTL18tGSwdGferzpVISMjgiWQrLLZ/LuU7Xb8v8NH2
 yT/iMw3/9sOzvZj8rdPETq6K+/8tNIYt07pTW1IOj/8dsvvI4q55H+s8N+GZef8mlebG
 OwTA==
X-Gm-Message-State: ANoB5pn0KkoPLGCX0Xv1tf31GCnwXTGiHoQzG72bcurHj+ZUz8zjBnun
 DRjYQx5uCh2+CwcNqvjs9D7WOA==
X-Google-Smtp-Source: AA0mqf622WS2PkHc043xXDBsWu67ZPigh/VrOYc0OcnPiMjNtPDXe+L0yFYhIBF59jyvH1E6GsSycQ==
X-Received: by 2002:a05:6512:68b:b0:4a8:d2b7:ed5c with SMTP id
 t11-20020a056512068b00b004a8d2b7ed5cmr17062933lfe.434.1669489139033; 
 Sat, 26 Nov 2022 10:58:59 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a056512208a00b00496d3e6b131sm998836lfr.234.2022.11.26.10.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:58:58 -0800 (PST)
Message-ID: <74ab6cf6-6edb-9ce4-7226-eca922338215@linaro.org>
Date: Sat, 26 Nov 2022 20:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-10-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-10-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 09/18] ARM: dts: qcom: apq8064: add
 compat qcom, apq8064-dsi-ctrl
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
> Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for apq8064 against the yaml documentation.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

