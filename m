Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F44B9138
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 20:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3E10E3D6;
	Wed, 16 Feb 2022 19:32:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374B910E3D6
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:32:52 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so3706650oov.3
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2WrcofDXNq4fQvSh+Kgl5hWSou8+2EddXrcFZuX0Coc=;
 b=RQVD6Spf4AVQMUKOvOtdRaF6z6yGnhjSw8BOFMzXDxDLTsIV7N90lSsRuK7rkB89zP
 nWfOiGR4LbcGTUwut8aVKi2UOfIKbHGA0/KjIHo602H/Yfh6a6jQwRADuwfaxyxeWTtW
 H5l6f/e8+KGiQ8AvZ5yO3THM3fAuwp1xg9Vws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2WrcofDXNq4fQvSh+Kgl5hWSou8+2EddXrcFZuX0Coc=;
 b=jKIF4H8jfriz54ZaQdOntB1P6+EcEbXcixERBtAqb3clqVbR9nS1KFz1xfDBTjRTJX
 d5OdVcvpW9OgRyOg0KD7kJuPb0lDWnFbuTO1OVOC2yjS/7/2I/qLid5pCT1muQInSh0i
 7KJy0Ftvg/f3+NjKw6frgM+DRQka8Cms/cKTfUejy8IpSjCOVjxFGv74zxk4N1CdbViS
 HWmSyh2F8BH6HuMpL6qup3bUS2ZPwS+zVdWwOfmqTQV/e605ne6b/xfmNAOcbpav4ZX3
 KA68WfsXhDiMAvmdN68DwYo3qm79415QHmE0PtgfDJrGnWzQGGHKWN5R17mtgTP6M4OE
 //fw==
X-Gm-Message-State: AOAM533GGd/JYIXg24+hX69HsdSFI4urw34wS+32UeuxOhyecLWTunvV
 MewUJpIjRSEoCIH5O/ZWry4sNGuzM1NYPug7aTh1SA==
X-Google-Smtp-Source: ABdhPJx3zyPVZHUH69iPnA4f7fxjaXMj27nLEaHyAfo/3Oh4oEDYw/v72mxHVfbQirS6DyQb4puuq4DHvHwI5ooAV3c=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr1130229oap.54.1645039971470; Wed, 16
 Feb 2022 11:32:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 11:32:50 -0800
MIME-Version: 1.0
In-Reply-To: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
References: <1643066274-25814-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 11:32:50 -0800
Message-ID: <CAE-0n52uYJ-E2HZnwjJL5VfXnVjiSGJ5MnZG827i=3NP7QNm1g@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: always add fail-safe mode
 into connector mode list
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 15:17:54)
> Some of DP link compliant test expects to return fail-safe mode
> if prefer detailed timing mode can not be supported by mainlink's
> lane and rate after link training. Therefore add fail-safe mode
> into connector mode list as backup mode. This patch fixes test
> case 4.2.2.1.
>
> Changes in v2:
> -- add Fixes text string
>
> Fixes: 4b85d405cfe9 ( "drm/msm/dp: reduce link rate if failed at link training 1")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
