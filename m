Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097E421B2D
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 02:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC56EADC;
	Tue,  5 Oct 2021 00:36:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FF76EAD3
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 00:36:25 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id j2so7726727ilo.10
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 17:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
 b=HVKYKpLYZsQ9UTyyVy1Vf68F9k+FOnBn7+9LJBhoCIDGj4DtpqnbiLLEuHoP7URbRu
 yWbC7e48enorTEgwAc9q+sBTCplD/Nk3G42Ixoy6VrM2x9T1VsqUikRntsEX0fSkrzfT
 mapzJmRojmYesEyumCJd5at2lucUUJNvK2HSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
 b=fqKAeaZwYDSAe8u4PVRByki00ZHdcaU9gQ430IRZH4p59rP5qCTQ5NdlZvoA3IlfVO
 RZOctr6QC3l/ex/XLb2fBLtkdbi2C09ayS22XbgRBei1sYu8D0E97a91m8jHpxUwPvk8
 7h58bOHV/ytV852h0o8uAqt6E+quvtwfMLQxDzvkdsUeNlR7YcfBgfC73OnJP5B16sDM
 u32uPhlfcsbwPoDEH/jlxIlBUHfA3rFl1sDdb5RjkwiLVq+n5O4VN/Jzx/P4mzsHVvLE
 C3OxojAgHYfsIaHdqeRAdXrkALjQTY+MPGgDQpAthQp+32jrn4naKg9v7TXGMpxgwh1c
 B5Xw==
X-Gm-Message-State: AOAM532gVt5YFpDG+AR6RbzV4+jVXiBcf+BJkYFAaHwU58iKz4x6qbMn
 6WtyV9v8YkgJ7rAZC2byLbbMiO3QaKepxw==
X-Google-Smtp-Source: ABdhPJzSRed7HIxvYTVLK+0GkzfdDx6QZUrk9kn+7WFISjh8Wokz6yHaHtv4zWu+TcnifnynkIDNYA==
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr756037ilu.209.1633394184794; 
 Mon, 04 Oct 2021 17:36:24 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id h12sm10451297ilj.81.2021.10.04.17.36.23
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 17:36:23 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id d18so22340901iof.13
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 17:36:23 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr175853jao.68.1633394182579;
 Mon, 04 Oct 2021 17:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
In-Reply-To: <YVd3YdfgFVc0Br5T@ripper>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Oct 2021 17:36:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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

On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > +{
> > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > +       int rc;
> > > +
> > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> >
> > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > port 1 is "Output endpoint of the controller". We should just use port
> > 1 here, right?
> >
>
> Finally got back to this, changed it to 1 and figured out why I left it
> at 2.
>
> drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> reference to the USB-C controller, scan through the registered panels
> and conclude that the of_node of the USB-C controller isn't a registered
> panel and return -EPROBE_DEFER.

I'm confused, but maybe it would help if I could see something
concrete. Is there a specific board this was happening on?

Under the DP node in the device tree I expect:

ports {
  port@1 {
    reg = <1>;
    edp_out: endpoint {
      remote-endpoint = <&edp_panel_in>;
    };
  };
};

If you have "port@1" pointing to a USB-C controller but this instance
of the DP controller is actually hooked up straight to a panel then
you should simply delete the "port@1" that points to the typeC and
replace it with one that points to a panel, right?

-Doug
