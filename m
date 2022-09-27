Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938B5EBB57
	for <lists+freedreno@lfdr.de>; Tue, 27 Sep 2022 09:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7166010E8C9;
	Tue, 27 Sep 2022 07:16:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C65710E2CD;
 Tue, 27 Sep 2022 07:16:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B35EE61628;
 Tue, 27 Sep 2022 07:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8ACC433D6;
 Tue, 27 Sep 2022 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664262962;
 bh=2rBhUwN8aOjx4dsbrO7nxEdpmx2ukolgAtSl/fXvzfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jU3TtDbLbimU5uWXGZkS3IneVkExqfjI5gn5BS8buZA27w4ha96ISHEyyxJzF8m/a
 AltVPvIt8pDCYSmvzLwEaNJB7OMiXqrp93Eyd/m0AM2TDqM4S6W7bfacd/3ga3RPi/
 Wqk8F+Qr97nefIOlnAAaQRoESdl1DnW7PFzTHF3qaXSOaLuXDTRw8esMhwB20L4pY7
 40gXeg6f15RWtM0eYaBeYSrwSNCtmx9I9rsul62ISb7ms7ZNqULW0ZBT99qr62E5tc
 0w4d8szuSurKtE1pS+AVQyDDHK4WbJ/PalTDe2K4crYkqCWr7AhK7VKP7+nKSs8I6h
 /bD4Qu/+Uts8w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1od4p6-0005H7-10; Tue, 27 Sep 2022 09:16:08 +0200
Date: Tue, 27 Sep 2022 09:16:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <YzKjODjbQMx/hEk1@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-11-johan+linaro@kernel.org>
 <dc33f8c9-761a-deec-d1e5-ea30c4120729@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc33f8c9-761a-deec-d1e5-ea30c4120729@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 10/10] drm/msm/dsi: drop modeset sanity
 checks
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 11:21:38AM -0700, Abhinav Kumar wrote:
> 
> 
> On 9/13/2022 1:53 AM, Johan Hovold wrote:
> > Drop the overly defensive modeset sanity checks of function parameters
> > which have already been checked or used by the callers.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> The change LGTM, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> I think we can use below fixes tag so that we can pick up this entire 
> series for the fixes cycle.
> 
> Fixes: 3f0689e66352 ("drm/msm/dsi: check msm_dsi and dsi pointers before
> use")

Same here. I wouldn't add a Fixes tag unless required by some DRM
process.

Johan
