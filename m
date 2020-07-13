Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FC21E063
	for <lists+freedreno@lfdr.de>; Mon, 13 Jul 2020 21:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF58908E;
	Mon, 13 Jul 2020 19:03:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B024D8908E
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 19:03:37 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 546AB2076D;
 Mon, 13 Jul 2020 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594667017;
 bh=ERBn/pr30RWxSObAL8l85+l8FNMMvON1Mype8up0/AU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ZRkkfyHleaBZp0Vfs5JuTH7gBkWzJb7TMWx0WfrKq+JjCqOf1Cx7Ql0CUe4pWmfLI
 1kkyv0RegppAo0t0BoBRlbfvvgEAp01WhxSclT1eANlzJBCgTY/hSn6fOeJh7PLkN5
 PGkqMoZ8H4S5VF0WBd+pUcrT6irlu//cQU3Ak/MI=
Date: Mon, 13 Jul 2020 20:03:32 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20200713190331.GA3444@willie-the-truck>
References: <20200611223656.4724-1-jcrouse@codeaurora.org>
 <20200713151123.GB3072@willie-the-truck>
 <20200713170032.GH21059@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713170032.GH21059@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH] iommu/arm-smmu: Add a init_context_bank
 implementation hook
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 11:00:32AM -0600, Jordan Crouse wrote:
> On Mon, Jul 13, 2020 at 04:11:23PM +0100, Will Deacon wrote:
> > On Thu, Jun 11, 2020 at 04:36:56PM -0600, Jordan Crouse wrote:
> > > Add a new implementation hook to allow the implementation specific code
> > > to tweek the context bank configuration just before it gets written.
> > > The first user will be the Adreno GPU implementation to turn on
> > > SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
> > > transactions. Doing so could hang the GPU if one of the terminated
> > > transactions is a CP read.
> > > 
> > > This depends on the arm-smmu adreno SMMU implementation [1].
> > > 
> > > [1] https://patchwork.kernel.org/patch/11600943/
> > > 
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > > 
> > >  drivers/iommu/arm-smmu-qcom.c | 13 +++++++++++++
> > >  drivers/iommu/arm-smmu.c      | 28 +++++++++++++---------------
> > >  drivers/iommu/arm-smmu.h      | 11 +++++++++++
> > >  3 files changed, 37 insertions(+), 15 deletions(-)
> > 
> > This looks straightforward enough, but I don't want to merge this without
> > a user and Sai's series has open questions afaict.
> 
> Not sure what you mean by a user in this context?
> Are you referring to https://patchwork.kernel.org/patch/11628541/?

Right, this post was just a single patch in isolation, whereas it was
reposted over at:

https://lore.kernel.org/r/cdcc6a1c95a84e774790389dc8b3b7feeee490dc.1593344119.git.saiprakash.ranjan@codeaurora.org

so I'll ignore this one. Sorry, I'm just really struggling to keep track
of what is targetting 5.9, and I don't have tonnes of time to sift through
the backlog of duplicate postings :(

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
