Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A02EF3A9
	for <lists+freedreno@lfdr.de>; Fri,  8 Jan 2021 15:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0C6E07B;
	Fri,  8 Jan 2021 14:05:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E36E822
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jan 2021 14:05:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610114740; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NolXsxXc4LnP1hy9iZM7qEDax7wxHeKW7dI9mmmMmqw=;
 b=JS86dp4crEqHdH1kypJcMSrEAttoLCCsctDspA+qvroqYxq+4XpeTV8mM8qjE7eWAL1ZAt0i
 +2mr2WhqQa549qj6A+qNlSJQX5lVehOcckwb0x3h8p9wBWcF+Fy9qUt1dCUQ8dKnotUgvddU
 rwblioGm4cQHdYKV1tdSbbdmSx4=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ff866af9f9cd52344f26555 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 14:05:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6ED23C43463; Fri,  8 Jan 2021 14:05:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 726EDC433C6;
 Fri,  8 Jan 2021 14:05:33 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 08 Jan 2021 19:35:33 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
Message-ID: <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
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
Cc: sean@poorly.run, jcrouse@codeaurora.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 martin.botka@somainline.org, akhilpo@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 shawn.guo@linaro.org, robdclark@gmail.com, marijn.suijten@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, airlied@redhat.com,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-01-08 19:09, Konrad Dybcio wrote:
>> Konrad, can you please test this below change without your change?
> 
> This brings no difference, a BUG still happens. We're still calling
> to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
> into an A640..
> 
> Also, relying on disabling LLCC in the config is out of question as it
> makes the arm32 kernel not compile with DRM/MSM and it just removes
> the functionality on devices with a6xx.. (unless somebody removes the
> dependency on it, which in my opinion is even worse and will cause
> more problems for developers!).
> 

Disabling LLCC is not the suggestion, I was under the impression that
was the cause here for the smmu bug. Anyways, the check for llc slice
in case llcc is disabled is not correct as well. I will send a patch for
that as well.

> The bigger question is how and why did that piece of code ever make it
> to adreno_gpu.c and not a6xx_gpu.c?
> 

My mistake, I will move it.

> To solve it in a cleaner way I propose to move it to an a6xx-specific
> file, or if it's going to be used with next-gen GPUs, perhaps manage
> calling of this code via an adreno quirk/feature in adreno_device.c.
> Now that I think about it, A5xx GPMU en/disable could probably managed
> like that, instead of using tons of if-statements for each GPU model
> that has it..
> 
> While we're at it, do ALL (and I truly do mean ALL, including the
> low-end ones, this will be important later on) A6xx GPUs make use of
> that feature?
> 

I do not have a list of all A6XX GPUs with me currently, but from what
I know, A618, A630, A640, A650 has the support.

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
