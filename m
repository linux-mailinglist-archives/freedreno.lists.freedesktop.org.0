Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61D273ACA
	for <lists+freedreno@lfdr.de>; Tue, 22 Sep 2020 08:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646096E0AF;
	Tue, 22 Sep 2020 06:23:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1DA6E0AF
 for <freedreno@lists.freedesktop.org>; Tue, 22 Sep 2020 06:23:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600755836; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0qOdr4a6KdsBlo9u+BzInNEOsqWqmni1tOXn1Md3388=;
 b=dZWLCDNBjAWKrqHH43k//MY11Y5LsousshF/0GPlnn1IcD2JQhvNCT3gFn224rChMYU98U1/
 AJ2EEZ5hxh8VdAAIOss2d2nzGwSypwHHTZjpiFckShgb0tI8BuN8mrnXlQ9MlFpJVkC+jr87
 jEHNEWbNnvmZLnzZ+BZv/EkYN1Y=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f69987caac0601354098780 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 06:23:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F387C4339C; Tue, 22 Sep 2020 06:23:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AF46FC433CA;
 Tue, 22 Sep 2020 06:23:55 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Sep 2020 11:53:55 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
In-Reply-To: <20200921180318.GG3141@willie-the-truck>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <3b1beb6cf6a34a44b0ecff9ec5a2105b5ff91bd4.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <20200921180318.GG3141@willie-the-truck>
Message-ID: <f3d9c7bc63eae6edfce5b3507413a51b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCHv4 1/6] iommu/io-pgtable-arm: Add support to
 use system cache
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Will,

On 2020-09-21 23:33, Will Deacon wrote:
> On Fri, Sep 11, 2020 at 07:57:18PM +0530, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
>> attributes set in TCR for the page table walker when
>> using system cache.
> 
> I wonder if the panfrost folks can reuse this for the issue discussed
> over at:
> 
> https://lore.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
> 
> However, Sai, your email setup went wrong when you posted this so you
> probably need to repost now that you have that fixed.
> 

I have sent a v5 [1] now since I had to drop cleanup of blank lines
as Robin said it was intentional and also had to rebase over new
gpu changes since it moves pretty fast.

[1] https://lore.kernel.org/patchwork/cover/1310000/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
