Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2341E7A9
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 08:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CCD6ECF7;
	Fri,  1 Oct 2021 06:39:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7B36ECEF
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 06:39:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633070360; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DH07yRNxfLIbPow4oMCMJkb9io5D23Aj6DAM87OKB7w=;
 b=FlpCpybfK5RSAENij37LwFaJm4+gckWRhqvX/ybuSJqkP2JD4+JPVh9Y+5ssQfArGjxfumvG
 /QxpOLuZCYbf+SqdokaZXqj5RataGb77ZQSpEJbfHxFX2P0T0LG+7Y8g6l4bPF9dCs7huDMQ
 DOvnt0KYRLrA2oAB3YbgO4T7Tgg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6156ad0ca5a9bab6e8b8e55f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:39:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 92F21C4360D; Fri,  1 Oct 2021 06:39:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkrishn)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 356EEC43460;
 Fri,  1 Oct 2021 06:39:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Oct 2021 12:09:07 +0530
From: mkrishn@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
In-Reply-To: <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
 <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
Message-ID: <8f344213978f31c04e80b804a931db56@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v1 2/4] arm64: dts: qcom: sc7280: add
 display dt nodes
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-09-30 23:28, Stephen Boyd wrote:
> Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
>> On 2021-08-19 01:27, Stephen Boyd wrote:
>> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
>> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> index 53a21d0..fd7ff1c 100644
>> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> +
>> >> +                       status = "disabled";
>> >> +
>> >> +                       mdp: mdp@ae01000 {
>> >
>> > display-controller@ae01000
>> 
>> Stephen,
>>     In the current driver code, there is a substring comparison for 
>> "mdp"
>> in device node name as part of probe sequence. If "mdp" is not present
>> in the node name, it will
>>     return an error resulting in probe failure. Can we continue using 
>> mdp
>> as nodename instead of display controller?
>> 
> 
> Can we fix the driver to not look for node names and look for 
> compatible
> strings instead? It took me a minute to find compare_name_mdp() in
> drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
> Perhaps looking for qcom,mdp5 in there will be sufficient instead of
> looking at the node name.

Sure Stephen. I will make the necessary changes in msm_drv.c to look for 
compatible string instead of node name.
Can I include these two changes (changing mdp--> display controller and 
msm_drv.c changes) in a separate series ?

Thanks,
Krishna
