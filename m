Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAC2AB1C6
	for <lists+freedreno@lfdr.de>; Mon,  9 Nov 2020 08:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439A89491;
	Mon,  9 Nov 2020 07:33:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0D89491;
 Mon,  9 Nov 2020 07:33:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 973718053B;
 Mon,  9 Nov 2020 08:32:57 +0100 (CET)
Date: Mon, 9 Nov 2020 08:32:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-ID: <20201109073256.GD1715181@ravnborg.org>
References: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=3_kn_H4_jy6CR71Q0pAA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Subject: Re: [Freedreno] [PATCH] drm/msm: dsi: Constify dsi_host_ops
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Nov 08, 2020 at 11:37:38PM +0100, Rikard Falkeborn wrote:
> The only usage of dsi_host_ops is to assign its address to the ops field
> in the mipi_dsi_host struct, which is a const pointer. Make it const to
> allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

With this patch all struct mipi_dsi_host_ops are const - good.
I expect the msm folks to pick it up.

	Sam
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
