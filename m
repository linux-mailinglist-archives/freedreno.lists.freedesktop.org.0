Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B2457ADC
	for <lists+freedreno@lfdr.de>; Sat, 20 Nov 2021 04:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53DD6E8A9;
	Sat, 20 Nov 2021 03:41:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Sat, 20 Nov 2021 03:41:13 UTC
Received: from smtprelay.hostedemail.com (smtprelay0065.hostedemail.com
 [216.40.44.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169546E8A9
 for <freedreno@lists.freedesktop.org>; Sat, 20 Nov 2021 03:41:12 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 6B8DF181A8B34
 for <freedreno@lists.freedesktop.org>; Sat, 20 Nov 2021 03:34:27 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 25F08181A8B08;
 Sat, 20 Nov 2021 03:34:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf20.hostedemail.com (Postfix) with ESMTPA id 6FF0F801921E; 
 Sat, 20 Nov 2021 03:34:24 +0000 (UTC)
Message-ID: <a14da924805afdc39d7df800d3d4b7dc81c3dbf1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
Date: Fri, 19 Nov 2021 19:34:23 -0800
In-Reply-To: <1637363916-18257-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1637363916-18257-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6FF0F801921E
X-Spam-Status: No, score=-1.89
X-Stat-Signature: ty5f3kaua5ywwhsnr7axqu4sdhpfxtw9
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19ONcUnkDqSylS7FefYZckB+A9ZdWXuflY=
X-HE-Tag: 1637379264-765151
Subject: Re: [Freedreno] [PATCH] MAINTAINERS: update designated reviewer
 entry for MSM DRM driver
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
Cc: gregkh@linuxfoundation.org, swboyd@chromium.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 2021-11-19 at 15:18 -0800, Abhinav Kumar wrote:
> Adding myself as a designated reviewer to assist with the
> code reviews for the changes coming into MSM DRM.
> 
> Acked-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -5938,6 +5938,7 @@ M:	Sean Paul <sean@poorly.run>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
>  L:	freedreno@lists.freedesktop.org
> +R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/msm.git
>  F:	Documentation/devicetree/bindings/display/msm/

R: goes after M: not L:


