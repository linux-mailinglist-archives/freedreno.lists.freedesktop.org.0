Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E213DF623
	for <lists+freedreno@lfdr.de>; Tue,  3 Aug 2021 22:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4882A6E12B;
	Tue,  3 Aug 2021 20:13:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3414A6E12B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Aug 2021 20:13:11 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 26so248721oiy.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Aug 2021 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
 b=XS7RdH1UoHVjTZIVBMtzi7boDGmgd74mV5qkzXfTgWhhlsz3FFJTEDA96jM66q0qkf
 tnVqs4HREXO3oXmdzKpEJ5QPLD/vrXJKcTd6Abto1Wzs2Ai81iJHcmfPEb236VbvNpzy
 yXHQfuIRGFlXCLBAiYSqYmJ9UCVCi1qrG8OYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
 b=r8fGLQVuxhcM0hJQcP2kEIKXEeNgKF5Kv/xYRYqdyEa6bMrjG22XSNEE/a6vF2zX8c
 oTtEYnzCRoCuIp/YxRSQDyHUyVK+4j6xBQ4pxuPhFFs76DcdtW7kdR/+wEDXeMXhcCUw
 VKTF6dewaRJyxtg5g0Lr2mg6WzHuRJFfZJn005BkXHU7aoJnBpM1Vxt1ZWRNZHHlN2l7
 B1/sb3HtmvR33j6BPCD9H9O759Y2AxwuEi6Wqd1VO+OcUTrTvxgypYRE63bvH0oYEUk8
 Vh/StWGU6KXdb5UEH9X1s/owXTBXnS5I1nFX2YtUbfAWn+1fSdFGMCFV7mzA9Q7o5YP5
 TnGw==
X-Gm-Message-State: AOAM531bf4GWBDFhmZP1n5CXGxCP2+4p6z+7HsdLx6/kmk4c92EZokt+
 Eqepj5bZwJtpRukxHnsO0WugPywRLdj8xd2GKg6piw==
X-Google-Smtp-Source: ABdhPJwHzCEof57wa5MwJlj+OLIE4A4DUTjhh66InjV2cvQnN4ABaOQLvHRfB7a7K2brpMYq1WkI3dr6mVq+wsZF35c=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr16109374oiu.19.1628021590448; 
 Tue, 03 Aug 2021 13:13:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 15:13:10 -0500
MIME-Version: 1.0
In-Reply-To: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 3 Aug 2021 15:13:10 -0500
Message-ID: <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, dianders@chromium.org, 
 mkrishn@codeaurora.org, saiprakash.ranjan@codeaurora.org, 
 rnayak@codeaurora.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: add safe lut config in dpu
 driver
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kalyan Thota (2021-08-03 03:41:47)
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
>
> Issue reported on SC7280:
>
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
>
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
>
> Changes in v1:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
>
> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for SC7280 target)

This is wrong format and commit hash

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for
SC7280 target")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)
