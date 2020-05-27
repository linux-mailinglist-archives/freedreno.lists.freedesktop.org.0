Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8B1E4F74
	for <lists+freedreno@lfdr.de>; Wed, 27 May 2020 22:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5576E0FA;
	Wed, 27 May 2020 20:41:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85D6E0F2
 for <freedreno@lists.freedesktop.org>; Wed, 27 May 2020 20:41:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590612083; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/HltvWpjIckqTeFxShztxsMT0OLJIpZrXlWtw+ib2qc=;
 b=mdix8j1ZNCYAEeajLswJbMmsNikqZX6QoGrp/eL/B2XMjN4Qrd1DkhT19DSPaT4Uh/VqSDaO
 VDhB3w3Q0z1Xt03MhDNJ5es3VE89SpOSfrsaTCcW8HJMZcF2uY+/YYSPd4Eo+dq3/W28l1ne
 rVSdsHcCqCyyJsgc712pm4xsAPs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5eced0723131442d95f12dd2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 20:41:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 793AAC433A1; Wed, 27 May 2020 20:41:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: sibis)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 596FBC433C6;
 Wed, 27 May 2020 20:41:20 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 May 2020 02:11:20 +0530
From: Sibi Sankar <sibis@codeaurora.org>
To: Saravana Kannan <saravanak@google.com>
In-Reply-To: <CAGETcx_fuS8cmTwCbZ024gqWOmeAc_ytZZ2P6yReBi7Y9O+qMQ@mail.gmail.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
 <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
 <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
 <CAGETcx_fuS8cmTwCbZ024gqWOmeAc_ytZZ2P6yReBi7Y9O+qMQ@mail.gmail.com>
Message-ID: <2463ddcc535279a8076588e14e691ade@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw
 to set DDR bandwidth
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
 <devicetree@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-05-27 23:01, Saravana Kannan wrote:
> On Wed, May 27, 2020 at 8:38 AM Rob Clark <robdclark@gmail.com> wrote:
>> 
>> On Wed, May 27, 2020 at 1:47 AM Sharat Masetty 
>> <smasetty@codeaurora.org> wrote:
>> >
>> > + more folks
>> >
>> > On 5/18/2020 9:55 PM, Rob Clark wrote:
>> > > On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>> > >> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
>> > >>> This patches replaces the previously used static DDR vote and uses
>> > >>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
>> > >>> GPU frequency.
>> > >>>
>> > >>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> > >>> ---
>> > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>> > >>>   1 file changed, 1 insertion(+), 5 deletions(-)
>> > >>>
>> > >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> > >>> index 2d8124b..79433d3 100644
>> > >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> > >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> > >>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>> > >>>
>> > >>>        gmu->freq = gmu->gpu_freqs[perf_index];
>> > >>>
>> > >>> -     /*
>> > >>> -      * Eventually we will want to scale the path vote with the frequency but
>> > >>> -      * for now leave it at max so that the performance is nominal.
>> > >>> -      */
>> > >>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> > >>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>> > >>>   }
>> > >> This adds an implicit requirement that all targets need bandwidth settings
>> > >> defined in the OPP or they won't get a bus vote at all. I would prefer that
>> > >> there be an default escape valve but if not you'll need to add
>> > >> bandwidth values for the sdm845 OPP that target doesn't regress.
>> > >>
>> > > it looks like we could maybe do something like:
>> > >
>> > >    ret = dev_pm_opp_set_bw(...);
>> > >    if (ret) {
>> > >        dev_warn_once(dev, "no bandwidth settings");
>> > >        icc_set_bw(...);
>> > >    }
>> > >
>> > > ?
>> > >
>> > > BR,
>> > > -R
>> >
>> > There is a bit of an issue here - Looks like its not possible to two icc
>> > handles to the same path.  Its causing double enumeration of the paths
>> > in the icc core and messing up path votes. With [1] Since opp/core
>> > already gets a handle to the icc path as part of table add,  drm/msm
>> > could do either
> 
> Are you sure this is the real issue? I'd be surprised if this is a
> real limitation. And if it is, it either needs to be fixed in the ICC
> framework or OPP shouldn't be getting path handles by default (and

not really, this is already handled well
in the icc framework. In this case
the max peak vote would be considered
among the two paths.

> maybe let the driver set the handles before using OPP APIs to change
> BW). I'd lean towards the former.

https://patchwork.kernel.org/patch/11573827/
Yes the core shouldn't get paths
by default unless the bw values
are specified in the opps.

> 
>> > a) Conditionally enumerate gpu->icc_path handle only when pm/opp core
>> > has not got the icc path handle. I could use something like [2] to
>> > determine if should initialize gpu->icc_path*
> 
> This seems like a bandaid. Let's fix it correctly in ICC framework or
> OPP framework.
> 
>> > b) Add peak-opp-configs in 845 dt and mandate all future versions to use

I can't understand ^^ proposal as well.
We would ideally want to add scaling
support for SDM845 as well while we are
at it.

>> > this bindings. With this, I can remove gpu->icc_path from msm/drm
>> > completely and only rely on opp/core for bw voting.
> 
> I don't know what you mean by "peak-opp-configs" but I guess you are
> referring to some kind of DT flag to say if you should vote for BW
> directly or use the OPP framework? If so, I'm pretty sure that won't
> fly. That's an OS implementation specific flag.
> 
> -Saravana

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
