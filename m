Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7061F6506
	for <lists+freedreno@lfdr.de>; Thu, 11 Jun 2020 11:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFA36E8CC;
	Thu, 11 Jun 2020 09:56:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2896E8CB;
 Thu, 11 Jun 2020 09:56:34 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02608207C3;
 Thu, 11 Jun 2020 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591869394;
 bh=OuqfhL2PTtXpH/ofIcvTInY0cd1kGN0sDs4hy5Wu5CI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jnYZtZl9pEBQKfzqHaUYKxTJ2Qv+d9orumujxLXAF7ebwn2igRO3zA3nv5Zyb/nBp
 qQ1tOIPE7XH/8wrZFEBYcm8YM6KaA/TUzhtMjP4KRh9qvjg30W/lCUBs2XCAl9LM1M
 Uityhnh6CtUUUUuUc9I74cD2BECHsTYU0Zlb1zJ4=
MIME-Version: 1.0
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
References: <20200609120455.20458-1-harigovi@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Thu, 11 Jun 2020 02:56:33 -0700
Message-ID: <159186939329.242598.2996575539576077899@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [v3] drm/bridge: ti-sn65dsi86: ensure bridge
 suspend happens during PM sleep
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
Cc: Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Harigovindan P (2020-06-09 05:04:55)
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.
> 
> Add changes to force suspend on the runtime device during pm sleep.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
