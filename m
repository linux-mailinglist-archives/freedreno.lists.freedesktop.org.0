Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD9167C9AC
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 12:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569DF10E075;
	Thu, 26 Jan 2023 11:20:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850B10E133
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:20:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3061669wmb.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 03:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1imp2ZTUXsEKy4CR62FOeVw43151JqoY56paLPOoOP0=;
 b=P/73LZDE96musvCuEyN3wTnzDpff26ZT/Xmmo9GR8wJWUBlEeE/7QR4P6EgpvxGaLz
 OyYpjz5fQeHMvN9xE+13H0XuitfMBg4BZtF0Rp/cBTEAitDwSjytcaD5Pw2/D2UAnSTT
 Cx9O+rQIbVvL+zxfPGQ6aX16hjcgJAzceizaOUZ/KNCYiUY65p19O2XtzehjlHxWRuYP
 p9vHhUPt+UrL0u542da95K6Mf4F27H1DO2aAvvHQ9NIUjGhw8yVoc1fFHCO/xvcIB4c3
 nwWjmEnCCyRahcBcXdW3dmy74rj63khpUzQm2WVrDlqTTfMwEelLFNTU6IkY4tvzFSQK
 nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1imp2ZTUXsEKy4CR62FOeVw43151JqoY56paLPOoOP0=;
 b=gYxsUTM9JZyb/RmPTfJ5BRf+uiGU4OFNbATGYPS8wPGwY6TMRQ4HwunCP7gY2TNTCu
 ch/E1Y06Vo2PqUU1KXvTO03BixUnkjCrMr5IXrT9c5mRpZK5x0mcQPaLUbCAZ2AgHhJB
 Kechij6kCLH2pqfJa8eXBd2SixHUxGOrqvxHwg6utsapWuVXqiGU2pcXPOH8MKjDCC6N
 m3CMLK86P6By+jrjy8LYNgRBpn2g+q025YjGvod1n+XW4LxXfMSiQlskz7vKmG9RzNSK
 V53UoGxHA7RUqcKxw+Sl6ys7TPKFrl1o5S63Etn0vbUshIneAbAjEycEU9IznP/kaT6y
 9QmA==
X-Gm-Message-State: AFqh2kpVDQnY5UUG3CSWuk2WXbqlHIk9SygtUBlvtGpSwSDPhGfyy/7t
 ayv1FidkkwUwamfSfqJhOdamrw==
X-Google-Smtp-Source: AMrXdXtZDKxPIm1iALZGFw6++8J7Y/TcWVphWfZJF3I6ajIGvljUzFqkk5XvvW0GpPmDj2bQd6A9Fw==
X-Received: by 2002:a05:600c:4e05:b0:3c6:e61e:ae71 with SMTP id
 b5-20020a05600c4e0500b003c6e61eae71mr37033876wmq.1.1674732041590; 
 Thu, 26 Jan 2023 03:20:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b003dafbd859a6sm4414673wmb.43.2023.01.26.03.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:20:41 -0800 (PST)
Message-ID: <81ff0fde-4783-ead4-4bca-f53b6fb0261d@linaro.org>
Date: Thu, 26 Jan 2023 12:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119132219.2479775-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/6] dt-bindings: phy: qcom,
 hdmi-phy-other: use pxo clock
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

On 19/01/2023 14:22, Dmitry Baryshkov wrote:
> Add pxo clock to the 8960 bindings (used by the HDMI PLL)
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

