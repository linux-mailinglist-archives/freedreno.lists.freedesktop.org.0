Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7FA243AB2
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 15:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C1F6E9EA;
	Thu, 13 Aug 2020 13:19:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8076E9E5;
 Thu, 13 Aug 2020 13:19:43 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D15620774;
 Thu, 13 Aug 2020 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597324782;
 bh=SknD/q4aQWNYq5Nk/fIPKkA97wOWHoR/XOtsWCarsUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KyQtPDjjhE0RUI+jOnEFEBNw/+u3ZIzQvrcfs2bqJcSclzMEqquyp5iHRtp1RNgLN
 0GHvoyF53tu5IMoeKYfshHf8pzTzkTlYFu4UrJiZttWR4h8heT83viHSVM3LlABhmz
 fUatW3ekpHN47Oz+hbzPT5iwPkIrwjnHUHdfpCyU=
Date: Thu, 13 Aug 2020 14:19:33 +0100
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200813131933.GC10256@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v12 00/13] iommu/arm-smmu: Add Adreno SMMU
 specific implementation
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Hanna Hawa <hannah@marvell.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robdclark@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Pritesh Raithatha <praithatha@nvidia.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawn.guo@linaro.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 04:26:44PM -0600, Jordan Crouse wrote:
> This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
> pagetable switching.
> 
> The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
> runtime to allow each individual instance or application to have its own
> pagetable.  In order to take advantage of the HW capabilities there are certain
> requirements needed of the SMMU hardware.

"capabilities" is a polite way of putting it ;)

Anyway, modulo two design comments, I think this is about as nice as we're
going to get this. Thanks for persevering, and sorry that you have to deal
with such dreadful hardware.

Hopefully the next version will be the one, although I'd like Robin to take
a quick look as well if he gets a chance.

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
