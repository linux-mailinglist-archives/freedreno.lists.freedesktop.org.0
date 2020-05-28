Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49041E5B4C
	for <lists+freedreno@lfdr.de>; Thu, 28 May 2020 10:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817A96E0EB;
	Thu, 28 May 2020 08:58:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE76E0EB
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 08:58:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590656292; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TNqDL40LlCjpsjbz12NhEYJJSkincfYBy8FmVcop5ek=;
 b=XfhcVP8Km0uehIjZq1qLwn6YLrt3Nk3TiEn50VdTgbSJynfpIftIvoeidmmeBEAXdJ/V8m92
 gRtQozPfq4DVDFumNLsfBxGu4lvr0nh68BXlsPUkAL5CJGJVJEB03Ps1DHc3CyxwUESJNmC7
 urx0T6XQm0rb9OhZHpMa4oGWPGI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ecf7d1fb4f0a9ae2230316c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 08:58:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7E0FAC43387; Thu, 28 May 2020 08:58:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D3E5C433C6;
 Thu, 28 May 2020 08:58:07 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 May 2020 14:28:06 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
In-Reply-To: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
References: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
Message-ID: <219625b5b2cc0eddb2e975d457a2c40d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [v1] drm/msm: add shutdown support for display
 platform_driver
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
Cc: devicetree@vger.kernel.org, devicetree-owner@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, mka@chromium.org, robin.murphy@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Krishna,

On 2020-05-28 14:08, Krishna Manikandan wrote:
> Define shutdown callback for display drm driver,
> so as to disable all the CRTCS when shutdown
> notification is received by the driver.
> 

Would be nice to add some more context for adding this shutdown callback
something like below:

If the hardware is still accessing memory after SMMU translation is 
disabled
as part of smmu shutdown callback,  then the IOVAs(I/O virtual address) 
which
it was using will go on the bus as the physical addresses which will 
result
in unknown crashes (NoC/interconnect errors on QCOM SoCs).

PS: Credits for description: Robin Murphy

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
