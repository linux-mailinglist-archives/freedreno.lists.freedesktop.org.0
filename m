Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01E4044F5
	for <lists+freedreno@lfdr.de>; Thu,  9 Sep 2021 07:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26986E159;
	Thu,  9 Sep 2021 05:27:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6296E14F;
 Thu,  9 Sep 2021 05:27:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="281699118"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="281699118"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 22:27:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="696084370"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 22:27:32 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1mOCdz-0000Z8-Uz; Thu, 09 Sep 2021 08:30:39 +0300
Date: Thu, 9 Sep 2021 08:30:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Message-ID: <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Freedreno] [PATCH igt v3 0/3] Initial igt tests for drm/msm
 ioctls
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

On Wed, Sep 08, 2021 at 11:02:42AM -0700, Rob Clark wrote:
> On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> > plenty more we can add, but need to start somewhere.
> >
> > Rob Clark (3):
> >   drmtest: Add DRIVER_MSM support
> >   msm: Add helper library
> >   msm: Add submit ioctl tests
> 
> If there are no more comments on this series, could somebody push it?

Ah, I was expecting you to do it yourself. Merged now.


-- 
Petri Latvala
