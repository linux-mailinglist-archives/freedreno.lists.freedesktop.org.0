Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1610790E10
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51C10E20D;
	Sun,  3 Sep 2023 21:02:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31710E127
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:02:31 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-58dce1f42d6so23742667b3.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693774950; x=1694379750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
 b=sYS08vOXtCEZzh9ct+27+u5tK0zTymhgvpFxl0XLQq79llmSQlna/4+DJEwnRMbbHA
 vlXk+1hZQEGSGDcQ+eTPiOFbNogH7x2Nsfbg+Ps5nYd3naWVHrk8rmcSzvUgwsAHnclk
 CCM6QkDxPLzBBe2jfU3SB4Utl8bwv5YWSKFZettnTTfLU6US09JWOdVci4QjjHQxvJj0
 6oc1qZ4Tr/97aMurS6P9ycLzQxyb6WHTtCTpyCeiO1gpg6T5Wf4bUyDkfHfV+e2S2C61
 uDUvYITeg7POCrvnLhUTS1Z+tG+pzRMwiJMhwR0LdlIDcIzA79nzpPWYR3FupBI0mMJe
 v8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774950; x=1694379750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
 b=LedLD0c0YDw2cUaBP4k9eRhHjUMmAT/18uvQbYFf2b1qHmVdHNE8J0BNCLsHu73fbu
 L9IoKXRoqxOpL8gPWAjGihxCZphoPhaO+hqB0Pf7ARn/S6lmFg1Un6LEErV00DUD/RyD
 tCjZPJnP6IkE5xWKvi47U7Ag+zkjcCHhqR+YIJZpS+iFD+AIHjTERJc7N0Ovs5avCmj2
 6sOo4qXi37JxHNnnNWJCillS1Te34WDXnGeI6jfRBF5mzoXyMPwYx+vytd2z0emlUpw7
 l2ZQmPZZ3gqodGjIROKxCLXErcclPHartCvaP8G68AN/USHGE2vKU0CBBftSV5d0hnhe
 Th0g==
X-Gm-Message-State: AOJu0Yw5mGCl8G/MxLDiwABkMe/ssfsn6RQFIrOuQacDf+aeveFp0nhO
 e7qi7JHI5RTmzbb391W6Xykb1obu1bTsDPiVIOUPgg==
X-Google-Smtp-Source: AGHT+IEIksLV6i1JQnXxmFBaEbAx0vYPQzKu+YxnPk5mSfeHKOjrFxxCLATBwQ5f3mGZqO72LEeDFc4Kwock6sj7f10=
X-Received: by 2002:a25:d20e:0:b0:d74:6cb3:bb77 with SMTP id
 j14-20020a25d20e000000b00d746cb3bb77mr10416043ybg.28.1693774950042; Sun, 03
 Sep 2023 14:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
In-Reply-To: <20230822141735.GA14396@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Sep 2023 00:02:18 +0300
Message-ID: <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 0/3] drm: simplify support for
 transparent DRM bridges
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the patches.
>
> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > similar boilerplate code for such bridges.
>
> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> handled as one, especially if it's completely transparent ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device.
>
> Can't device links help avoiding defer probing in those cases ?

It looks like both Neil and I missed this question.

Two items wrt devlinks. First, I view them as a helper. So if one
disables the devlinks enforcement, he'd still get a deferral loop.

Second, in this case we can not enforce devlinks (or return
-EPROBE_DEFER from the probe() function) because the next bridge is
not yet available when the main driver probes. Unfortunately bridges
are allocated in the opposite order. So, using AUX devices helps us to
break it. Because first typec mux/retimer/switch/etc devices probe (in
the direction from the typec source to the typec port). Then DRM
bridge devices are probed starting from the end of the chain
(connector) to the DP source (root DP bridge/controller).

>
> > Last, but not least, this results in the the internal knowledge of DRM
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Why so ? The PHY subsystem should provide a PHY, without considering
> what subsystem it will be used by. This patch series seems to me to
> actually create this DRM dependency in other subsystems, which I don't
> think is a very good idea. Resources should be registered in their own
> subsystem with the appropriate API, not in a way that is tied to a
> particular consumer.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge. During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> I'm not thrilled :-( Let's discuss the questions above first.

Laurent, please excuse me for the ping. Any further response from your side?
I'd like to send the next iteration of this patchset.

> > Proposed merge strategy: immutable branch with the drm commit, which is
> > then merged into PHY and USB subsystems together with the corresponding
> > patch.


-- 
With best wishes
Dmitry
