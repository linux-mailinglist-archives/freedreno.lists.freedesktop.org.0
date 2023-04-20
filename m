Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48756E866B
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903BD10E343;
	Thu, 20 Apr 2023 00:27:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E810E43C
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:27:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bz21so880974ljb.11
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950441; x=1684542441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJiK/C1Bp7VUIfdmCaPfsFY4/Z95o9zQhrrUL3cgcwM=;
 b=FuDE91Glj+OEtbz8Ziz6K/mV9+nm9O9GJONoNRwe8JWNyjcaUX7irgXJ+eEQuE+hbQ
 VvhjthMBolr5E7n7U4pQZCyYPZT9kZpWH8At/9Gs8bDyQPbj3SUfKA3xBHjJp92CChex
 IzwkqYU3kxHV4c+ka1pQxC0mPnBmPkI2+ER012BebZUedO6XLgnemQHjUY2bBoEKtyfI
 vhhVh+IvZ+pRD1Spb/+iWDkJTm9Rstdg6vUUgOu1yiPkT+zNckMXLHr2TFIvwdGT2Ma5
 Ns7uj9NW4T2Vn/wxeuz8CQG2+QxPPD7sGw8MpSN9FzxXBJdHmm4kTc+Iioj52QclVTFH
 Ph5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950441; x=1684542441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJiK/C1Bp7VUIfdmCaPfsFY4/Z95o9zQhrrUL3cgcwM=;
 b=QIkqtbcZuSsmIGsUQ9BacQoSBQIHHt+MvZXm51eh7IqXtuozmyYCHuQ21adlFX0Dla
 tKc7pi+zJIJnCokwIX7zen9J6GN1JvKhWKXUbgkP5Gb8Yt1nzemZ0gmFU9oL02fEqS+D
 EziWsdJq7/rAhkNT0vax8Np+BT/6wis6b1v4ELH99U3B5E8pBMItiEfx6DEPjYLCxfVU
 RmKPfmFNve1G0QE6Ddq9Wfj76oENY6siH8CMC3jB7eOFCJ4YQyKsJ8MGI98HNwTZ7mp6
 56eNprDuQhOLCTJpuCui+gaOrdJEgcJvaD3Xf5aeM//+IbX3NVlJgmFigQdqWqiZxk77
 NWhA==
X-Gm-Message-State: AAQBX9dahMbCGwRW3Zdi9oAKk9Ovlv8M+JDsiXNG+LAdM41TTuTU0JPK
 RlKW2Tvupt7koj5xwdT9upgjzQ==
X-Google-Smtp-Source: AKy350Z5iHH9rCjCwK6eiqlfzdtPwfCU6JEJtPtp6nI1ZchktQR8QqKq0BXI06ZgSNaOMbsiOJAJ9w==
X-Received: by 2002:a2e:9652:0:b0:2a8:b129:f735 with SMTP id
 z18-20020a2e9652000000b002a8b129f735mr2281704ljh.28.1681950441623; 
 Wed, 19 Apr 2023 17:27:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a2e9851000000b002a8c2a4fe99sm10765ljj.28.2023.04.19.17.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:27:21 -0700 (PDT)
Message-ID: <11b3bd19-fe23-439b-3f76-5bacfca83aa0@linaro.org>
Date: Thu, 20 Apr 2023 03:27:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-2-06fbdc1643c0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-2-06fbdc1643c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/5] drm/msm/dpu1: Rename path references to
 mdp_path
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/04/2023 18:30, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++--
>   3 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

