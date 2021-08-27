Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15FA3FA0E6
	for <lists+freedreno@lfdr.de>; Fri, 27 Aug 2021 22:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C84E6E9DD;
	Fri, 27 Aug 2021 20:52:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6BF6E9DB
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 20:52:25 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x5so8285019ill.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
 b=FV8wBmGYU5sDobyYYnQpOECTKrYkK8EB7/GlKxGqyLstGxzDaWlP7jlTT05tsDEu9N
 m3ODA5TwhdedwETDFIuIUoqNe6jBe53IH7JlysQzvDipyp3WcCIgWyE2nSumqs3jqm+E
 Zr7wV9fgaErAPWv/uxHyXK5/YaePil/2i1r98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
 b=pI2EB6AG3ExTD/RyKZiSdrXVePvCnwwYZllK8skpqivHiFxMSiuYN+A7p580n3CXn3
 H+CUISFB7v7RjzOJ0+PCgXmh4s5yvdt4RcCJERQCnMYd0HzlzW++rMHFZy0tVy4cC1zr
 7x2l5yaG+is0ZbKDxXl+5uQoNj4H0aqd9lr0krG2wDt9CH+0bc0FRzID1AN3x3K718Ob
 Sz106VnALoAncP5sT76th1r34Wxb7AwXeYeiC6TkmkVj1MfwxVnxiHIqGL6Gm5ugSL+4
 ij2tAa0kJaxewq9kTi4E37x39ZWec65wrWgJEtjPOgaFDxQy1ddiIeFb5zf6HZ7/daps
 fguw==
X-Gm-Message-State: AOAM531ptQ3RJa6b6/sz/Sa/Qu+9xFd3zwUiy8WOxJk5/HUhfi/4IXj7
 Zr30XvNiiQuCez4VwIwioUKuEMDugc1nDA==
X-Google-Smtp-Source: ABdhPJyv06QtfSINOpf53j4KH0giTjdZFL7iWO+QCgnrldYrQbci1KdKb1W8CgNGTrOtuwHz9Bo0Cg==
X-Received: by 2002:a92:d586:: with SMTP id a6mr7689807iln.283.1630097544376; 
 Fri, 27 Aug 2021 13:52:24 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id z15sm3784522ioh.28.2021.08.27.13.52.23
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 13:52:23 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id s16so8260855ilo.9
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 13:52:23 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr7587200ili.187.1630097542564; 
 Fri, 27 Aug 2021 13:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Aug 2021 13:52:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);

Why port 2? Shouldn't this just be port 1 always? The yaml says that
port 1 is "Output endpoint of the controller". We should just use port
1 here, right?

-Doug
