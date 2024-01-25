Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EC83CE8D
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 22:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2F810E665;
	Thu, 25 Jan 2024 21:26:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4461410E665
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 21:26:24 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-510221ab3ebso779614e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217923; x=1706822723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=elhkM67Cs41lqcgNbIlfKX6XP6h0qgN3PQBjLF+ju3A=;
 b=o44wVHwkLJaU6u/NF3tYbziUdWp06oMNGwyeNJq7M4Qx7DeO101Qbnd9zD1emSwXz8
 b69WjaqplpBstd8LRk203LcPfcHINJjkDQnKXKD8Pue2rpbRxpgxVJRJuyp+/z9z/I+H
 gt42bps9C6qYrXtDprHRm2gyJwxDrqJbQU8u7t0I3/+S3d4FZBNEvHBjwg++VuSLqEfk
 AnjI0wwV0nBFKmEjr6b5cEH+3VIlAPanZHPUq6oS4rFIMsRKUcSSlAWuBay5o0u3WS3x
 fkmYRzWMjxSNwENWs5h/lWvA+8IrpnKPhuZBTIoA4LpzOB1YW1BgH8r/sDK4bCgKRAuV
 tqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217923; x=1706822723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=elhkM67Cs41lqcgNbIlfKX6XP6h0qgN3PQBjLF+ju3A=;
 b=LPluWnhe2zOG7H1l+MVKijsWok0WFeyjQCPFK8Z5mM/xGUqXDkCIZbZUoXOLXXmpNn
 dWY3LjF0XR7SB/t/Sk2DcJX5p01f34nxlfpzdf4cBYbg3NdMgXRF+rRLKeGuMywNWKYk
 ifSDFqu/ivosc7RIdovp0snHiAqCVwjVLy33kmBx9N0GwSnMM/bEkb2szWbJ7Y2GK5+0
 58Oq7dwAlfsle0tkESN3Q/MQdVNEFqhQRgeHUkdfv/wsdjalJw13pDfcZB+PlULNelaC
 kXJ6B/p8MPYHg//vUZok30JTOZ881lqRAOeqLW4bjY+RRfESa6xE74ZG/4kp4nGo1aCd
 NM7g==
X-Gm-Message-State: AOJu0Yw5GuN/iqcW1XAlOKr7wbr7tQ1iVFIZCYBEmeIW4u+T0ukc6ZZN
 1vcDtbSIPC2St2l8W31KDji/+i2mr4pBRoR5yVVrvL7wd/85bN/dORXczu6fxEc=
X-Google-Smtp-Source: AGHT+IEOuxkztSIJnYC1jb08/V2RQZbS0ao9mVzPOrthmoCIzMInt3pHZk0TJDqBccE0bfSeSmnxJw==
X-Received: by 2002:ac2:4342:0:b0:510:13a6:8af4 with SMTP id
 o2-20020ac24342000000b0051013a68af4mr219125lfl.122.1706217922701; 
 Thu, 25 Jan 2024 13:25:22 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a196916000000b005102196b586sm131568lfc.152.2024.01.25.13.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:25:22 -0800 (PST)
Message-ID: <9061c7ab-8166-4d8e-b706-9f79474aa97f@linaro.org>
Date: Thu, 25 Jan 2024 23:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] drm/msm/dpu: move widebus logic to its own API
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-7-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-7-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Widebus enablement is decided by the interfaces based on their specific
> checks and that already happens with DSI/DP specific helpers. Let's
> invoke these helpers from dpu_encoder_is_widebus_enabled() to make it
> cleaner overall.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 ++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +++
>   2 files changed, 20 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

