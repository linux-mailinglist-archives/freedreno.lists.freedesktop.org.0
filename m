Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BC6397CF
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 19:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FF410E15C;
	Sat, 26 Nov 2022 18:59:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76C110E15B
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 18:59:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g12so11539068lfh.3
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 10:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCav5Kob/l5LQp5fu9UAEg7SYlJAze6Knt9alnYD50A=;
 b=CsISpwze/NA+ezDBmtIuI8AE4nY8STh+kX9SeoXBsNtUCAWANQpUNRFeozTQp/WFHr
 yrULdLEVKHI94WPlaeo4M3IwRSstEYV8lSaE81o+paTnD8fqxfPvEE6gnVBMdrOkHNUH
 gsp+WMVrm2FACt0d9B1dE/h5NEd1rzTeqoRMD3Q+zORS45ptzVkAyHpwiGD1afzbosph
 ILhw+2zsKlbj+bgMk+vmTPiv5gckVALieiBHx+dCwbElmmm3/uAJXkdkr6/0MHkgi/MY
 rql6kuk4mWYE2HheoBRXEvTpPTUKaw+PIAKUgO+X7/dhVfu/sLNnLARhAEEyULg0z9/Z
 MA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCav5Kob/l5LQp5fu9UAEg7SYlJAze6Knt9alnYD50A=;
 b=YS8IIMwP1DOxfmbKFah+3EhjCuUZcrAWXXwkAutgslQ+cIo2Ny4iUB9nZD8tR3wLGw
 sEke9ZGquJU5+23JEXpvaxK45/5UG7Uvv1blwItGn2SK53wVib6E0S3WajvInR0veNxy
 G0bKfl5uA774wmIOMBjJ4HNGy+s94NqXFUGSmHESmAPevm/+w/O3TFwhRG3tLZZVWFi6
 lwxGMkKzfp2PxD5LR6fzjkp9lLtnOc2JRIzpsbFjAKE8W/ShIs20OSS/NaW7FZl3nAD1
 CULwISE57J51JhN6ejkF91jLkz25ORjoP3cKEzRAYUEnomrrgtpBeF4gY9jOKU4mDuNV
 W68Q==
X-Gm-Message-State: ANoB5pmzHnbPWGsx0Xk4z4pAPk9OBdyB1eO7RfB2Dje0sYPdXq78s+ip
 rvfqCiZa67/8qXach364upBJMg==
X-Google-Smtp-Source: AA0mqf6L8Dp7Yr8aAR8G0BMgMpddYQH/AgN5UUfCJBtzx9TBAFaKSx+2qQmZCkP+yl02tumcsZM/rg==
X-Received: by 2002:a05:6512:3189:b0:4b4:e3bd:6ca0 with SMTP id
 i9-20020a056512318900b004b4e3bd6ca0mr8236569lfe.278.1669489166313; 
 Sat, 26 Nov 2022 10:59:26 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a056512055300b0049fbf5facf4sm992956lfl.75.2022.11.26.10.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:59:25 -0800 (PST)
Message-ID: <7beb001a-6f29-cb3e-780b-3faaf0669b42@linaro.org>
Date: Sat, 26 Nov 2022 20:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-13-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-13-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 12/18] arm64: dts: qcom: msm8996: Add
 compat qcom, msm8996-dsi-ctrl
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
> Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8996 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

