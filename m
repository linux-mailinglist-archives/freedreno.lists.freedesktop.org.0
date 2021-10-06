Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69A423DAC
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 14:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C366E4B7;
	Wed,  6 Oct 2021 12:22:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B496E4B7;
 Wed,  6 Oct 2021 12:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6881610A2;
 Wed,  6 Oct 2021 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633522962;
 bh=gtGj1ZK3qFauXUTVt0mwKMorMTrcx2LU7cWdijC2pBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5Y3YD1OS4WWQxkIzADJfP7SsvCxK5JOgkgYUHVE2VqN+sP9dgq0q6aiWTOHuomFQ
 MiiPptBcgS/eqfKoO5jR4CyHpN6BTduD8clzM9aIbpzogi6szC7W3ueUFc8y4aNhDd
 UjqEwIa5klJzAIueWubIVlA/PZ7DE8IiAeaqTAC4TXHOBL2gCT4tBVpKcE5bmOsz8q
 nAH1+zKCw88kNy6nl9FRGBMvkDPcAI8MYmogzAPUO2kyaR8Ac2c08nhxgCV7/DM5KX
 UCYuo1F2b3Mt9k2o6tZ/0DK5FKDkfMNVhWnzCmI9QCXwYiba0rDWfCwQjMDGgV5zYO
 ao2y896JArvJQ==
Date: Wed, 6 Oct 2021 17:52:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <YV2VDtYMhPJgTXoQ@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-8-vkoul@kernel.org>
 <cd5d1e1fb3a8ce1a9970c29a39df1b4b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5d1e1fb3a8ce1a9970c29a39df1b4b@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 07/11] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
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

On 02-08-21, 17:24, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:
> > We cannot enable mode_3d when we are using the DSC. So pass
> > configuration to detect DSC is enabled and not enable mode_3d
> > when we are using DSC
> > 
> > We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
> > enabled and pass this to .setup_intf_cfg()
> > 
> This is not entirely correct. This is true only for the 2-2-1 topology you
> are using
> on this panel.
> 
> When you are using 2-2-1, you are using 2 LMs, 2 DSCs and 1 DSI.
> So 3D mux shouldnt be used.
> 
> If you are using something like 4-2-1 or 4-2-2, then you have 4LMs,
> 2 DSCs and 2/1 DSI.
> 
> Here you need the 3D mux to convert the data from 4LMs to 2 DSCs.
> 
> So please correct the commit text here and also add a check for the
> topology.

Ack, we should mention this and modify it in future when more topology
support is added.

-- 
~Vinod
