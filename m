Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1AE809DFF
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 09:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC5110E25A;
	Fri,  8 Dec 2023 08:18:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0CF10E25A
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 08:18:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 34A1961FA2;
 Fri,  8 Dec 2023 08:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8FEC433C7;
 Fri,  8 Dec 2023 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702023514;
 bh=85cnqYAPP8hKzPB4QuuMegY8qDFlijd/F4k4kPybf3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tm2W3sFTrdPwgFXfQ0kjCMqNCQivTotVWHI8wacQElTC6famiPCWqVVWsk7bln4vp
 tUL7BJzSCSqgK444YJtm50jydcW0s13t8tAhLD7DDXAQFjlBArujRsBSrzFlNjBcM4
 5+ZCLAc3hCHUkVhC7KHLOh43Jc+k97r71e3aR+cF4P7oV3kRhd+Hq/+XLzx+49T9Cz
 vT5sJSQNI9qoVQSUlcD0ky8FqwYNpbFZ56uVbZ9k24humMK4PCDGc8/03fI3di/E8C
 N+mLtBN4kt/YNG/89mmkzzMhuBPMPUDei6bILv7l2gfKwvYuHn1l0O8a+R8y3rpjnZ
 3+u4Vx4cimnZA==
Received: from johan by xi.lan with local (Exim 4.96.2)
 (envelope-from <johan@kernel.org>) id 1rBW4y-0001eK-11;
 Fri, 08 Dec 2023 09:19:24 +0100
Date: Fri, 8 Dec 2023 09:19:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add missing GMU entry to match table
Message-ID: <ZXLRjDZn9bgiREPf@hovoldconsulting.com>
References: <20231207212441.6199-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207212441.6199-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Richard Acayan <mailingradian@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux-foundation.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:24:39PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We also want the default domain for the GMU to be an identy domain,
> so it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached
> to both cbndx 1 and cbndx 2.  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.

This sounds like something that should be backported. Should you add a
Fixes and CC-stable tag?
 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Johan
