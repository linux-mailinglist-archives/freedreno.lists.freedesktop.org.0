Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801EA3A0571
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 23:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112E46E1CF;
	Tue,  8 Jun 2021 21:02:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC96E5A1
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 21:02:56 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id p21so4643624qtw.6
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tI5apJy6qAcGNcp49inXli13iJ5zzU/EHf7L81CBh78=;
 b=JMUKNYQ/Uorm1mPfiretBAqd1KKOje4jcX9qzjAaDdhKuzgxVOlRkeNXNuGVt9waek
 lVUvoKhsvypiE9mSDAbMSjUU6ys+QrVwF10LQw+K/iw41mnZ5/fonFLU+LzFfeaqRfju
 m5Xk+XBo/o2olnwXRL/YUwjnu9PT4U7LZ9xkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tI5apJy6qAcGNcp49inXli13iJ5zzU/EHf7L81CBh78=;
 b=ce/b0/1uDuweXlZ3I0RAMM54fNx63fbOy0BWRXg3SuWgs836UjULyMm+DzBFCfSCpC
 DOzctYzONR3hLvuMb7Yh4EirtKAcIeEEpEktSGvrk2OD4wZcyjGyFY5uvWvHDG+nDDU5
 GDw0CpjbZuYqKFDh8F0x6j9La7HWatnljz/JtBSgidTnFIctYHgIKjzMEdK5RrNOmxT3
 GbJV0gxqAu+dFzArx7F6gLCupd6d+/8tr1TsRUbu5bLm2JUfkqGpINw/bjSZgddfzNko
 tx1KxLNyigRbTSbzIeoj6/WQPGP7XDp+YM6WiUh3S1i0PHZsgIP8xPIIGe3kS6Xgyzlz
 mmyw==
X-Gm-Message-State: AOAM531pb4J2Oo62BBhXvdF8OfjjwyuH+U43RcFLz4h6mr/Bteedux2M
 1lL7t0+zcw9S/9vKK65Rzns8ozk5k2Su5Q==
X-Google-Smtp-Source: ABdhPJyPa+QxtVY44i5TV8snVNL+cd9cZmb1BrvEZ8EfYpjajGucuZ/2DyRQGTIFL93s9lftfNKboA==
X-Received: by 2002:ac8:1003:: with SMTP id z3mr12244376qti.391.1623186175629; 
 Tue, 08 Jun 2021 14:02:55 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id l5sm11551196qkf.55.2021.06.08.14.02.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:02:54 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id e10so32214538ybb.7
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 14:02:53 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr34051315ybp.476.1623186173429; 
 Tue, 08 Jun 2021 14:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
In-Reply-To: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Jun 2021 14:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy-a_rCrx-mjDwr07CN=281ZyomVX7dcFiWrzFExcTTQ@mail.gmail.com>
Message-ID: <CAD=FV=Wy-a_rCrx-mjDwr07CN=281ZyomVX7dcFiWrzFExcTTQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Freedreno] [v4 1/4] drm/panel-simple: Add basic DPCD backlight
 support
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Lyude,

On Tue, Jun 1, 2021 at 3:20 PM Lyude Paul <lyude@redhat.com> wrote:
>
> oh-looks like my patches just got reviewed, so hopefully I should get a chance
> to get a look at this in the next day or two :)

I'm going to assume that means that you don't need extra eyes on your
backlight patches. If you do, please shout and I'll try to find some
cycles for it. I've always got more things to do than there are hours
in the day, but many folks from the DRM community have helped me out
with numerous reviews over the last year or two and I'm happy to pay
some of that back by giving reviews if it'll help move things forward.
:-)

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
