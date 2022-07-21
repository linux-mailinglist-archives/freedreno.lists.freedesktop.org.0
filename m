Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E475257CBD3
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 15:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730EB12A272;
	Thu, 21 Jul 2022 13:25:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52D12A220
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 13:25:45 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id y18so1124651qvo.11
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGrBLaNIprWPnLASVzucMIdeH8IwcuTiWBUYmrgNEq4=;
 b=blMArCRIQqdXMvhhNuLcI+8rbpoj3mba+jisYAjiGNck3+Yrkpitf3sBSMLXU0MYu1
 JnGMr7qaUuib3O0fPQMF23cjXCfaiwVbi8pH05GUO0+w3HJy0f70v+OYZCWvTWwruCT8
 cbkbGErUBDDfm6CgzF82H+OS71moycWT9T1MrNyE6JMJin9EyL/oDIhMYC8VeTuAqsB7
 8MOJpuVrOi6hrwjiCJA/evwd6WfNyNw6tVB7TdBfikLUxjzFRU02ArPAu7usZ3LWLAcG
 pD0qfxC8x7dPyqMwAfo1On3QDv2/kl81p3iLk1f2deY53RKZHwV26qUBXuOVQEAkIYrk
 EORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGrBLaNIprWPnLASVzucMIdeH8IwcuTiWBUYmrgNEq4=;
 b=hPftVlO8bP32hFAvmRGrXUByxhakFPScB7evlPPhfyiYd/17KEU5VWQfNI8jNy9LZK
 6Wc3nH6EHN4OFBnzpU8XuXYV0pFv0h6He0vwZAEXKsc9AEq79o3zdqVUfRnewlYY/9no
 Gn6r6qnMoqV+1SmeaNmqXdv5e3enLNbv9qYwLir1B9isifBxtl7ZeL/qL2y2Fo/9Gb7A
 rSaRtKMgOPhmMdq6gd+gfrdtRMqm+eP1TQ6VVVgrikVmsPcudc/wLEGUD031hU8sIuSU
 yT2lsgm+Hig1LFwjxvtDjT5FjXPQ8ODFclUcjKY2kqixYg2CTFEDg/Wzxui7ISIxsY5p
 0w8A==
X-Gm-Message-State: AJIora9k5AkxOsq2jFEOlBz24kzCU7yl/nMeUdyieaIF0OsbprnWaPpU
 XqCj68dPzo8FY+YN5pX2jLibfCmFNg+ZVtKhV6Vamg==
X-Google-Smtp-Source: AGRyM1t+UP7BoSoJdJI25zgNAHeecjAWzPFa9Wrm9U9VbpfVkvmZ3snud9x2l21so/p6slH37Gs7Pze5kD1tVod2jvY=
X-Received: by 2002:ad4:5761:0:b0:473:7861:69d1 with SMTP id
 r1-20020ad45761000000b00473786169d1mr34026860qvx.73.1658409944065; Thu, 21
 Jul 2022 06:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
In-Reply-To: <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Jul 2022 16:25:32 +0300
Message-ID: <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v16 0/3] eDP/DP Phy vdda realted function
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
Cc: quic_sbillaka@quicinc.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 quic_aravindh@quicinc.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 sean@poorly.run, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, daniel@ffwll.ch, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 21 Jul 2022 at 13:31, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 05, 2022 at 09:29:13AM -0700, Kuogee Hsieh wrote:
> > 0) rebase on https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tree
> > 1) add regulator_set_load() to eDP phy
> > 2) add regulator_set_load() to DP phy
> > 3) remove vdda related function out of eDP/DP controller
> >
> > Kuogee Hsieh (3):
> >   phy: qcom-edp: add regulator_set_load to edp phy
> >   phy: qcom-qmp: add regulator_set_load to dp phy
> >   drm/msm/dp: delete vdda regulator related functions from eDP/DP
> >     controller
> >
> >  drivers/gpu/drm/msm/dp/dp_parser.c        | 14 -----
> >  drivers/gpu/drm/msm/dp/dp_parser.h        |  8 ---
> >  drivers/gpu/drm/msm/dp/dp_power.c         | 95 +------------------------------
> >  drivers/phy/qualcomm/phy-qcom-edp.c       | 12 ++++
> >  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 41 ++++++++++---
> >  5 files changed, 46 insertions(+), 124 deletions(-)
>
> This series breaks USB and PCIe for some SC8280XP and SA540P machines
> where the DP PHY regulators are shared with other PHYs whose drivers do
> not request a load.

I'm trying to understand, why does this series cause the regression.
Previously it would be the DP controller voting on the regulators
load, now it has been moved to the DP/eDP PHYs.

> Specifically, the hard-coded vdda-phy load of 21.8 mA added by this
> series, causes several RPMh regulators to now be put in low-power mode.
>
> I found Doug's suggestion to handle situations like this in regulator
> core:
>
>         https://lore.kernel.org/all/20180814170617.100087-1-dianders@chromium.org/
>
> but since that was rejected, how do we deal with this generally?
>
> In the above thread Doug mentioned adding support for load requests to
> further drivers and Bjorn mentioned working around it by adding
> regulator-system-load properties to DT.
>
> It seems quite likely that changes like this one affects other systems
> too, and the effects may be hard to debug. So a more general solution
> than playing whack-a-mole using DT would be good to have.

I think enabling a regulator which supports set_load() and without
load being set should cause a warning, at least with
CONFIG_REGULATOR_DEBUG. WDYT?

-- 
With best wishes
Dmitry
