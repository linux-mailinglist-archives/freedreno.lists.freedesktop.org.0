Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4C3B0D04
	for <lists+freedreno@lfdr.de>; Tue, 22 Jun 2021 20:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62946E873;
	Tue, 22 Jun 2021 18:37:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2A6E873
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 18:37:03 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id c138so42096919qkg.5
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
 b=SqgfTNdOPOEae4ycnm65VuiFolDjL75QzhVcNDAYaB18+y6gC/dR2FGFGIRRYu1pnO
 6G/9w/gHa9kP4JXdIkgngJVl7pR9Q1k1pW/6bgLGCYUR69Fnfa/Go4hs4E81apxFVeYM
 CknYzB21+ZhhBxq4HsfpOUobGYuws4uDgpVZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
 b=gMO4nJyDoR+dlfgOAO3zpb6uLbAoKYd8DIlAIjffd3iWGsKYHFOlNnwIJSNNgzQeWZ
 togCEdLAibyNAwWHum5E/JIOsRyP9w/0OP1FxvqjhdstlIg+bs0vOtDWRVGaP7hweC3D
 nRRzF7yXlAbpaFh+9OMjIy/ngCeee7AdN8Fe66NaEq5s+vAnBAUM8dipFEcKgjCJjGFZ
 6b9ahcHu2f5zhX6WLsSosj7a6RFE8W7HoYHwLiSUW5VWDKSzvWc5ZQyrolrTFyo0VFXQ
 XEQY9VG6qipDxWEnQknxWOMuEVl3jO9MO+IMDDy94rzZeVTxrM+N+nQ5P25BZtIQ0nfC
 F+hA==
X-Gm-Message-State: AOAM532zQHbUCy00h48kaM/Q+yw3DoXteZ/A2J3P0DMsWTzLF2ihTYrw
 ctR003OArv4DOttXe4JszZQ8XfrpVXII1g==
X-Google-Smtp-Source: ABdhPJwc0hzVBxVQTjmQG/kXoinQZh9dI512vVQ17KvDTlIZyeVU50X4AUHUgs/kp1r+OWC3Wuj4WQ==
X-Received: by 2002:a37:cc5:: with SMTP id 188mr6014634qkm.112.1624387022069; 
 Tue, 22 Jun 2021 11:37:02 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175])
 by smtp.gmail.com with ESMTPSA id n207sm12647211qka.101.2021.06.22.11.37.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 11:37:01 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id c23so6573987qkc.10
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 11:37:00 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id u184mr5281625ybb.343.1624387020330; 
 Tue, 22 Jun 2021 11:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
 <20210620100147.GB703072@ravnborg.org>
 <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
 <20210621184157.GB918146@ravnborg.org>
In-Reply-To: <20210621184157.GB918146@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jun 2021 11:36:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Freedreno] [v7 5/5] drm/panel-simple: Add Samsung ATNA33XC20
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
 Krishna Manikandan <mkrishn@codeaurora.org>, Lyude Paul <lyude@redhat.com>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 21, 2021 at 11:42 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Doug,
>
> On Mon, Jun 21, 2021 at 08:34:51AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Jun 20, 2021 at 3:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Rajeev
> > > On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> > > > Add Samsung 13.3" FHD eDP AMOLED panel.
> > > >
> > > > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - New
> > > >
> > > > Changes in v5:
> > > > - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> > > >
> > > > Changes in v7:
> > > > - Update disable_to_power_off and power_to_enable delays. (Douglas)
> > > >
> > > >  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 86e5a45..4adc44a 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
> > > >       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > > >  };
> > > >
> > > > +static const struct drm_display_mode samsung_atna33xc20_mode = {
> > > > +     .clock = 138770,
> > > > +     .hdisplay = 1920,
> > > > +     .hsync_start = 1920 + 48,
> > > > +     .hsync_end = 1920 + 48 + 32,
> > > > +     .htotal = 1920 + 48 + 32 + 80,
> > > > +     .vdisplay = 1080,
> > > > +     .vsync_start = 1080 + 8,
> > > > +     .vsync_end = 1080 + 8 + 8,
> > > > +     .vtotal = 1080 + 8 + 8 + 16,
> > > > +     .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > > +};
> > > > +
> > > > +static const struct panel_desc samsung_atna33xc20 = {
> > > > +     .modes = &samsung_atna33xc20_mode,
> > > > +     .num_modes = 1,
> > > > +     .bpc = 10,
> > > > +     .size = {
> > > > +             .width = 294,
> > > > +             .height = 165,
> > > > +     },
> > > > +     .delay = {
> > > > +             .disable_to_power_off = 200,
> > > > +             .power_to_enable = 400,
> > > > +             .hpd_absent_delay = 200,
> > > > +             .unprepare = 500,
> > > > +     },
> > > > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > > > +};
> > >
> > > bus_format is missing. There should be a warning about this when you
> > > probe the display.
> >
> > Sam: I'm curious about the requirement of hardcoding bus_format like
> > this for eDP panels. Most eDP panels support a variety of bits per
> > pixel and do so dynamically. Ones I've poked at freely support 6bpp
> > and 8bpp. Presumably this one supports both of those modes and also
> > 10bpp. I haven't done detailed research on it, but it would also
> > surprise me if the "bus format" for a given bpp needed to be specified
> > for eDP. Presumably since eDP has most of the "autodetect" type
> > features of DP then if the format needed to be accounted for that you
> > could query the hardware?
> >
> > Looking at the datasheet for the ti-sn65dsi86 MIPI-to-eDP bridge chip
> > I see that it explicitly calls out the bus formats that it supports
> > for the MIPI side but doesn't call out anything for eDP. That would
> > tend to support my belief that there isn't variance on the eDP side...
> >
> > Maybe the right fix is to actually change the check not to give a
> > warning for eDP panels? ...or am I misunderstanding?
>
> I have never dived into the datasheets of eDP panels so I do not know.
> The checks were added based on what we had in-tree and it is no suprise
> if they need an update or are just plain wrong.
> I expect you to be in a better position to make the call here - but we
> should not add panels that triggers warnings so either fix the warnings
> or fix the panel description.

Agreed. I'd support a patch that removes this warning for eDP panels
unless someone knows that it makes sense. I haven't been able to find
anything indicating that it does.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
