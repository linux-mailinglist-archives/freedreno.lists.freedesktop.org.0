Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE141F45D
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 20:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCBF6EEA4;
	Fri,  1 Oct 2021 18:09:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F66EEA4
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 18:09:45 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id m7so9992072qke.8
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 11:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGWtQ8weImqQpPz3//oFTgRTO/g29HsvOa/9MfOVgZs=;
 b=dvH7fniNsvzTWgdm7rBSCJ2hGBhYLqkOJuwZpogrL2WwQjldz2SM84+KJPm9IGDaKC
 /fvGIgKYkZfK9mwMVG9MxIVdMEMPQiXkGWgSEFKgbYjrjiQa3pBFhqtIJD2H/wynGrr2
 qAQ6k9PAMebL4+moFHi/AnEUTMy1BQOCG1g1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGWtQ8weImqQpPz3//oFTgRTO/g29HsvOa/9MfOVgZs=;
 b=asKAhdbRLys15baTTaUIevuy+daBXRHuzzx/TEyynH28+jBnG5NcUGPDqZCOZoZHOV
 5xLjnTvlUmc/3jA+Jx9BQTT5JxNjDQHNf5BelLMSYYxrZsV/xXWooc3szSX5g6Z56r6n
 pEpUiEGd2oyyPPHS+LBFIle7tht6kaIHd28G7lPklTYiO3+Q3IWBfd6x1/SnYd9FTExT
 ywe7jtS/pKPZSyPob/j8osjyzthu+VycEC+Lyi+f2+jZeusIH86DhuvmG1X+jvVzVNzV
 2DB165ON8BqaV5IDr1gajMWL3I35pNY+d92iRss6DUWauwG3SZCGc77wC2U4uNJJsHxX
 X8cQ==
X-Gm-Message-State: AOAM532kaRCJdMUcJxnXPQP9Q+fsZ9Vemged9+govPC2TChixyuR4G3r
 W96Pw0iEmXrHr1W/v/uCQKZPJKxWjUgYyA==
X-Google-Smtp-Source: ABdhPJzsIJULoLOtlvVgwGDIxIyBkiT+QYnQ6Bt/V0zqTRMJLwGk9PbfPRAwAJvxlOmJ+K5WIqceqA==
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr2547023qkf.437.1633111784228; 
 Fri, 01 Oct 2021 11:09:44 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181])
 by smtp.gmail.com with ESMTPSA id u189sm3352663qkh.14.2021.10.01.11.09.44
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 11:09:44 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id t2so9781029qtx.8
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 11:09:44 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr2939004jao.68.1633111321643; 
 Fri, 01 Oct 2021 11:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-3-robdclark@gmail.com>
 <YUvKwsNS0LQf9PfO@pendragon.ideasonboard.com>
In-Reply-To: <YUvKwsNS0LQf9PfO@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Oct 2021 11:01:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwORJ65v_JgXqXkUKg+Kbb-q6mrbnuEL3VG8v552SRzQ@mail.gmail.com>
Message-ID: <CAD=FV=VwORJ65v_JgXqXkUKg+Kbb-q6mrbnuEL3VG8v552SRzQ@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
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

On Wed, Sep 22, 2021 at 5:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Mon, Sep 20, 2021 at 03:57:59PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For the brave new world of bridges not creating their own connectors, we
> > need to implement the max clock limitation via bridge->mode_valid()
> > instead of connector->mode_valid().
> >
> > v2: Drop unneeded connector->mode_valid()
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)

There's no reason to wait on this patch. Landed to drm-misc-next.

77d40e0176a5 drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()

-Doug
