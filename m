Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18373A877
	for <lists+freedreno@lfdr.de>; Thu, 22 Jun 2023 20:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C480B10E5B5;
	Thu, 22 Jun 2023 18:44:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0ED10E5AA
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 18:44:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f769c37d26so10459348e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459468; x=1690051468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YCOpIHvG88TbyiREhYBT44GXhfDt0FfqT5yfIjW1YVY=;
 b=BsY3UPDWemFdQwlJktCluyp/cMLJDFb9RmtdioV5u5JvFc+eZIC1CgJIrMW4++UJKE
 kqH5pseepvVK5XZCD7W7gHTZrK/QBGY+WpZTQG40dDdUKN8OQEM3LjutV6xgU++Mr0o2
 2Y6Cb6riBHiX0AgIxRIzDM1V1OcpHk9buoTZ7jfPuXM5gt1sn0GNo9OEco5crU+qa320
 zGOnt9bw3Z5IamKTErOluJBOT32+WdygHb737nJSL5ynyDn8Hh79qJJcNSuvVVWRRZMQ
 7xxP+yB1uLOkXurJXV0zD9ii1h4vK5cHS2vgn/alq6jc+agSpR+rtAQSGXfg8irwm39a
 lyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459468; x=1690051468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YCOpIHvG88TbyiREhYBT44GXhfDt0FfqT5yfIjW1YVY=;
 b=X/4L+xdlB7Ex4fI9ZZL5Xv3j9Mwgp4BuUYtT+eFA42Srk8qxAKYRcHXyC/myGxr3+1
 VDhS68YO50akOLqLHelXHrlJZyqMhMGascCIQ4IaxQAmRV05S7LX05bEVWizEv1Q9CwS
 RMUUKmuSCk/vzJEakFaPn1UiNoOSMaJWalRuVY+G+0k0lQLj2v/Z8qBV8+lEwPMFTG+P
 dnU3EVJdJg8mz0BG1Hr1bVK8IUTolLu9/Gxz5TcIMm8u7xcrfMImvYA23gJlY9nDtU5I
 rIlTkSOLhvR5FKxpqyrH7TXXbIScvou7s7FQv932jJTabVL6wGKxFLbrtRS8Fdl8XBJx
 o5Sg==
X-Gm-Message-State: AC+VfDzMnf5j1PpUm33P3usLkI5NQXlXnTUW7EmhZjZzKNwFDVGiwiTH
 yfa+J934Q7g8gpPsfV0LkuWMLA==
X-Google-Smtp-Source: ACHHUZ6CVk4iw0BJSVcXeJDQSXiTxAwizB/vtHdoAOZ5FZ0PaQHluOApefAgx0FUqCAc9OATseGHyQ==
X-Received: by 2002:ac2:5b1e:0:b0:4f8:5d15:99e5 with SMTP id
 v30-20020ac25b1e000000b004f85d1599e5mr2143376lfn.32.1687459468465; 
 Thu, 22 Jun 2023 11:44:28 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 v24-20020ac25618000000b004efe73ee01fsm1193566lfd.306.2023.06.22.11.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:44:27 -0700 (PDT)
Message-ID: <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
Date: Thu, 22 Jun 2023 21:44:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <20230620054031.1203960-1-juerg.haefliger@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620054031.1203960-1-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Add missing
 MODULE_FIRMWARE macros
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
Cc: sean@poorly.run, quic_akhilpo@quicinc.com, airlied@gmail.com,
 ribalda@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 konrad.dybcio@linaro.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, joel@joelfernandes.org,
 freedreno@lists.freedesktop.org, johan+linaro@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/06/2023 08:40, Juerg Haefliger wrote:
> The driver references some firmware files that don't have corresponding
> MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> ---
> v2:
>    - Drop addition and removal of zap files (needs more discussion)
>    - Add new a690_gmu.bin
>    - Update commit subject and message accordingly
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

