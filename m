Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69A73B103
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 09:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C372110E5DA;
	Fri, 23 Jun 2023 07:02:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525AC10E5DA
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 07:02:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AE3D53F32D;
 Fri, 23 Jun 2023 09:02:42 +0200 (CEST)
Date: Fri, 23 Jun 2023 09:02:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <qgqzbcoy5rbkya4vodicmty3pvhqj5laqb3sb5kcdicwityboq@m4hpqw3tofdz>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <3a6cc492-6b54-2c70-402e-995c0b003c01@linaro.org>
 <mfzmioovf54lcuiuzvk4fuz26elag6iw3ohbdhgym7k3qzirhx@dd7vu7ms6azz>
 <e594fed4-fc01-477b-1e7c-d1d58e1a0dda@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e594fed4-fc01-477b-1e7c-d1d58e1a0dda@quicinc.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for
 DSI command mode
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-22 16:04:30, Abhinav Kumar wrote:
<snip>
> >> Is widebus applicable only to the CMD mode, or video mode can employ it too?
> > 
> > The patch description states that it was not tested on video-mode yet,
> > so I assume it will.  But this should also be highlighted with a comment
> > (e.g. /* XXX: Allow for video-mode once tested/fixed */), _especially_
> > on the check for MIPI_DSI_MODE_VIDEO above.
> 
> Sure, we can leave a comment.

Thanks!
> 
> > If I understand this correctly DSC is not working for video mode at all
> > on these setups, right?  Or no-one was able to test it?  I'm inclined to
> > request dropping these artifical guards to have as little friction as
> > possible when someone starts enabling and testing this - and less
> > patches removing artificial bounds in the future.
> > 
> 
> Noone was able to test it. Like I have said before, we dont have or have 
> not brought up any DSI DSC panel with video mode. DP will be the first 
> to validate the video mode path for DSC so even that time we cannot test 
> DSI with DSC on video mode.
> 
> I think we should find a panel which supports cmd and video mode ( I 
> believe one of the HDKs does have that ) and bring that one up first to 
> validate this.
> 
> I believe we should keep this checks with the comment you have 
> suggested. If someone tests it and then removes it, I am comfortable 
> with that.
> 
> Till then, I would rather guard that configuration.

Sure.  On the one hand my suggestion to drop it would be to simplify
DSC video-mode "bring-up" and not put up arbitrary barriers, but for
distinct optional features like widebus it makes sense to keep them
guarded so that a developer can enable them one at a time.  I'm just
afraid that them being spread far and wide across the codebase makes it
hard to find all the places where this guard is in place.

Unless it is hopefully one of the current active developers testing
video-mode, because we all know what's where now :)

- Marijn
