Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D749739AD63
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 00:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06B6F515;
	Thu,  3 Jun 2021 22:00:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972B46F515
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 22:00:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622757611; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JopR8lsZRXcBqVt7w6KYKzZfR6Rv2Sc1+2IbY1eLLm0=;
 b=UlGyRxR+lXOxFMea2fXdZdk2bpFDxNFO2JDkD1nq7ZIITSWmDJUyyTkVCpRIG67yLHzqtN1y
 AIJWerQZxfkX6+zDWK99KuT+nAoUgYNrVAqcwVoDPYE9O0B1fUZzzANTSF2CkJigDCkMxBAM
 kdKUmguqG0TZvHX874Af+90Cshg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b950d6265e7370f73105c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 21:59:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF0C2C4323A; Thu,  3 Jun 2021 21:59:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25277C4338A;
 Thu,  3 Jun 2021 21:59:49 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Jun 2021 14:59:49 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
References: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
Message-ID: <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: power off DP phy at suspend
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
Cc: freedreno@lists.freedesktop.org, vkoul@kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-03 13:22, Stephen Boyd wrote:
> Can you Cc dri-devel?
> 
Sorry for dropping this cc.
Should I re submit this v5 with cc=dri-devel?



> Quoting Kuogee Hsieh (2021-06-03 08:40:46)
>> Normal DP suspend operation contains two steps, display off followed
>> by dp suspend, to complete system wide suspending cycle if display is
>> up at that time. In this case, DP phy will be powered off at display
>> off. However there is an exception case that depending on the timing
>> of dongle plug in during system wide suspending, sometimes display off
>> procedure may be skipped and dp suspend was called directly. In this
>> case, dp phy is stay at powered on (phy->power_count = 1) so that at
>> next resume dp driver crash at main link clock enable due to phy is
>> not physically powered on. This patch will call 
>> dp_ctrl_off_link_stream()
>> to tear down main link and power off phy at dp_pm_suspend() if main 
>> link
>> had been brought up.
>> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
