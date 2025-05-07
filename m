Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A32AAE3F0
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 17:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E34F10E1C8;
	Wed,  7 May 2025 15:09:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED36D10E819
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 15:09:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47416339;
 Wed,  7 May 2025 08:09:45 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAD23F778;
 Wed,  7 May 2025 08:09:48 -0700 (PDT)
Message-ID: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
Date: Wed, 7 May 2025 16:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507144038.GC33739@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> In situations where mapping/unmapping sequence can be controlled by
>> userspace, attempting to map over a region that has not yet been
>> unmapped is an error.  But not something that should spam dmesg.
>>
>> Now that there is a quirk, we can also drop the selftest_running
>> flag, and use the quirk instead for selftests.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Sending v2 stand-alone, since I'm not quite ready to send a new
>> iteration of the full VM_BIND series.  And with selftest_running
>> removed, I think this patch stands on it's own.  (And maybe there
>> is still time to sneak this in for v6.16, removing an iommu dep
>> for the VM_BIND series in v6.17?)
> 
> You should just remove the warn on completely, no other driver does this.

What do you mean "no other driver"?

 From a quick look, these IOMMU drivers have some sort of visible 
warning related to the state of an existing PTE during map/unmap:

apple-dart
arm-smmu
arm-smmu-v3
arm-smmu-qcom
exynos-iommu
ipmmu_vmsa
msm_iommu
mtk_iommu
rockchip-iommu
s390-iommu
sun50i-iommu
qcom_iommu

while these IOMMU drivers do not:

amd
intel
mtk_iommu_v1
omap-iommu
riscv
sprd-iommu
tegra-smmu
virtio-iommu

By driver count, warning is literally the majority behaviour :/

Thanks,
Robin.
