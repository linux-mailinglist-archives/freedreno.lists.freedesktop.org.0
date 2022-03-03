Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E174CC921
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93610E38E;
	Thu,  3 Mar 2022 22:36:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54010E2BA
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:36:18 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id 12so6176392oix.12
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+IxH+v4af7VzrKdvTOvKB5ZMTKZ+t8ui6EDkfQqlJ0s=;
 b=PJEWLzqqseHPPRxvwZuM6uOTCWfL7xJ4o5KBWyKiuf78oArICZi8oBY5JN41+D6+U4
 1V9U45UN69k8kRFLyAd9as/9FWGo1nF+iiwSB/r4fL96T8nXvfeocBGPnibJfvM2El6W
 4MoTqRyW2rvnGjSsyvxThTWme7V1vFH2sns3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+IxH+v4af7VzrKdvTOvKB5ZMTKZ+t8ui6EDkfQqlJ0s=;
 b=FaCUOhGgBc8/X+cX8n6v7wwL53ScM6e4k78iRK7ysd6ALM+vzdJcCbujcXHQOTfr/t
 8yksGphX6mAHSGFmFh5oVzS1ygvL9m0U49zN8pYi2wcH4sz5MzULWXCBaVa0iSfWteID
 Pck5jpDBkL1+sHYhyaqCfKCozzVIqZWX7i5r+YjzbpfuAC0L1bdTM/cXp9kN8q5Qc4qK
 7aclz+xCsV5dFXZHwapT4cFvnMaPMFR/MA23nwi6MmQxf/dIcWyagfr+jCsM1Mo8CoUA
 /WQ3olNbjhK6M4FtkAWtebpiO58hLRxvj9iEk8h/oxHIB1ynIxgs7tj3hs+Jl72iQdN9
 rW6w==
X-Gm-Message-State: AOAM5318f7ECHxm2jz+V/CSOHov242G5WVkOD+ajuJhFnqpy9YRXij6E
 O8Il/tQVVrkpjaCPoP/ImnQvr/uKOiSghQoKqL9y6w==
X-Google-Smtp-Source: ABdhPJwzE9l5wF1WBh0ZzcfsjbubuW7clbOvgM6f0zoFQo0kH1jqpjN6+RqUObMiyusKhqmjRdcZskOhtJ9BSyNvUUE=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr922767oiz.32.1646346977864; Thu, 03 Mar
 2022 14:36:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:36:17 -0800
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuaYEC2rYxi1uU0S_Hkx-DbjT6wO4zz6sKSRON=eX10ng@mail.gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-4-robdclark@gmail.com>
 <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
 <CAF6AEGstzPaLFf-9z9Gf+S4G8n6twxExLvKaqLZk9ML2tUWiLw@mail.gmail.com>
 <CAF6AEGuaYEC2rYxi1uU0S_Hkx-DbjT6wO4zz6sKSRON=eX10ng@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:36:17 -0800
Message-ID: <CAE-0n52xXJG3kohetn3sDBmsBpMqL5zvS2yRzP+sPdq5+7vHgQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: Add SYSPROF param
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
Cc: Rob Clark <robdclark@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-03-03 13:47:14)
> On Thu, Mar 3, 2022 at 1:17 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Mar 3, 2022 at 12:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Rob Clark (2022-03-03 11:46:47)
> > > > +
> > > > +       /* then apply new value: */
> > >
> > > It would be safer to swap this. Otherwise a set when the values are at
> > > "1" would drop to "zero" here and potentially trigger some glitch,
> > > whereas incrementing one more time and then dropping the previous state
> > > would avoid that short blip.
> > >
> > > > +       switch (sysprof) {
> > > > +       default:
> > > > +               return -EINVAL;
> > >
> > > This will become more complicated though.
> >
> > Right, that is why I took the "unwind first and then re-apply"
> > approach.. in practice I expect userspace to set the value before it
> > starts sampling counter values, so I wasn't too concerned about this
> > racing with a submit and clearing the counters.  (Plus any glitch if
> > userspace did decide to change it dynamically would just be transient
> > and not really a big deal.)
>
> Actually I could just swap the two switch's.. the result would be that
> an EINVAL would not change the state instead of dropping the state to
> zero.  Maybe that is better anyways
>

Yeah it isn't clear to me what should happen if the new state is
invalid. Outright rejection is probably better than replacing the
previous state with an invalid state.
