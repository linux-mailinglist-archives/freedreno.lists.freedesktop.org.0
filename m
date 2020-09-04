Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E904925D479
	for <lists+freedreno@lfdr.de>; Fri,  4 Sep 2020 11:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0B6EB2E;
	Fri,  4 Sep 2020 09:17:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Fri, 04 Sep 2020 09:17:34 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB91D6EB31;
 Fri,  4 Sep 2020 09:17:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4466F3D5; Fri,  4 Sep 2020 11:11:19 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:11:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200904091117.GH6714@8bytes.org>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process
 GPU pgtables
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Hanna Hawa <hannah@marvell.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Sam Ravnborg <sam@ravnborg.org>,
 Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sibi Sankar <sibis@codeaurora.org>, Thierry Reding <treding@nvidia.com>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, Stephen Boyd <swboyd@chromium.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krishna Reddy <vdumpa@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Shawn Guo <shawn.guo@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 03:01:25PM -0700, Rob Clark wrote:
> Jordan Crouse (12):
>   iommu/arm-smmu: Pass io-pgtable config to implementation specific
>     function
>   iommu/arm-smmu: Add support for split pagetables
>   iommu/arm-smmu: Prepare for the adreno-smmu implementation
>   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   drm/msm: Add a context pointer to the submitqueue
>   drm/msm: Drop context arg to gpu->submit()
>   drm/msm: Set the global virtual address range from the IOMMU domain
>   drm/msm: Add support to create a local pagetable
>   drm/msm: Add support for private address space instances
>   drm/msm/a6xx: Add support for per-instance pagetables
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
> Rob Clark (8):
>   drm/msm: remove dangling submitqueue references
>   iommu: add private interface for adreno-smmu
>   drm/msm/gpu: add dev_to_gpu() helper
>   drm/msm: set adreno_smmu as gpu's drvdata
>   iommu/arm-smmu: constify some helpers
>   arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
>   iommu/arm-smmu: add a way for implementations to influence SCTLR
>   drm/msm: show process names in gem_describe

Can the DRM parts be merged independently from the IOMMU parts or does
this need to be queued together? If it needs to be together I defer the
decission to Will through which tree this should go.


	Joerg
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
