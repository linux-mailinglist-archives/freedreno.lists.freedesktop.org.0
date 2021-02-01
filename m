Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C030A1B0
	for <lists+freedreno@lfdr.de>; Mon,  1 Feb 2021 06:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F86E3F0;
	Mon,  1 Feb 2021 05:56:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7206E3F0;
 Mon,  1 Feb 2021 05:56:16 +0000 (UTC)
Received: from [192.168.20.102] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id A5E7C60618;
 Mon,  1 Feb 2021 05:56:13 +0000 (UTC)
To: Iskren Chernev <iskren.chernev@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <666723e2-0d5f-3f7e-3607-f9df0ffbd1c6@postmarketos.org>
Date: Mon, 1 Feb 2021 08:57:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd
 panels
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 1/27/21 6:24 PM, Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> 
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")
> 

Tested on msm8974pro samsung-klte, finally got 60 fps instead of 13
in kmscube.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
