Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604729FCF9
	for <lists+freedreno@lfdr.de>; Fri, 30 Oct 2020 06:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2A6E952;
	Fri, 30 Oct 2020 05:10:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EEB6E952
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 05:09:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604034604; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i5EXSp5H1+wjz49bdX5MmWjfxCCpbPKZqpGfcNnScpk=;
 b=Wm7Ke6KcQomnyLthyrVpKpftfU8MUUumKd2f/4I3LRRXbL4nygACnFIvvVlm5QiliUZeugxy
 TsUiJuD4GfEYJ6bw0MRRZXLul/mUFRtnftPVxGanrrqDsZJEI30oC71s0a3iaS9faq9M+VEk
 ETvrfRsxjs2AqAWvoNVjblc9JhQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f9b9f9c5177b1c5f94d935c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 05:07:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A52DC433C6; Fri, 30 Oct 2020 05:07:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [61.3.219.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E70BC433C6;
 Fri, 30 Oct 2020 05:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E70BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
To: mka@chromium.org
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
 <20201029204842.GC1855806@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <3d99a0e0-765d-0d89-37ed-0f0999580c1b@codeaurora.org>
Date: Fri, 30 Oct 2020 10:37:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201029204842.GC1855806@google.com>
Content-Language: en-US
Subject: Re: [Freedreno] [v4,1/3] drm/msm: Add support for GPU cooling
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/30/2020 2:18 AM, mka@chromium.org wrote:
> On Thu, Oct 29, 2020 at 01:37:19PM +0530, Akhil P Oommen wrote:
>> Register GPU as a devfreq cooling device so that it can be passively
>> cooled by the thermal framework.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Wait, I did not post a 'Reviewed-by' tag for this patch!
> 
> I think the patch should be ok, but I'm still not super happy
> about the resource management involving devfreq in general (see
> discussion on https://patchwork.freedesktop.org/patch/394291/?series=82476&rev=1).
> It's not really something introduced by this patch, but if it ever
> gets fixed releasing the cooling device at the end of
> msm_gpu_cleanup() after everything else might cause trouble.
> 
> In summary, I'm supportive of landing this patch, but reluctant to
> 'sign it off' because of the above.
> 
> In any case:
> 
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
Sorry, Matthias. My mistake. You shared the reviewed tag for the 
dt-bindings update. Will fix this ASAP. Thanks for verifying this.

-Akhil.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
