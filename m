Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8527423E06
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 14:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBF76E49D;
	Wed,  6 Oct 2021 12:47:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963E6E49D;
 Wed,  6 Oct 2021 12:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF58660F59;
 Wed,  6 Oct 2021 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633524456;
 bh=tTQVklaQ/ldVLqaoEK1050e3eup4oM5ED69uVhqEmSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kl7HkcYSlA5eh1NwBNeZasuALZA6nFX5EtgDlzo5SclCOpq0vmtzwzBYscFYfkHBD
 1UxWTCmLKoO1hrWIy05JfryPwMBkltkYgu/kCXSP705D+h8CgetgOmyfKQiZAKfBDs
 +osIlln5+g87KtAF8PpBBstrU20CWwzZ6U1cEomEj0I7Jz5P0OvoONsTHcPbadcPof
 qa8ia7v1UYz7rJVZ/jMGvbPCkv32B7fLDl1I7rjVeT4U1POqWUen5UEgbKKFUCEJ2E
 B5HxRQxyLXdvr6yPrC/oPtHb3QKTH+tER39egWbeojdfWs9FaeM2Rduy0n/d/c+2Sq
 Q5WJm/ErR7ATw==
Date: Wed, 6 Oct 2021 18:17:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <YV2a5MzDUWMTotpP@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-9-vkoul@kernel.org>
 <70d5abae07b4dbf63d8dbf47ba31262d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d5abae07b4dbf63d8dbf47ba31262d@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/disp/dpu1: Add support for
 DSC in encoder
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

On 02-08-21, 17:57, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:52, Vinod Koul wrote:
> > When DSC is enabled in DT, we need to configure the encoder for DSC
> > configuration, calculate DSC parameters for the given timing.
> > 
> > This patch adds that support by adding dpu_encoder_prep_dsc() which is
> > invoked when DSC is enabled in DT
> correct me if wrong but this commit text is not valid anymore in my opinion.
> are there any params you are getting from DT now? I thought its all coming
> from the panel
> driver directly.

Yes thanks for spotting this, updated!

> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> agree with dmitry's comment's
> https://patchwork.freedesktop.org/patch/444078/?series=90413&rev=2
> 
> instead of dsc being part of priv->dsc it should be per encoder.
> 
> On top of his comment, I also think that like on the newer chipsets, moving
> the dsc related
> encoder configuration to a dpu_encoder_dce.c will help for future expansion
> of other topologies
> and also for other compression algorithms.

As replied to Dimitry, the DP and other topology support needs to be
comprehended so this should be done when we know how DP, other
compression algorithms and other topologies would be modeled here :)

-- 
~Vinod
