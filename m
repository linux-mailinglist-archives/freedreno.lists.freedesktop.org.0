Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552B6D0288
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE91C10E232;
	Thu, 30 Mar 2023 11:06:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BC010EDAA
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 11:06:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j11so23973166lfg.13
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680174413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9kFJmqVtwWUVcG0Lm77E8KR/5HB12mJDwmxwNxlca4Y=;
 b=QFJNu3+0CjAQw1iofhkT/VGzYC5JtBTXOv1piZxLxkvwohLbO7ffQXvlBJV5/myadj
 Fhzaxxn3qOPC09GRSp/56AvLmXbNSJxYvmqd8x874qBZE+RhW948/qPsY6V1UKLse056
 1fcu/APUG+3/1TQ6lpSn39vbhMmNrO5lNP/0RYadmKlP0YXisDmlNdntxOcNGTqZQkr3
 W5fjBxZGI5nAAofkKIveAelKKFj8y3KSRwBn0SiCZSVm6l5dG0F98DQVzb1WwSFMtsS/
 fEeB6wyVMjIt6750T/pp7bdMilL/U/Wayoa7tKx12h3goMPRiTcLnvPmJSfpIWxxrejC
 RaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kFJmqVtwWUVcG0Lm77E8KR/5HB12mJDwmxwNxlca4Y=;
 b=u2z6t5CBGLPzyRCWbdTY1NywV5Nnaids7yxDnk5Lk+bfjbdv1wAT+XOSJJe5/O+jNO
 U6cU6hBvN7QoCruJ411UXNOv288Jp6RlORHhSFDy8Q4J5wC1JaEhpPPpbmSO7uOz/Fm5
 m/Vuuamx3nmk1800IYZWxpktW3XUfaz1EkqXL1Ex21xRBTiG4ZQXZ6Oom7/VuqowFNaD
 a34FuQnxCPG7pwjWpEgPmGjzK6APkAEDMqvr4FcWbxnbs2VES8pKidvhCjJ+3DaY3Evw
 YMwbscUI6PhMKP3lAGqzRjHqz2LtldcaExrCInAWcLk7aWSk17AC85bPruA9O+zzAx1m
 QGgw==
X-Gm-Message-State: AAQBX9fKsAm5LTOm+QvP7QFV+L6A4iBY+FTwtBea6uDtZ7JfuuHiFaJR
 6Hn0iQ9soa/ZxFfrnGSq3XxmUw==
X-Google-Smtp-Source: AKy350ZOwZSifMJ0COgNwwfI8Ff4NZPvJrvXq9pF7O3gWwfbrZxZjTu20qbb3ttl1T+NHD9CSza3rw==
X-Received: by 2002:ac2:5a4c:0:b0:4d5:a689:7580 with SMTP id
 r12-20020ac25a4c000000b004d5a6897580mr6377686lfn.47.1680174413683; 
 Thu, 30 Mar 2023 04:06:53 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a19ad07000000b004e8451948desm5835252lfc.227.2023.03.30.04.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:06:53 -0700 (PDT)
Message-ID: <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
Date: Thu, 30 Mar 2023 13:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 0/3] drm/msm/a5xx: scale MX following
 the frequency changes
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



On 30.03.2023 00:24, Dmitry Baryshkov wrote:
> Konrad brought up the topic of scaling the MX domain according to the
> OPP changes. Here is my RFC for this functionality. I post it as an RFC
> for two reasons:
> 
> 1) I'm not sure that we should scale MX if we are not scaling main
> voltage following the CPR3
It should be ok, however..
> 
[...]

> Dmitry Baryshkov (3):
>   dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>   drm/msm/a5xx: scale MX domain following the frequncy changes
This is a stopgap solution, CPR is a child of MX.

Konrad
>   arm64: dts: qcom: specify power domains for the GPU
> 
>  .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>  4 files changed, 76 insertions(+), 2 deletions(-)
> 
