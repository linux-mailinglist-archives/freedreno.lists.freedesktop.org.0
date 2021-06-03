Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DE39A5CA
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 18:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ADA6E5B4;
	Thu,  3 Jun 2021 16:33:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85C6E21D
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 16:33:49 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id a15so4858610qta.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
 b=OJtnsUj+NU3k9eUbaBLoZa3VTWFwShEc8qClgbcAydu3jpRLmFZvXo0S0GFkNEQI5m
 70zGDVy/c/F2SXrvYFzqUe9QI0Q0gdpfzp+YNtkvGdfH2q+gQoAYI1E8UDgPJ2lCKjsO
 kfdvL4JeF8H4G+Mov9iBsP3ybfNhm3/gfInNTTwBWY9AJRuCGrg6Eh/BBTy5T/m+n4V5
 dNe5UALRYPNlKYm63n6ONLLrp4eWKqEymkPfl5A4UF0ilQ9HcROTNbMPeHdb39D9NcZq
 ynWs1/W9Hwkrtco0K4VU3Or/HcFjgj4YwiGGBpMIIMvf5GXxGf0y3bgpj5rOZ7gTNgSo
 t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
 b=mgaueAE7J8k0w86BVJ2iLyjlXvHNkcV2mZXWnmu6ii2dZzBLJxuy/yxnaA83gOKFYN
 Vg5ecE+f/G8lVpRH+XyQVurk0m6ewKEW/0h0HfTb7DMqkMHgYK5/abQzywez7dZ7i1rt
 73iissqRY47NWvx6Cd21XKJmoCppxC1Oo9DRyvDCqNql+BcVRPNnxW0rkvWEHtHcsji5
 9Q82ZdsJDg0T6E7KOgjQbzwKqMmj5BqVX+AL15YGZjw8h/iL1uORjtPLyb2RpPuvfERQ
 XHnxAIEeQF2MkOngQzgFHPOX3TV6GUlS4isGMqvEHYUbpU+HNYq1HM6i/Z2ahRrCJ86C
 I5ig==
X-Gm-Message-State: AOAM532jFDSmp91EgYGpsQgGmBiUA1rgEcUJPVgnjivJWOg5xhrZwDXo
 0rxn51+7ZTp8WlCSJc1k6m16mWYFCVrrCpGWVMEDnQ==
X-Google-Smtp-Source: ABdhPJzeujnPaoppD4L3W7TKyoCjppbsv+WDwxb4a7/akyjuJiDJQcS4p674wBCDV3Vht6awFUTQcfFmk6ji0AGwTas=
X-Received: by 2002:ac8:6b08:: with SMTP id w8mr335813qts.364.1622738028536;
 Thu, 03 Jun 2021 09:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
 <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
 <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
In-Reply-To: <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Jun 2021 19:33:37 +0300
Message-ID: <CAA8EJpqkrkYF=DW46PWB=0huB9U6e2QqXjJv532f0PyDCC-eXA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [RFC 5/8] lib: add small API for handling register
 snapshots
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 3 Jun 2021 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add small API covering lists of register dumps. Currently this is a part
> > of MSM DRM driver, but is extracted as it might be usefull to other
> > drivers too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
> >  lib/Kconfig                |  3 ++
> >  lib/Makefile               |  1 +
> >  lib/dump_state.c           | 51 +++++++++++++++++++++++++
> >  4 files changed, 133 insertions(+)
> >  create mode 100644 include/linux/dump_state.h
> >  create mode 100644 lib/dump_state.c
> >
> [snip]
> > diff --git a/lib/dump_state.c b/lib/dump_state.c
> > new file mode 100644
> > index 000000000000..58d88be65c0a
> > --- /dev/null
> > +++ b/lib/dump_state.c
> > @@ -0,0 +1,51 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021, Linaro Ltd
> > + */
> > +
> > +#include <linux/dump_state.h>
> > +#include <linux/slab.h>
> > +
> > +void dump_state_free_blocks(struct dump_state *state)
> > +{
> > +       struct dump_state_block *block, *tmp;
> > +
> > +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> > +               list_del(&block->node);
> > +               kfree(block);
> > +       }
> > +}
> > +EXPORT_SYMBOL(dump_state_free_blocks);
>
> nit, perhaps EXPORT_SYMBOL_GPL()?

I don't really care. What is the current recommendation?

>
> BR,
> -R
>
> > +
> > +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> > +{
> > +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> > +
> > +       if (!block)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> > +
> > +       INIT_LIST_HEAD(&block->node);
> > +       block->size = len;
> > +       block->base_addr = base_addr;
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block);
> > +
> > +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> > +{
> > +       struct dump_state_block *block;
> > +       va_list va;
> > +
> > +       va_start(va, fmt);
> > +
> > +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> > +
> > +       va_end(va);
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block_va);
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
