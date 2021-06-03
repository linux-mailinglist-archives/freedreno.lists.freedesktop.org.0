Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917039AEC4
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 01:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54FC6F542;
	Thu,  3 Jun 2021 23:40:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5146F542
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 23:40:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622763648; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Fz8Sw+CAHxzQ1wTzwGA8ftbArfy52ptDiPNLw8/pJ58=;
 b=BvV6Cwt5WTa+E9eEnjkn3mpZ8kVcmwDG4O0Bnf0rtugCENRk11gMViOtm1qpDATi5ZjcDIRr
 zxuiSsosAKTvkhFq50UnvhjGqMzKykfHhwV3oxxrUkpYMfLNIBMzeyRWpDWa3OfKrJRnVpgp
 pcrKWSs91AtxR39ZUQdwCrd10IE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b968742eaeb98b5e7cabe5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 23:40:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0B91C4323A; Thu,  3 Jun 2021 23:40:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D7794C433F1;
 Thu,  3 Jun 2021 23:40:35 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Jun 2021 16:40:35 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
In-Reply-To: <YLdlEB3Ea6OWaLw4@vkoul-mobl>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
 <YLdlEB3Ea6OWaLw4@vkoul-mobl>
Message-ID: <a14c18a2545408e8156dcafc846b17a2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
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
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-02 04:01, Vinod Koul wrote:
> On 27-05-21, 16:30, Rob Clark wrote:
>> On Wed, May 26, 2021 at 8:00 AM Jeffrey Hugo 
>> <jeffrey.l.hugo@gmail.com> wrote:
>> > On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
> 
>> > Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
>> > The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
>> > device, and ultimately handled by one driver.  That driver needs to
>> > get a value from UEFI (set by the bootloader) that is the "panel id".
>> > Then the driver calls into ACPI (I think its _ROM, but I might be
>> > mistaken, doing this from memory) with that id.  It gets back a binary
>> > blob which is mostly an xml file (format is publicly documented) that
>> > contains the panel timings and such.
>> 
>> tbh, I kinda suspect that having a single "gpu" device (which also
>> includes venus, in addition to display, IIRC) in the ACPI tables is a
>> windowsism, trying to make things look to userspace like a single "GPU
>> card" in the x86 world.. but either way, I think the ACPI tables on
>> the windows arm laptops which use dsi->bridge->edp is too much of a
>> lost cause to even consider here.  Possibly ACPI boot on these devices
>> would be more feasible on newer devices which have direct eDP out of
>> the SoC without requiring external bridge/panel glue.
> 
> yeah that is always a very different world. although it might make 
> sense
> to use information in tables and try to deduce information about the
> system can be helpful...
> 
>> I'd worry more about what makes sense in a DT world, when it comes to
>> DT bindings.
> 
> And do you have thoughts on that..?

At the moment, I will comment on the bindings first and my idea on how 
to proceed.
The bindings mentioned here: 
https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/ 
seem to be just
taken directly from downstream which was not the plan.

I think all of these should be part of the generic panel bindings as 
none of these are QC specific:

@@ -188,6 +195,14 @@ Example:
  		qcom,master-dsi;
  		qcom,sync-dual-dsi;

+		qcom,mdss-dsc-enabled;
+		qcom,mdss-slice-height = <16>;
+		qcom,mdss-slice-width = <540>;
+		qcom,mdss-slice-per-pkt = <1>;
+		qcom,mdss-bit-per-component = <8>;
+		qcom,mdss-bit-per-pixel = <8>;
+		qcom,mdss-block-prediction-enable;
+

How about having a panel-dsc.yaml which will have these properties and 
have a panel-dsc node to have this information?

I would like to hear the feedback on this proposal then the series can 
be reworked.

Thanks

Abhinav
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
