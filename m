Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF93FBA81
	for <lists+freedreno@lfdr.de>; Mon, 30 Aug 2021 18:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66789CA0;
	Mon, 30 Aug 2021 16:58:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8740589C33
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630342687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raISjzzXTZAIieU8nOzMirvpJSgfC59Ba/8FkbPMcHk=;
 b=PhUzm6PJIq/2NBcLHoWkC4CbuvnKhWjiL11TPlkZ6ig9KR6GqPpj14pEvhgMI+ginY06Vu
 1C7jvHtAPwKCaVoVo04txkmSLsw75f4oXEw2w1Uz5B3T7kGejSDqaGkzUzkmkA/kIvSyqy
 KCqa4JRXksxCaoWSyKcAiZVCVBp1cQA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-UCTo_RgGOS2P8UHymfRs_w-1; Mon, 30 Aug 2021 12:58:04 -0400
X-MC-Unique: UCTo_RgGOS2P8UHymfRs_w-1
Received: by mail-qk1-f198.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so481625qkd.0
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 09:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=raISjzzXTZAIieU8nOzMirvpJSgfC59Ba/8FkbPMcHk=;
 b=P2jjD2JRxdoX7lQ75QG+a+wn0PdpAh7CIcisRft8+V8zUBbkI1BkIRKL/IZPBpJkmF
 MbHgcdAe+Kim9ab567aXB124wz5nt7Hp/XIL4VkPeM25HLEYf+cygtBi+UDhal20kl1l
 lfTvOW2BuLL2h5U3HaDop+1x9z0WhXGwb8fUe7Tu7HHVqDMnZ9CDmA9XvfNtkn5CcoTU
 kBxhjzpPry31jiqEYgOdFLR1YdI0Mcjyi9bnuapl5429BjSEHAWGoNS7Yn75aD1lzs1H
 K4UqofyB+EYfAMDVofeIdNCBVLVLilzpANNk7La99cty818JIeOFM6fIwbmTtKtsI+IO
 gzmw==
X-Gm-Message-State: AOAM530SKOJYZPo0ONulAvRFAXIU7adOvHzcno4vvZAljzVR7IjSFwaL
 Q1V8WgV97G3OuSjt02nXUnWUI2ySP6O11ismtoa7B3n2NS6lAJU3VbCuSA0guWs/crKviawRbv6
 HmM0ArOE/io56/IKdXjOWnOrgd3D0
X-Received: by 2002:ac8:6601:: with SMTP id c1mr19178995qtp.179.1630342683866; 
 Mon, 30 Aug 2021 09:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsd1fcEPuUUh06f8iCPwA7mKsjRLGfmhZzGrmlfV/DO+fudHXPuiEhJVxn8MES4Ogj/P+umw==
X-Received: by 2002:ac8:6601:: with SMTP id c1mr19178971qtp.179.1630342683670; 
 Mon, 30 Aug 2021 09:58:03 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j3sm9152085qti.4.2021.08.30.09.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 09:58:03 -0700 (PDT)
Message-ID: <db5ae1c8d070509580218a501cfa9caaf3f029e1.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, robdclark@gmail.com, 
 sean@poorly.run, swboyd@chromium.org, abhinavk@codeaurora.org, 
 aravindh@codeaurora.org, rsubbia@codeaurora.org, rnayak@codeaurora.org, 
 freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 30 Aug 2021 12:58:01 -0400
In-Reply-To: <f0fcfe7a73e87150a7a1f042269b76a3@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
 <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
 <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
 <88b5fbe60c95bcdf42353bec9f8c48aefa864a31.camel@redhat.com>
 <f0fcfe7a73e87150a7a1f042269b76a3@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-08-30 at 08:56 -0700, khsieh@codeaurora.org wrote:
> On 2021-08-25 09:26, Lyude Paul wrote:
> > The patch was pushed yes (was part of drm-misc-next-2021-07-29), seems 
> > like it
> > just hasn't trickled down to linus's branch quite yet.
> 
> Hi Stephen B,
> 
> Would you mind back porting this patch to V5.10 branch?
> It will have lots of helps for us to support display port MST case.
> Thanks,

I'm assuming you're talking to someone else? A little confused because I don't
see a Stephen B in this thread

> 
> 
> 
> > 
> > On Wed, 2021-08-25 at 09:06 -0700, khsieh@codeaurora.org wrote:
> > > On 2021-07-27 15:44, Lyude Paul wrote:
> > > > Nice timing, you literally got me as I was 2 minutes away from leaving
> > > > work
> > > > for the day :P. I will go ahead and push it now.
> > > > 
> > > Hi Lyude,
> > > 
> > > Had you pushed this patch yet?
> > > We still did not see this patch at msm-nex and v5.10 branch.
> > > Thanks,
> > > 
> > > 
> > > > BTW - in the future I recommend using dim to add Fixes: tags as it'll
> > > > add Cc:
> > > > to stable as appropriate (this patch in particular should be Cc:
> > > > stable@vger.kernel.org # v5.3+). will add these tags when I push it
> > > > 
> > > > On Tue, 2021-07-27 at 15:41 -0700, khsieh@codeaurora.org wrote:
> > > > > On 2021-07-27 12:21, Lyude Paul wrote:
> > > > > > On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
> > > > > > > 
> > > > > > > It looks like this patch is good to go (mainlined).
> > > > > > > Anything needed from me to do?
> > > > > > > Thanks,
> > > > > > 
> > > > > > Do you have access for pushing this patch? If not let me know and
> > > > > > I
> > > > > > can
> > > > > > go
> > > > > > ahead and push it to drm-misc-next for you.
> > > > > no, I do not have access to drm-misc-next.
> > > > > Please push it for me.
> > > > > Thanks a lots.
> > > > > 
> > > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

