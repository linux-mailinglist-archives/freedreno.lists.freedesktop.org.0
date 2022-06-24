Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121C55A340
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 23:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA673887C7;
	Fri, 24 Jun 2022 21:05:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310110E9D0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 21:05:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so2165204wmb.5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4FBq55ALNoB8I9/Jp2eahFZ3TVuZO8zAHamAFfwJTA4=;
 b=jtNLzbazAZ3Ty+PCe4NJUDW5r9cbkHlRd8h2mbV7+waX1Tx9erQtwlu2e8BUxesIDH
 SpaHCfUHUYE9Gcjqbo0B/IDMs/JrP3lo3//ZjLcKnRD7/2NuKlxlUOPrugPQ8PeHKwme
 wzVoLofv+/w69KJivy77K+FdWGQ9xTFTuR8C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4FBq55ALNoB8I9/Jp2eahFZ3TVuZO8zAHamAFfwJTA4=;
 b=lmBWUBvfZbODw5ijBkzSgBl/raTylyJtvgGOYnNCUIJsplQeR5lC91ZSZZ5wfH2gDQ
 9acUhfO1M1BpvQLciuH9hr5mScw/wkoQDCzfSQ5Rb/tZ5O/nowoViM0OyTYBRFnGwT3O
 rzbu1OsBgbuTgZkeReJS7BrGABZd6s/67BjaVTMLpRy+i5hoOsb+V6dpKoZ8+wEiFk7j
 kGQorQS4ogj+F7vMwliyIYDwFI0qswdLfxxoPkB7+kUE4qCsgK7qb1anVtJvixMHpBnT
 mh5CQBJep5+PWLAQNOB5+cNep0oVHlgLPou2BPJN6ofLW1ujoDqlP2aQfPQfSXWlgK01
 DJlA==
X-Gm-Message-State: AJIora+WNZxPIMG81AfSXaZA4p4B7fHhxI9H/rX7IIK8S+fAz+vzfSjy
 uSeN0/X1lfU5M+eMJ87tbiNLQJa9T/gQkw==
X-Google-Smtp-Source: AGRyM1s3Pl4EVQvFKsoBwid6w18frt80sinR1W0DhYBmiX4lMtmHCpKONBuPPCGUsGyEmAfWWb+3qw==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr989149wmq.61.1656104739492; 
 Fri, 24 Jun 2022 14:05:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003974a00697esm8995188wmq.38.2022.06.24.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:05:39 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:05:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YrYnIY2s2Nj5C66N@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Freedreno] Please add another drm/msm tree to the linux-next
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 05:19:42PM +0300, Dmitry Baryshkov wrote:
> Hi Stephen,
> 
> I would appreciate if you could add
> 
> https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag
> 
> to the linux-next tree.
> 
> This tree is a part of drm/msm maintenance structure. As a co-maintainer I
> collect and test display patches, while Rob concenctrates on GPU part of the
> driver. Later during the release cycle these patchesare pulled by Rob Clark
> directly into msm-next.
> 
> During last cycle Rob suggested adding this tree to the linux-next effort,
> so that the patches receive better integration testing during the Linux
> development cycle.

Have you guys thought of group maintainering? Single point of failure
trees freak me out a bit, it tends to build silos pretty hard. Simplest
path is to just toss it all into drm-misc, but at least have one tree for
your driver. Building new single maintainer silos after I've run around
for years collecting them all is rather meh.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
