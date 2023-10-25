Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6937D6C1D
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 14:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DCD10E5AD;
	Wed, 25 Oct 2023 12:39:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EFB10E5AD
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 12:39:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1BF42B82A8C;
 Wed, 25 Oct 2023 12:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611B9C433C7;
 Wed, 25 Oct 2023 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698237589;
 bh=izrauq5aGqPVsDf/t0BCTrBB/O9la1zB0gYc2jn+qiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqNrenIzHolLr1199ZbICpYPT1fmWKQEqqMcl7slVFxLQuTTJa91uF8NBve1BVg4f
 UavUx9TeF/lflT6Uk4F/O7rGGwM2+8bEhGFHok4GWU5ULI9TbGzIkmMXcxQn70Qegx
 JPPYBdpvKvaQKKBwRk+P8fpiRQAGHlMP4fgLJx2UCLf0tC/QQFUrbQFbJdBRPQnN8E
 APEuJCM/0RNhIJzBz1oWrGnCP42F2zrXl/f6AA6/rimZS5qxNqaiOq3zeQZvadEm/N
 5n9bEBwYBeN7eGzp/l76c4a8qVtRdGx7601TQbt21+lBkSTsylNHxtNVDiRfb3N1VF
 jkbC433is4KWQ==
Received: from johan by xi.lan with local (Exim 4.96)
 (envelope-from <johan@kernel.org>) id 1qvdBB-0006Ln-1I;
 Wed, 25 Oct 2023 14:40:09 +0200
Date: Wed, 25 Oct 2023 14:40:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Simon Ser <contact@emersion.fr>
Message-ID: <ZTkMqYQzy7k-zgJM@hovoldconsulting.com>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
 <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 12:29:26PM +0000, Simon Ser wrote:
> On Wednesday, October 25th, 2023 at 14:22, Johan Hovold <johan@kernel.org> wrote:
> 
> > I was just going to post a patch fixing this after finally investigating
> > why the DisplayPort outputs on the X13s were annoyingly identified as
> > "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
> > "DP-2".
> 
> Note, ideally userspace should use drmModeGetConnectorTypeName() from
> libdrm to figure out the proper name for a connector type. That way we
> only need to update a single spot when adding a new connector type,
> instead of patching a whole bunch of programs.

Yeah, I only skimmed the xrandr code and these strings appear to
originate from some X library. So hopefully not that many places to
update.

Scripts and other tools may still be using these strings directly
however (e.g. as did my custom script to enable external displays).

Johan
