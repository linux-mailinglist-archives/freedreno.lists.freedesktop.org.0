Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B45A9300
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 11:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F8810E665;
	Thu,  1 Sep 2022 09:20:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12CC10E665;
 Thu,  1 Sep 2022 09:20:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3D6061994;
 Thu,  1 Sep 2022 09:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB8BC4347C;
 Thu,  1 Sep 2022 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662024008;
 bh=EWqzcyYFAAZgRuUDRZ4hmWQW7ga969a7SKJ0NU4vaig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LCg8ESXJFXk6FSWXh23YIeMZMMdafEZmH5ceI5fvAJULr8fBzAEo93FBV4jL/QSLo
 zyZT7MvpuAtmdkdgR8I7Hl1a+IEmeBXTAB5SEHhxi7STHwD6PBquNfz5Y5qvhR4Ll/
 XWMFAvutHjbj5P/AupdVhgqnTnALt6bsrB/X8ZL/sqPaQRAzXB69sw2j3AdnRR+4Lf
 6ITCrgerelEltpf1g2D0xpEVVo3jXY2DLklvjEG2zY7FupceQnuYHDIr7j1QJGP6za
 ipDj4rr7/P8VihQbE+s2p4+pM8c2yAUdki4XKb1x8T1ICBnbKdJhKViphsTR//oAO9
 9alvZCVsF3svA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oTgMp-0006Zq-W7; Thu, 01 Sep 2022 11:20:08 +0200
Date: Thu, 1 Sep 2022 11:20:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [RFC PATCH 0/3] drm/msm/dp: several fixes for the
 IRQ handling
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.

Please try to reproduce the issue yourself before posting untested RFCs.
We're all short on time. 

Johan
