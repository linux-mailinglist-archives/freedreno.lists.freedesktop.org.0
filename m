Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5E9F7AFA
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 13:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6465110ECF8;
	Thu, 19 Dec 2024 12:08:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24A8710ECFC
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 12:08:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6FD1477;
 Thu, 19 Dec 2024 04:09:15 -0800 (PST)
Received: from [10.57.1.39] (unknown [10.57.1.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDD43F720;
 Thu, 19 Dec 2024 04:08:45 -0800 (PST)
Message-ID: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
Date: Thu, 19 Dec 2024 12:08:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241216171017.4881-1-robdclark@gmail.com>
 <20241219113019.GA23640@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219113019.GA23640@willie-the-truck>
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

On 2024-12-19 11:30 am, Will Deacon wrote:
> On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> On mmu-500, stall-on-fault seems to stall all context banks, causing the
>> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> MMU-500 has public documentation so please can you dig up what the
> actual behaviour is rather than guess?

Yeah, I'm pretty sure that's not true as stated, especially with 
SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is 
plausible that at the system interconnect level, a sufficient number of 
stalled transactions might backpressure other transactions from entering 
the same TBU, even if they are destined for a different context. That's 
more about the configuration and integration of individual SoCs than the 
SMMU IP used.

Robin.

>> This fixes an issue with an older mesa bug taking outo the system
>> because of GMU going off into the year.
> 
> Sorry, but I don't understand this sentence.
> 
> Will

