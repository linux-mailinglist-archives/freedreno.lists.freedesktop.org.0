Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A8AA5DD2F
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 13:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C2810E790;
	Wed, 12 Mar 2025 12:57:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C03410E070
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 12:57:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50335152B;
 Wed, 12 Mar 2025 05:58:00 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781983F694;
 Wed, 12 Mar 2025 05:57:15 -0700 (PDT)
Message-ID: <44d516b5-5e1f-4b50-b65c-0ed596639fd0@arm.com>
Date: Wed, 12 Mar 2025 12:57:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
To: Rob Clark <robdclark@gmail.com>, Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
 <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
 <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/03/2025 8:00 pm, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 12:42 PM Connor Abbott <cwabbott0@gmail.com> wrote:
>>
>> On Tue, Mar 11, 2025 at 2:08 PM Will Deacon <will@kernel.org> wrote:
>>>
>>> On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
>>>> In some cases drm/msm has to resume a stalled transaction directly in
>>>> its fault handler. Experimentally this doesn't work on SMMU500 if the
>>>> fault hasn't already been acknowledged by clearing FSR. Rather than
>>>> trying to clear FSR in msm's fault handler and implementing a
>>>> tricky handshake to avoid accidentally clearing FSR twice, we want to
>>>> clear FSR before calling the fault handlers, but this means that the
>>>> contents of registers can change underneath us in the fault handler and
>>>> msm currently uses a private function to read the register contents for
>>>> its own purposes in its fault handler, such as using the
>>>> implementation-defined FSYNR1 to determine which block caused the fault.
>>>> Fix this by making msm use the register values already read by arm-smmu
>>>> itself before clearing FSR rather than messing around with reading
>>>> registers directly.
>>>>
>>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>>> ---
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>>>>   3 files changed, 27 insertions(+), 27 deletions(-)
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>>>>        ARM_SMMU_DOMAIN_NESTED,
>>>>   };
>>>>
>>>> +struct arm_smmu_context_fault_info {
>>>> +     unsigned long iova;
>>>> +     u64 ttbr0;
>>>> +     u32 fsr;
>>>> +     u32 fsynr0;
>>>> +     u32 fsynr1;
>>>> +     u32 cbfrsynra;
>>>> +     u32 contextidr;
>>>> +};
>>>> +
>>>>   struct arm_smmu_domain {
>>>>        struct arm_smmu_device          *smmu;
>>>>        struct io_pgtable_ops           *pgtbl_ops;
>>>> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>>>>        const struct iommu_flush_ops    *flush_ops;
>>>>        struct arm_smmu_cfg             cfg;
>>>>        enum arm_smmu_domain_stage      stage;
>>>> +     struct arm_smmu_context_fault_info cfi;
>>>
>>> Does this mean we have to serialise all faults for a given domain? That
>>> can't be right...
>>>
>>> Will
>>
>> They are already serialized? There's only one of each register per
>> context bank, so you can only have one context fault at a time per
>> context bank, and AFAIK a context bank is 1:1 with a domain. Also this
>> struct is only written and then read inside the context bank's
>> interrupt handler, and you can only have one interrupt at a time, no?
>>
>> Connor
> 
> And if it was a race condition with cfi getting overridden, it would
> have already been an equivalent race condition currently when reading
> the values from registers (ie. the register values could have changed
> in the elapsed time)
> 
> So no additional serialization needed here.

Agreed, the only subtlety is the other side of things is true as well - 
i.e. cfi is only valid and stable between the IRQ being fired and 
CBn_RESUME being written, so actually it *mustn't* be touched by 
anything outside the fault handling path.

Thanks,
Robin.
