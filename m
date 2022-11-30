Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4B63D8D1
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 16:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B1610E479;
	Wed, 30 Nov 2022 15:08:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596D10E47F
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 15:07:58 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so27350694lfb.13
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
 b=RPnc/lltAqPuUJR2we1iwIcV3yGPf/+Rq00frStCStqEAEPC2KiqlNAK0E+USCVdMR
 AdX5iqF2ljKhuWEZ3zFTsU3qwhArQrMRIVVZR2mnLpuoUo7/8kUNqx6FSinAXd+qvcY+
 USy9Q3fxaysmVgNgtEU8UoYrPgfzphMi3vPzxDen/c8xafkFwI9ryL/3sq3dKJQBu1kx
 pdv9nv2tu9K0vNgFA4FoEbrP5hKNXR01xhyECNeR+HC+Mlf03gW3dInsD1j2IsdbERKi
 ajd9/SXttFzRZIQtoBlPOktOaqH92jE96L+8OfcYpe5NN6kFsxKAtdMZJe8yVVLA+TDU
 6UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
 b=FVLhszorGX7h80NTn2ZZUX6obZkZswbf3rI7kk+kIhS5/o39k8NgJfk3eh4bfG8mOh
 fIAovo40D8QFGOD/Ire69b5vPINs3hxsVjeJT90NZp4SgSCHTFZgUqkAVsPpHDvfUPGX
 CitNRuxUg7J/xjtbKg8l6sVCdC93RYc4zAdYINX+zjYdoaCx0XkxkOMjm/04CPoBVhAT
 MRItb+WVehGxiHpKbEMDAwSYfiOjw4c1Hzn7pzZlMcme7otVCRhV8mGD5LjYhuRihb5k
 vCAm4+NwT+/8p5ucm3N2t8EO5KrT5s+YVEItbGY7wvbb39/MZ3VvGhx0A381iyBIQ1EH
 ldrw==
X-Gm-Message-State: ANoB5plkYmIIje4WPrxAIJy6owDTDzo6TT+6qFVPNRV5VHQcLJScV8BR
 9ZXLN9ShcvFU/uCYDIGrsLkZEg==
X-Google-Smtp-Source: AA0mqf734sY6ZDYeK/G5AR3EnvJhvF9S6ueO3jz/KPo7tyikas7hMGIGuMUsj5L17EBc21tQpzfyNQ==
X-Received: by 2002:a19:6717:0:b0:4b4:e13f:6a17 with SMTP id
 b23-20020a196717000000b004b4e13f6a17mr15560450lfc.372.1669820876997; 
 Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a2e9150000000b00277045dcb5bsm155073ljg.97.2022.11.30.07.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Message-ID: <502a28b2-e77d-37aa-4f14-10917fca18b2@linaro.org>
Date: Wed, 30 Nov 2022 16:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 01/12] dt-bindings: display: msm: Replace
 mdss with display-subsystem
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name.

That's really not explaining what you are doing here. Your commit msg
and subject suggest you rename mdss. But you don't. You touch only examples.

> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Best regards,
Krzysztof

