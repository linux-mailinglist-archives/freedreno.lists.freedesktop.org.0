Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DE3D6856
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 23:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29886EB85;
	Mon, 26 Jul 2021 21:00:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959066EB85
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 21:00:18 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so2552125ooc.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8KXP5owN8flF/sx0WAhinix7DviMfrTpDVl4MvdT/qU=;
 b=HbROtzQclhAZaw6tKB6J5+ue2Sm3504YhCrv7xxAah586ueHzw9siRliaIBchTdxIl
 17nZyrmj7S/rk1NjOqqxK/6MZyZ0mIoIzqcPClRFJuacF3X/OaG7PPH9zUHZz5t1i2FB
 WSSSGOTkuVGh1YovB3A5NAKN8kfzzbScuvxmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8KXP5owN8flF/sx0WAhinix7DviMfrTpDVl4MvdT/qU=;
 b=Zq6dzbz5tJ/vYRBXat36sD0nOI8bPvelUkwNO3xEQiGrRK6FgNkq9VL+gV120esWlV
 hG6hhA3QHUs7WYWbabLsUMw/rnOv8NY2oHZdBNTuoPF4kTx+Lm2vHs2blLfMOtYssRqM
 PBJ72D7bxORRoKX4WPkaCirpOMhoKuJEevm4UrWVYVGBTr2LtyGaGKXzantJ2wbF8SWM
 SOh48DR8nju/jjWRXdMRhg8WBInNlsbuM6p7S2Rg9GEPIKcTInbXTXnbssx1Gvwa1nJR
 24UWSjW/LOJtF1BNU0Obuf7C8EVvUXOIJaQaXGFWMP3FhUdohtouIeLcXId9SvQWKvj6
 ZLhg==
X-Gm-Message-State: AOAM530k0dTATOAz91IS3czB7A3C4DAvTKlbKToz8sXkKtBsMWEGCDCp
 4hXN3i0GlZsnLn7OxdD/9F1HB5J16s8EkdGaAdjmfw==
X-Google-Smtp-Source: ABdhPJzd2FudvCDeOTS0IgcQEAWpsYFnWx0o1aDDH36H6oJiWE8V5Z+7WofQB8S8Lf86XrpE3v2FqYhsKsBUGAcIIJo=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr11661227oom.92.1627333217883; 
 Mon, 26 Jul 2021 14:00:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:00:17 -0400
MIME-Version: 1.0
In-Reply-To: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 17:00:17 -0400
Message-ID: <CAE-0n53+YChS9sNVg-SB8ZKVqSMbTJfm28KPvFsZk48cC2WqWw@mail.gmail.com>
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: add logs across DP driver
 for ease of debugging
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-26 10:36:26)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v2:
>  - Got rid of redundant log messages.
>  - Added %#x instead of 0x%x wherever required.
>  - Got rid of __func__ calls in debug messages.
>  - Added newline wherever missing.
>
> Changes in v3:
>  - Got rid of redundant log messages.
>  - Unstuck colon from printf specifier in various places.
>
> Changes in v4:
>  - Changed goto statement and used if else-if
>
> Changes in v5:
>  - Changed if else if statement,
>    to not overwrite the ret variable multiple times.
>
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
