Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292E3423C4
	for <lists+freedreno@lfdr.de>; Fri, 19 Mar 2021 18:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86B66EA61;
	Fri, 19 Mar 2021 17:55:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329A6EA69
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 17:55:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g25so5947969wmh.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=H4E5zo6M+sGFb9jJfPuBMekAUt72xfRBAZEVdNXvosI=;
 b=HkWCKtqano6hr83mTvHPNb1mTJD7j++xG4i3V1pZc+fMnH//eWACXOeqWIMYDAyiqD
 CWBkqUiJ1zmtZ3OlxFIY9DcUS/euNcLz8nxn4AxgvZ1rE5qJAgMaRKnutzlS1iCHVLZf
 S1ATj65HkMPVN9VP3K+xuo111cO9NYWhg1scM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=H4E5zo6M+sGFb9jJfPuBMekAUt72xfRBAZEVdNXvosI=;
 b=WhUUtSv7WxfHkZxk/goIka1gDS3ZCg35RIlwbqxqtax48HrsJxIpXWkMVHS0H8nR+Q
 t7udVUmRgf6W4DCQQzuyaK3lZHl8yHfS59QUc85ZuLLKjA/PqFr7Z7Cp/7AxygTfTgvr
 iZx1J0T4pmKWrwv9d0uDtYqNI3nX2NOjtAvVOPGKE3ngKAUPFG7RRek9/WhSJ/xEGeLM
 BMzxlD2OlBwIAU05k77wIIi+43/0ghT9z1O0Z7WysphA0BJ9V9yb1pSJxI1HiX7tvRVl
 2aFjxsHWlp2z/VOQS/8IEsGR6MpGWv+ITL0Z1nEhQ9h5rfI1rMR/XJc9zCSO+0BPt78r
 P1Vg==
X-Gm-Message-State: AOAM530rRElNOXj4HEScWoAhqsGQUaS2HPcUmdllLOsk1HlGqfIiT+ys
 V20BFBph1yrowFLKg0M5bT76YA==
X-Google-Smtp-Source: ABdhPJznH8/2o31By7revAgfT3dpRwhrdpC+rY/yFumwMUBtQGtz1iOu7IVxYDezg1HGlBR9UX23fg==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4743813wmh.11.1616176521069;
 Fri, 19 Mar 2021 10:55:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s3sm7109143wmd.21.2021.03.19.10.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:55:20 -0700 (PDT)
Date: Fri, 19 Mar 2021 18:55:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Roland Scheidegger <sroland@vmware.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell> <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell> <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
 <20210319082407.GG2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319082407.GG2916463@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jeremy Kolb <jkolb@brandeis.edu>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, Roland Scheidegger <sroland@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 08:24:07AM +0000, Lee Jones wrote:
> On Thu, 18 Mar 2021, Daniel Vetter wrote:
> 
> > On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > On Thu, 11 Mar 2021, Lee Jones wrote:
> > > >
> > > > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > > > >
> > > > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > > > >
> > > > > > > > The vmwgfx ones look all good to me, so for
> > > > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > > > happened here.
> > > > > > >
> > > > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > > > >
> > > > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > > > a previous one.
> > > > > >
> > > > > > They should show up in linux-next again. We merge patches for next merge
> > > > > > window even during the current merge window, but need to make sure they
> > > > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > > > show up, and then get pulled again.
> > > > > >
> > > > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > > > confusion here. But your patches should all be in linux-next again (they
> > > > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > > > >
> > > > > > Sorry for the confusion here.
> > > > >
> > > > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > > > >
> > > > > Thanks for the explanation Daniel
> > > >
> > > > After rebasing today, all of my GPU patches have remained.  Would
> > > > someone be kind enough to check that everything is still in order
> > > > please?
> > >
> > > It's still broken somehow. I've kiced Maxime and Maarten again,
> > > they're also on this thread.
> > 
> > You're patches have made it into drm-next meanwhile, so they should
> > show up in linux-next through that tree at least. Except if that one
> > also has some trouble.
> 
> Thanks for letting me know.
> 
> I see some patches made it back in, others didn't.
> 
> I'll resend the stragglers - bear with.

The vmwgfx ones should all be back, the others I guess just werent ever
applied. I'll vacuum them all up if you resend. Apologies for the wobbly
ride.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
