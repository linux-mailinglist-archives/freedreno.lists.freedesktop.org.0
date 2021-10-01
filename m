Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2241EF19
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 16:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E11E6ECF1;
	Fri,  1 Oct 2021 14:06:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A6E6ECF1
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 14:06:49 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id d11so10646351ilc.8
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
 b=fL+vUmI833aN0BEMvBL5ZwKKDoN1QrgN1cHfhwoWs/4cdOQsYyYpCCKmP0+dulwt+9
 cLBLX1dkN5SoCTiYF4Q7NbcUq8nKBq0DcP6u4YlmnWrBQpSSSmNeQzdSo/jbfVfLxQBJ
 CHoBAz7eXc2VYpCudViIqjCfvFGXT6iywZjOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
 b=JVB6Q1aebXhRWhwcrD1SEz5gspolNNKlXW8/pJDp/xSBBATU7+MgudT8F7P0b2anJG
 tunRKyhB5SohLKRxD9D5nSWQy6CWdOlkeZi1I0qjbf6dTvPjgOkRpRIPNz9edmsiLYXV
 qTGKmKtxEsR6ik+/f1gqLSBB5kfciz4OyG2Jt+bw8gYUJEFrFjfCsI4En/u4WIY/5gav
 B6TGA6fpFtNEn0cKb4NpcFvZO4xOts4HFKwCVutNsdXS9fOkizjZqsuAzQ+oE4Ge/Gu/
 ZJ/8/tP1KC6mOE1DhXgY6/z2vPK1WBVi9DF0BgaadAtTiJlKqSAdNvTfcea9YH/N5yS2
 Uoig==
X-Gm-Message-State: AOAM533693lelTa8M8Ipl5XpXuvCj6xVZ+ds3p8XZSOMVK/bPuf/LrkY
 lIQCmqB04+zAk1e4JXV3D2PDXs+gHzPjJQ==
X-Google-Smtp-Source: ABdhPJwZqi6j+vS2DSW1JSgvcCIigxivuedeI7D7wnbcOaMVI3JPbfBXRgK+TMZgPR4isIWbidK7BQ==
X-Received: by 2002:a05:6e02:1d1e:: with SMTP id
 i30mr4263901ila.248.1633097208845; 
 Fri, 01 Oct 2021 07:06:48 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id i15sm3662167ilb.30.2021.10.01.07.06.48
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 07:06:48 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id t11so138397ilf.11
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 07:06:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:19cb:: with SMTP id
 r11mr8741064ill.120.1633096741727; 
 Fri, 01 Oct 2021 06:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
In-Reply-To: <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Oct 2021 06:58:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP
 controllers
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

Hi,

On Thu, Aug 26, 2021 at 10:20 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-08-25 16:42:31)
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 2c7de43f655a..4a6132c18e57 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -78,6 +78,8 @@ struct dp_display_private {
> >         char *name;
> >         int irq;
> >
> > +       int id;
> > +
> >         /* state variables */
> >         bool core_initialized;
> >         bool hpd_irq_on;
> > @@ -115,8 +117,19 @@ struct dp_display_private {
> >         struct dp_audio *audio;
> >  };
> >
> > +
> > +struct msm_dp_config {
> > +       phys_addr_t io_start[3];
>
> Can this be made into another struct, like msm_dp_desc, that also
> indicates what type of DP connector it is, i.e. eDP vs DP? That would
> help me understand in modetest and /sys/class/drm what sort of connector
> is probing. dp_drm_connector_init() would need to pass the type of
> connector appropriately. Right now, eDP connectors still show up as DP
> instead of eDP in sysfs.

I'm not convinced that's the right way to do it. I think the right way
forward here is to look at whether drm_of_find_panel_or_bridge() finds
a panel. If it finds a panel then we're eDP. If it doesn't then we're
DP. That matches roughly what Laurent was planning to do for
ti-sn65dsi86:

https://lore.kernel.org/all/20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com/

I know technically an eDP and DP controller can have different sets of
features but I think what we really are trying to communicate to
modetest is whether an internal panel or external display is
connected, right?


-Doug
