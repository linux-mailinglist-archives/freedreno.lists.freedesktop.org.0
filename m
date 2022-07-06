Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A8569067
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 19:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48311A378;
	Wed,  6 Jul 2022 17:14:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2D311A2CA
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 17:14:17 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h19so19168611qtp.6
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
 b=NcYmRAhNkr+Sej+dUBW/rUemcu4qhrB0eGXwYx5FTFmtQ8tKRufDlwJ/lkS7wER2zJ
 jV6wRoRmAMNdAQSXMkcvIOLC2e60hR5mw9xUwmncmRINM3JFeYMHnzmNaXHfIjFlbf7S
 LDX+d7jVDzt3eROD00YFUpwlzzpN+FGYYubdZ94XUT/jDUnTLGCPskgT+K5yZnTAH4nR
 9KN4M7fzv63p/y1wtxjpDfTTuC85SufMiPGqenPoHFa91gprzBOo9A8iG+THujkecbCy
 fhtfwsTjXDPXOWFw8PTjz5echkBOFR7P9QzIipHzfLD0oVava1d+90rXJYk2Old6RtK3
 GuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
 b=mmRh8yJBDHHAyniz5IuvaGkmcG9QMrVkQFKd/BMU5wXYu5cnsvODAIdUUZ0PJhpF/g
 bijrRIKGDU65sWIJggxdCF7EiqnUwoASSzhd5TggP9hvHxuQPvH34qtBR8lb/2DRsYtW
 S7V4jg+Ew+dEs18To9ELD/WKqVu6udMuP+44nbsrHdpz5NCDh11HGAOuU8XHTHQsvUoM
 lGBDyh1jpe+gkcGxS4S/JsoaBiti41cs4Je2qW16SW1fPrOgqmJmNr/9jQQU0NO63ED0
 tSXRV8ERc12CE1RN4kZwbS7xFP2r50fl64gm8DHo6LO5v6N7QT437DkE2gBZ/u4nqWQO
 1FkA==
X-Gm-Message-State: AJIora8aysdKaq5kGknhB6G7YlynlJzmhJE3FEyheNX1W9y9OcLYoKCy
 peYKWhFDNdrsKyrqHrgcqtAI139wEfeZtUTrZAGa+Q==
X-Google-Smtp-Source: AGRyM1siyHqhjYbCijMakD/a+R1/ORAjQrKAxonXg7rZEccsGYIKNljc2HpasXRM2tM13BML+/t+aFxBEkjO+7fgSBU=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr33974182qta.62.1657127656137; Wed, 06
 Jul 2022 10:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
In-Reply-To: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Jul 2022 20:14:05 +0300
Message-ID: <CAA8EJpp2u4NuimhvkXwcO2kPQCopgbDV5x=B+LEkyqoQrSW5rg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Do not propagate void
 return values
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Guenter Roeck <linux@roeck-us.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 16:18, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> With sparse ("make C=2"), lots of
>
>   error: return expression in void function
>
> messages are seen.
>
> Fix this by removing the return statements to propagate void return
> values.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
>   - Add Reviewed-by.

-- 
With best wishes
Dmitry
