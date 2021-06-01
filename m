Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4ED397320
	for <lists+freedreno@lfdr.de>; Tue,  1 Jun 2021 14:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1B6E81A;
	Tue,  1 Jun 2021 12:23:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A236E92F
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jun 2021 12:22:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622550185; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JAcNP7Uo9zJKWgXCjvCXGiHUwrw7I6s+Af9UbfhFRic=;
 b=AWnUMg52uhtl+xpkv0BAzDDUSowrzkFSSzjvgPUWpb79PhpXPE5rxB9a4kcIkKLmfIO/EtIA
 ecr1sMXbS6pdualBHrjatxKiU01CNJZaRv8HmFM21hmuSM6VCbQk5IFKPK+b6Xu43mbmInLW
 6twl6mMkLH+i3L9aLbriPgMFNew=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60b62695ed59bf69cceb716b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 12:22:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2B315C43217; Tue,  1 Jun 2021 12:22:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B0A4C433F1;
 Tue,  1 Jun 2021 12:22:44 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 17:52:44 +0530
From: rajeevny@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
 <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
Message-ID: <b37617c61fbdb11dc2c903878c05e0ac@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [v1 2/3] drm/msm/dsi: Add PHY configuration for
 SC7280
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
Cc: freedreno@lists.freedesktop.org, mkrishn@codeaurora.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, robh+dt@kernel.org, abhinavk@codeaurora.org,
 kalyan_t@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31-05-2021 23:27, Dmitry Baryshkov wrote:
> On 31/05/2021 16:33, Rajeev Nandan wrote:


>> +	.min_pll_rate = 600000000UL,
>> +	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
>> ULONG_MAX,
> 
> Could you please follow the patch by Arnd here?
> https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/
> 
> 
> 
>> +	.io_start = { 0xae94400, 0xae96400 },
>> +	.num_dsi_phy = 2,
> 
> Judging from the next patch, you have one DSI host and one DSI PHY.
> Could you please correct io_start / num_dsi_phy here?
> 
>> +	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>> +};
> 
> 
> With these two issues fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you very much for your review :) I have incorporated the
review comments. I am waiting for comments on my DT bindings patch (1/3) 
and
will send v2 in a day or two.

Thanks,
Rajeev
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
