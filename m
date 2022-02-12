Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724BA4B3383
	for <lists+freedreno@lfdr.de>; Sat, 12 Feb 2022 08:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9260C10E508;
	Sat, 12 Feb 2022 07:04:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E810E157;
 Sat, 12 Feb 2022 07:04:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1078A60916;
 Sat, 12 Feb 2022 07:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6ABC340E7;
 Sat, 12 Feb 2022 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644649459;
 bh=5JR5bOcysOJSDhFqg8hYnCFWbBwyk5yff/mZFGN/g14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfy74ZkfFcQ+kcqFIyQLj/N5y9ufjm8AT5DYj4lCEUJOyzf7tTiYvBvOu6TPWVRbz
 /zy7BHaB9LQtbocZDeokNetYzUVKmZ1QIWSAojXQSG3zaWWbCB3vQrTJig+qhXhh8c
 QbPntvOB+fNg8ctNwIM4ahKsim82DJ0htqVSL+6U=
Date: Sat, 12 Feb 2022 08:04:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <Ygdb63FrorUsX/Hg@kroah.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
Subject: Re: [Freedreno] [PATCH] devcoredump: increase the device delete
 timeout to 10 mins
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, johannes@sipsolutions.net,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 10:59:39AM -0800, Abhinav Kumar wrote:
> Hi Greg
> 
> Thanks for the response.
> 
> On 2/11/2022 3:09 AM, Greg KH wrote:
> > On Tue, Feb 08, 2022 at 11:44:32AM -0800, Abhinav Kumar wrote:
> > > There are cases where depending on the size of the devcoredump and the speed
> > > at which the usermode reads the dump, it can take longer than the current 5 mins
> > > timeout.
> > > 
> > > This can lead to incomplete dumps as the device is deleted once the timeout expires.
> > > 
> > > One example is below where it took 6 mins for the devcoredump to be completely read.
> > > 
> > > 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
> > > 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node
> > 
> > What makes this so slow?  Reading from the kernel shouldn't be the
> > limit, is it where the data is being sent to?
> 
> We are still checking this. We are seeing better read times when we bump up
> the thread priority of the thread which was reading this.

Where is the thread sending the data to?

> We are also trying to check if bumping up CPU speed is helping.
> But, results have not been consistently good enough. So we thought we should
> also increase the timeout to be safe.

Why would 10 minutes be better than 30?  What should the limit be?  :)

thanks,

greg k-h
