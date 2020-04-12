Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2FD1A5FFA
	for <lists+freedreno@lfdr.de>; Sun, 12 Apr 2020 21:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC436E135;
	Sun, 12 Apr 2020 19:19:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B86E135
 for <freedreno@lists.freedesktop.org>; Sun, 12 Apr 2020 19:19:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586719161; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YliS61QCQYD8IvrSZrsXQtbU5Db5p1TuVwVrC572Azs=;
 b=aLoPow6gWxheJ6TE40t6r8cuAlA2fhbxtAHdE5N5KAhh4AUUukf03kHfV/+6ZEaXRaY0E7uv
 kT93tW8i5+z1/2E38FTCPSP6zo246ZfMGdbNeASiJMymtWORuckGWFy3aS9DKHFm7ktd29i5
 zBmk3xsCtDhZnDqkjNI46PYj6vQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9369af.7f61c38f5dc0-smtp-out-n01;
 Sun, 12 Apr 2020 19:19:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AA379C43636; Sun, 12 Apr 2020 19:19:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 252B6C433F2;
 Sun, 12 Apr 2020 19:19:11 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 12 Apr 2020 12:19:11 -0700
From: abhinavk@codeaurora.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
References: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
Message-ID: <22cbe4e4310b7d475c02da6bf44c44f9@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix typo
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, daniel@ffwll.ch, sean@poorly.run,
 linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-04-12 07:35, Christophe JAILLET wrote:
> Duplicated 'we'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index 998bef1190a3..b5fed67c4651 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -959,7 +959,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc 
> *crtc,
>  	if (!ctl)
>  		return -EINVAL;
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
> 
> @@ -1030,7 +1030,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc
> *crtc, int x, int y)
>  		return -EINVAL;
>  	}
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
