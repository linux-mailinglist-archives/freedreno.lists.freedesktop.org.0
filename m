Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09121EEC1
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 13:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9D6E3E1;
	Tue, 14 Jul 2020 11:10:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FCF6E3E1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 11:10:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594725003; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=063nsZA+TEvD+EIhBzADv1QQAX7cmYzUzYelnNmmLWM=;
 b=Sc2cA4xo5b3snehnnlsn9KnLa7zUIBfSxRIBO1ccMS8jp0nSfmGnsXVPjLAEBdRQe9WfCD+K
 4AgyDp0kqsDNPFDWzIIC64/hpo2ZvR7/SV/R2uzSrP91PaBIV1MU5LACmE1D6Sc3IxO/pO93
 Ppm157Sni5y9RjnT8iNT7qL1Vz0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f0d927c7c8ca473a88c71e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 11:09:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 43917C43391; Tue, 14 Jul 2020 11:09:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B25B1C433CA;
 Tue, 14 Jul 2020 11:09:47 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 16:39:47 +0530
From: kalyan_t@codeaurora.org
To: Matthias Kaehlcke <mka@chromium.org>
In-Reply-To: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
Message-ID: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [v1] drm/msm/dpu: add support for clk and bw
 scaling for display
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, hoegsberg@chromium.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
>> This change adds support to scale src clk and bandwidth as
>> per composition requirements.
>> 
>> Interconnect registration for bw has been moved to mdp
>> device node from mdss to facilitate the scaling.
>> 
>> Changes in v1:
>>  - Address armv7 compilation issues with the patch (Rob)
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> 
> It seems this is an evolution of this series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> 
> Are the DT bits of the series still valid? If so please include them in 
> the
> series, otherwise please add DT patches to allow folks to test and 
> review,
> and get them landed in Bjorn's tree after the driver changes have 
> landed.

Hi,

Yes the patch is dependent on the DT changes, should i add them with 
depends tag in the commit text ?
https://patchwork.kernel.org/patch/11470785/
https://patchwork.kernel.org/patch/11470789/

- Kalyan
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
