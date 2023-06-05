Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C5572233E
	for <lists+freedreno@lfdr.de>; Mon,  5 Jun 2023 12:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EB110E1C0;
	Mon,  5 Jun 2023 10:18:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F7E10E1C0;
 Mon,  5 Jun 2023 10:18:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFD75612AC;
 Mon,  5 Jun 2023 10:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688EC433D2;
 Mon,  5 Jun 2023 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685960316;
 bh=Hq8WndsreVnOiOjWNynVMw7xnDT/MtLrF7deKaysJyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQLZ2VOLsMuWSk++nBuN3rvjtATWL1sX0YGhAbM+V5HxQYe1amB08X1j9iqJxe7dr
 Y9pTagR5YP1J3TRQd+RTL3sfcoD64Tvi0yftaUlrEIzIuKHAhdcjWFl1xacDxw28w4
 auoGQnW9QZZzfQyrEiGgRKNRCpbpk/fy2mJ6y1dcQd0JD+UdIa2u2P3LsmTZMNZ5Kd
 QMF0fMMQiLnYF/i/MD1ytI/U0IgVOgU6VSbThlwv9Ag/30ezJZpu8L/qDUkHUj7MH9
 aBXAxCwBvotTh1AUffkttQmmAAmBRa8IHgPeGYQJDTPmDHj3esC37gMv0hoCsVGHfv
 uyp1cE8FRS6KA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q67Ia-0005sI-Uo; Mon, 05 Jun 2023 12:18:53 +0200
Date: Mon, 5 Jun 2023 12:18:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
References: <20230523151646.28366-1-johan+linaro@kernel.org>
 <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
 <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: set self refresh aware
 based on PSR support"
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, regressions@lists.linux.dev,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 01:05:36PM +0300, Dmitry Baryshkov wrote:
> On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:

> > Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
> > X13s two weeks after I reported this, and there has been no indication
> > of any progress in the other related thread:
> >
> >         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
> >
> > Seems like it is time to merge this revert to get this sorted.
> >
> > Rob, Abhinav, Dmitry, can either of you merge this one and get it into
> > 6.4-rc6?
> 
> Rob sent the pull request few hours ago, see
> https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/

Ok, so you guys went with the module parameter hack. Whatever. As long
as the regression is finally fixed.

Next time, some visibility into your process would be appreciated to
avoid unnecessary work.

Johan
