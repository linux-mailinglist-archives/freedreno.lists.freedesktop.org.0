Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBB39E5DF
	for <lists+freedreno@lfdr.de>; Mon,  7 Jun 2021 19:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F78F6E982;
	Mon,  7 Jun 2021 17:48:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5836E982
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jun 2021 17:48:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623088108; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MFuDFvHXYlR2gGa8jeKkSiXVOoZvWtSWsoYMxROMkaU=;
 b=IP/qSkWlUCoopJDPORDW53PDaXRmL+r7eVK8TVMSrJ5P1da0YqN6E1v1UvRq9hPItVjQtMc7
 kJYfcACqsyIvmNnqgwypT0okR0XVmn0qgHKK89y78u/3m8ADSMI+41kfTbKHdPbE1Jh2G+e6
 PDUByHt+iDBUzYNzIuzPUu9EASQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60be5bd4ed59bf69cc858db6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 17:48:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 808E9C433F1; Mon,  7 Jun 2021 17:48:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EB0FC4338A;
 Mon,  7 Jun 2021 17:48:02 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 10:48:02 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <YLxX/YtegtbLmkri@builder.lan>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
Message-ID: <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-05 22:07, Bjorn Andersson wrote:
> On Thu 03 Jun 16:56 CDT 2021, khsieh@codeaurora.org wrote:
> 
>> On 2021-06-03 09:53, Bjorn Andersson wrote:
>> > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> [..]
>> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> [..]
>> > > +				power-domains = <&rpmhpd SC7180_CX>;
>> >
>> > Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
>> > mention CX here in order for the opp framework to apply required-opps
>> > of CX?
>> 
>> yes,
> 
> If you want me, or other maintainers, to spend any time reviewing or
> applying your patches going forward then you need to actually bother
> replying properly to the questions asked.
> 
> Thanks,
> Bjorn

Sorry about the confusion. What I meant is that even though DP 
controller is in the MDSS_GDSC
power domain, DP PHY/PLL sources out of CX. The DP link clocks have a 
direct impact
on the CX voltage corners. Therefore, we need to mention the CX power 
domain here. And, since
we can associate only one OPP table with one device, we picked the DP 
link clock over other
clocks.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
