Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA093165907
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2020 09:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9378789932;
	Thu, 20 Feb 2020 08:21:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D4E6E42E
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 08:21:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582186889; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aS4q7m+l6u86tFZHKQJn03pGD9rpfrnXXM1l29HIlXE=;
 b=BEaW8O6rVczEylDX5spSgTZQ4tCNR6VUdch0HYyRGkMCfCISxsZkinnUrsS9adxXXYMZjOvp
 O4zzOGqGaKtVMDgwFTDO8hAVS3RzhHEFbbmzrDe/OcCJrIdmV6ETjyS9ZIUIlwvXeEYDn6hH
 sd0MTHeTGbYbPXPQoAzFO9OiHhk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e4181.7f109b8456c0-smtp-out-n02;
 Thu, 20 Feb 2020 08:21:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8753C4479F; Thu, 20 Feb 2020 08:21:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [123.201.165.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A68CDC43383;
 Thu, 20 Feb 2020 08:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A68CDC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
References: <1581320465-15854-1-git-send-email-smasetty@codeaurora.org>
 <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <db3cca19-d40d-b1d8-0260-09463d4b9a1b@codeaurora.org>
Date: Thu, 20 Feb 2020 13:50:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v6] arm64: dts: qcom: sc7180: Add A618 gpu
 dt blob
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 2/11/2020 2:51 AM, Doug Anderson wrote:
> Hi,
>
> On Sun, Feb 9, 2020 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>> This patch adds the required dt nodes and properties
>> to enabled A618 GPU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> In v4 I added my tags [1].  Please keep them for future patches unless
> something major changes.  AKA:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 102 insertions(+)
> Just to summarize where we are:
>
> * As per my notes in v3 and v4 [1], this can't land until
> "mem_iface_clk" is in the bindings.  Please post a patch for this and
> reply with a link here so others can follow the disucssion.
I posted a patch for this @https://patchwork.freedesktop.org/patch/354130/
>
> * This also can't land until the gpucc bindings change from Taniya
> recently [2] lands.
>
> ...so we're in limbo waiting for the bindings to be resolved, but
> otherwise this patch looks good.
>
>
> [1] https://lore.kernel.org/r/CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com
> [2] https://lore.kernel.org/r/1581307266-26989-1-git-send-email-tdas@codeaurora.org
>
>
> -Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
