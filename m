Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD538D1A5
	for <lists+freedreno@lfdr.de>; Sat, 22 May 2021 00:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CBF6E888;
	Fri, 21 May 2021 22:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6C6E888
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 22:42:32 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id c3so21100887oic.8
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 15:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
 b=JuWjpEhic+xV1ZNrO7nGh7+zj/LoH1+GnTZhdGcEFUKEx3kh89A9Gbnykica6aRKHx
 YHO4f626GsAaCScaIHoGQzsXlhk5ZUuyj5XUAzDPZJ73XA5aXQeviDZF9fzCVIrJgc0R
 j6Kxwmj/OOdTTyL2+ZNMLOdRqMdTCn3PJ2+Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
 b=hqdiDBHfPj+f+wXH5tAVr01mvnfIFYLZo0ChB/yrRd8JOw12jBKDc2StzyuRQfxqRI
 d8E8MNSyyaaQlFNLKAskYBiQDh8j2iZCV1svTFfS6KBvIUMGkJhuapLFhtNhyd1rf1UR
 WNaHXdz1IdAgpIb4fq2sUwO0n4YSBUwJrQ16z8MNf35Y/LlPw2V8q9bVVXmihQCvtoiL
 GbSJzAIC+FPlYVoGpzTmhSF8yBzY+uX79zbKB4JpVb6qI3rWh7EQQH3MM2r7mprFdEBL
 x+xWetIfyy0PJl3RPWS31gemW96la9Dz2EqViN6zetrDdbRAnfDB22LjlmuwNvC6d0fk
 ttaw==
X-Gm-Message-State: AOAM531hQTrK9GV4acWX+AJjaMQSqQu9xQJcI3LPGvZ1ifR4C0pz23KV
 37yUrz8b3ubwRD486MtxykjXJQqRTwhKZQ==
X-Google-Smtp-Source: ABdhPJwrvMQpF9fXlXOqjycrUyN0XtP8JrpCWansndkOv9bIpx74U+4Hde+al4aSeBLZnG+P/Gcuqw==
X-Received: by 2002:aca:35c5:: with SMTP id c188mr3787077oia.27.1621636951362; 
 Fri, 21 May 2021 15:42:31 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45])
 by smtp.gmail.com with ESMTPSA id x11sm1554389otr.36.2021.05.21.15.42.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 15:42:31 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so19444556otp.4
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 15:42:31 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr19007986ybm.345.1621636545135; 
 Fri, 21 May 2021 15:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
 <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
In-Reply-To: <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 May 2021 15:35:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Use
 nvmem_cell_read_variable_le_u32() to read speed bin
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, YongQin Liu <yongqin.liu@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, John Stultz <john.stultz@linaro.org>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 21, 2021 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-05-21 13:45:50)
> > Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
> > proof ourselves a little bit.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > The patch that this depends on is now in mainline so it can be merged
> > at will. I'm just sending this as a singleton patch to make it obvious
> > that there are no dependencies now.
> >
> > Changes in v2:
> > - Rebased
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index b4d8e1b01ee4..a07214157ad3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >  {
> >         struct opp_table *opp_table;
> >         u32 supp_hw = UINT_MAX;
> > -       u16 speedbin;
> > +       u32 speedbin;
> >         int ret;
> >
> > -       ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> > +       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
>
> I missed the review of this API, sorry.

You commented on the patch that added it, though? Oddly I can't find
your commit on lore.kernel.org (?), but it's in my inbox...


> I wonder why it doesn't return
> the value into an __le32 pointer. Then the caller could use
> le32_to_cpu() like other places in the kernel and we know that code is
> properly converting the little endian value to CPU native order. Right
> now the API doesn't express the endianess of the bits in the return
> value because it uses u32, so from a static checker perspective (sparse)
> those bits are CPU native order, not little endian.

I think it's backwards of what you're saying? This function is for
when the value is stored in nvram in little endian but returned to the
caller in CPU native order. It would be really awkward _not_ to
convert this value from LE to native order in the
nvmem_cell_read_variable_le_u32() function because that functions
handles the fact that the cell could be specified as several different
sizes (as long as it's less than 32-bits).

-Doug


-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
