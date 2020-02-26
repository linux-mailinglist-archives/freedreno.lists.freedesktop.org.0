Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871416FD44
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2020 12:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096F76E270;
	Wed, 26 Feb 2020 11:17:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF926E270
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2020 11:17:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582715845; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JeLBIZJhvP42B2sTx6JhqGirHZU0I0l6TtJa1fPw4Ic=;
 b=KtYqGZ7TYDFP6eMl+K4LgEkytwfV123Ff/CMzugxjS3ZS2n+nURlJ43iABENLH4XgOw/w1Ly
 FOL1gZNqGJ8LyKI8wRp8KKqyx2UcxEkKo2TpM33RRYVEFptsnTc67y8RKKX+RibfcH2O3csQ
 TzThfZ4/UBkywWRfDO/788e8Yis=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5653ba.7f950ca76228-smtp-out-n01;
 Wed, 26 Feb 2020 11:17:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1307EC447A0; Wed, 26 Feb 2020 11:17:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.67.17]
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C585C43383;
 Wed, 26 Feb 2020 11:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C585C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
To: Rob Herring <robh@kernel.org>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220203509.GA14697@bogus>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <6a7c1f39-a85f-4a99-fed3-71001bdb6128@codeaurora.org>
Date: Wed, 26 Feb 2020 16:47:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220203509.GA14697@bogus>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] dt-bindings: arm-smmu: update the list of
 clocks
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, bjorn.andersson@linaro.org, mka@chromium.org,
 dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 2/21/2020 2:05 AM, Rob Herring wrote:
> On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
>> This patch adds a clock definition needed for powering on the GPU TBUs
>> and the GPU TCU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short
>
> See https://patchwork.ozlabs.org/patch/1241297
> Please check and re-submit.
Hi Rob, These issues seem to be from the original code and not related 
to my patch. Are these going to be blocking errors?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
