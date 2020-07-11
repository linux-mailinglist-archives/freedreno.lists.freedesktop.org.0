Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473E21C410
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 13:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEDC6E222;
	Sat, 11 Jul 2020 11:49:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB786E204
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jul 2020 11:49:07 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d17so9336392ljl.3
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jul 2020 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
 b=YtE/Av3bVbWUb1Iwokjhs3fiSvRQhLlfVYgp/g+LQvy4d1OYBXcE63gXGMOzz574Ot
 PUMdmLBd6z6GvBfYr91kbor5HYfdQsENqFiK7APq0QwO8lSHcsrcnfA7BDE/2UqLY2CT
 3BfyOUSumHxubjzqcC9uuxxttUexSVN67Cc+VTcuelCjZKcRdUgdv3oaQxFx3joG/XyI
 9avcLEjRIpQ9AKIMaqp1cG8s0mnFkZvG3XBtJ29FsoJzpV3R8y1861DGlRrZRwiXcGtb
 cYEvRsBhVJHaZG2+v4Wh5Ur9pbx5Nzal8KCiODnZYinrki/jYJIp1HLWRC0LXlvysmI4
 tATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
 b=RaMUYn/NOW/fyvYnCpptgjgsned93erpFOT4+ZHZG8ba3mAz8Ybs0Szwi3XAq/AYjp
 Mhi3zo7tKd+Wo5a7iiUJ+Fas12nMrO2vDXmh1nBMhh5IY+O3PM0ZWah6LB5+4j0E2cpt
 lgrWyslGRWh6IS8X+53V1WMFWC5c10Wh+RwUkVNqnBhYIiae9J0F6zuWSSd0P3is8qYD
 kxuDKzV7gcEF3UD60XABxj6I+v97RrblRWirNiw6SPP2puPPwU0HXcTmkvbuL73BtYzo
 fhYXrIrVWksyUAwm0BTrB7i6u2tKkgBbetn8HSGvjLud0WuwtipVY8JkzgHAme9/WLZ5
 iJtg==
X-Gm-Message-State: AOAM530cJd6TgTitB/pUXx3Dw5HuhUh55uLGRe4nX5GbmTRXutTfwMDH
 IIxsrScip4nv+wRGPljcHLWI+hr3uUzAbiQXQk46yg==
X-Google-Smtp-Source: ABdhPJxxFmrJz7/vRwpDkqiIuwv2rWq4N6yDKkszqYRfmcjiTZlBxgzh+2T4uIrxNxpy8O4zOPyOVBKyMRyXLYBeKnw=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr26485425ljc.104.1594468145646; 
 Sat, 11 Jul 2020 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200707203529.2098979-1-robdclark@gmail.com>
 <20200707203529.2098979-2-robdclark@gmail.com>
In-Reply-To: <20200707203529.2098979-2-robdclark@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Jul 2020 13:48:54 +0200
Message-ID: <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: sync generated headers
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 10:36 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> We haven't sync'd for a while.. pull in updates to get definitions for
> some fields in pkt7 payloads.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Out of curiosity : where are the syncs coming from? Mesa?

Yours,
Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
