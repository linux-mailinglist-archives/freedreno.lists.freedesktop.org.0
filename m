Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE06397D3
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BD910E157;
	Sat, 26 Nov 2022 18:59:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065AC10E15D
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so11467575lfb.13
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4unz5t3gFEiTYQ7NYXjhA6tlB8Sr5HCYzbutoHZOXOY=;
 b=lOtk7HxsXregxGLPYCxJhdYbYSsl76vy/h3mvySmyR10sXxfRqTyvZGNO+4XhYdPNm
 kFQB7agrS7ynQjMhUYJhwMDYE9nc8172dYg4J4W9+aY4tcTUmlHn6R/PQfss0iE6LJrP
 pKAshJjf9fQQJTZZCIYQLYIirB8m4xX7OyZdMIEpnKmObqD6xL2k+5ffs2wnT7hNv5w/
 ILDHqscuDkh1T/k31AjroyQGCGvIfVyT+IeTKliq9B1Vx+IdZuBzdrABooOGkWr3HFNP
 w2lz65d7zmvvw4z51dSJ57QPNzwB6IxAcS5dkU464FVvz+l2AOYTtldKcePFUW9OcNKb
 A6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4unz5t3gFEiTYQ7NYXjhA6tlB8Sr5HCYzbutoHZOXOY=;
 b=xgPLTCXvYzFrilV/qMunpKQqxjr4AtJ62rn9Em+qiE/ZUwWx1SfG4Bwl2oHLIbNcJ6
 kAstn5a6XjCaK7b5c2TAkQSC04NDJRnCCRi4Tuiw8MakvSN6tYelj6KQ1J1YAnxcNqg4
 wxYnTsAAspVUL7kNt+Ytbg3y7nB6VgvF8J8pr+Swf2ihNl9oFdJc/ftjoYu3j/1FhaZP
 QR5z93NkuheHOEb2iksYrSOCq6tKsJYkt0+dIjja2Bwr/fUgIEkHkrDo8dNJr7PDEEj+
 krDdYGO1mCg4UKurQD2p2glI0WOu81Vc+Qk4TEl4v81V2uNZxFrGk62IWNJEsjFck3VT
 YCTw==
X-Gm-Message-State: ANoB5plzLjcz1zXYWLBXSTyWXbSZ46ruoxTTK8sVTUuCgsjDmhkPRfWk
 huNvsQUWY93kpNWIm0BsqAExOg==
X-Google-Smtp-Source: AA0mqf5OI15tFk3tpa2qcjVZGFH8huDIBRu/hPguMd2iYWjq56/IlMQCnCpOeeKuEsRL1TzmdnPBFw==
X-Received: by 2002:a05:6512:252c:b0:4b1:7c15:e8ca with SMTP id
 be44-20020a056512252c00b004b17c15e8camr10596357lfb.601.1669489174414; 
 Sat, 26 Nov 2022 10:59:34 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a05651203bc00b0048a757d1303sm1013866lfp.217.2022.11.26.10.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:59:34 -0800 (PST)
Message-ID: <d64c6107-594c-a8ac-5362-76539301cc75@linaro.org>
Date: Sat, 26 Nov 2022 20:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-14-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-14-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 13/18] arm64: dts: qcom: sc7180: Add
 compat qcom, sc7180-dsi-ctrl
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
> Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sc7180 against the yaml documentation.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

