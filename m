Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FB3F79DB
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 18:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D706E3B2;
	Wed, 25 Aug 2021 16:06:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322036E3B2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 16:06:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629907567; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yc5dXmEbANnSyJ5gTovdFTL4dL+lLozkExAzl2y9EgI=;
 b=IcBpd4j3sVr6qemESKk9EWQHyoh7BDitaBRZr2Pm5uZHYzelVFDhJbBE+zaN4/kd7U3k7Z6a
 r8koGgWURjsbF/kAh1+dIH+CN/B3bCDCMD7D2hiUzJi0yHBZY69ttrwRWmwBhgCu2WbVQPnT
 bJesicDfIdyJE9s6I0d9wb6gySU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61266a6cfc1f4cb6929a8704 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 16:06:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E608EC4361B; Wed, 25 Aug 2021 16:06:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B4E6C4361A;
 Wed, 25 Aug 2021 16:06:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 25 Aug 2021 09:06:02 -0700
From: khsieh@codeaurora.org
To: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, rsubbia@codeaurora.org, rnayak@codeaurora.org,
 freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com> <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
 <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
Message-ID: <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v3] drm/dp_mst: Fix return code on sideband
 message failure
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

On 2021-07-27 15:44, Lyude Paul wrote:
> Nice timing, you literally got me as I was 2 minutes away from leaving 
> work
> for the day :P. I will go ahead and push it now.
> 
Hi Lyude,

Had you pushed this patch yet?
We still did not see this patch at msm-nex and v5.10 branch.
Thanks,


> BTW - in the future I recommend using dim to add Fixes: tags as it'll 
> add Cc:
> to stable as appropriate (this patch in particular should be Cc:
> stable@vger.kernel.org # v5.3+). will add these tags when I push it
> 
> On Tue, 2021-07-27 at 15:41 -0700, khsieh@codeaurora.org wrote:
>> On 2021-07-27 12:21, Lyude Paul wrote:
>> > On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
>> > >
>> > > It looks like this patch is good to go (mainlined).
>> > > Anything needed from me to do?
>> > > Thanks,
>> >
>> > Do you have access for pushing this patch? If not let me know and I can
>> > go
>> > ahead and push it to drm-misc-next for you.
>> no, I do not have access to drm-misc-next.
>> Please push it for me.
>> Thanks a lots.
>> 
