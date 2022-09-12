Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC05B5764
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 11:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40F510E336;
	Mon, 12 Sep 2022 09:46:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437D710E336
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 09:46:51 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id g5so11828367ybg.11
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
 b=J26G1kaMCpU/huj4irkHRikMR78rM4qjrNcAAA16uuwYo4KHGrkB3MD9z261dObhPe
 FQAde/ufBcq+XuvrIokPHQFZLQMAjc3yw0uWhax38vmOHboiVGCgfafR4ktU0G8or/jT
 EALcdewQZ9sss/15BthDtZ6ymq1psQreDc5PFYlhhOx8jf5yXZdu/Oggf9ZA7Tcr5TKl
 Ip0gx3FfwYUrEW/yCRx5WEK3qg5KoADWFgUY0QVJidOVzWZLI2HAUMdTA8YO14nVTNJx
 SmPGSQVsXoChrCjaH0R55SM2+EYpVcIsSCEUeyPwHxrcMeVshcqPhsdLrNsCvBwoc+Vj
 n8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iXsYZi2SjRrdhC6YtOInbb+wwHPsXuEDE2PJyDVsjPc=;
 b=C5uhf+BRdirmEi8hc11d99jtT4dpMHQt0Tuy5FZ2p+eVJaJnXT0pYea7L97SWhjGBa
 Uq08cs/JeIWjUAkjkUOUPDfZ4M4HFh1CvTwVnNnUAZxVZC8UIjc8zILC7EgcOIK7nM6j
 P6uHpv6L5Rrd0zpSpRqwBxQ0zVhVVKQqFxUooPnns6NhdDI2/v+RsoKOEq/8RTst5tBt
 DSOH1xIVkKGdmZP7k5WT8FP+olog2kfU4HzipfphHaRmPkTyVABjv8B0uID89FyP/5vi
 QLjF2jt232uSIU+VgFj297aZctnGjBAtYzm6/o8Qb9wRslpwLNsusEIrf59BV7Gmw3iA
 BHzw==
X-Gm-Message-State: ACgBeo3YlOVYr18xt2g0QAIYL9rMgbLAsVpeVOaSkk/n3ZQj6YpBA7fT
 zK7BLQeQECzlIs6GUrIlvaUdd9Q5dKqBDXveA8ZvRw==
X-Google-Smtp-Source: AA6agR7RW9+RmdeYJyXDjxjNa3U1UZkW1XIRfbT2VSl9GyvcI1tMz5HBJwbMMG2bNjXo+8COy7PU0giK8+qyA3nCQfQ=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr16075200ybh.288.1662976010418; Mon, 12
 Sep 2022 02:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
 <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
In-Reply-To: <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Sep 2022 12:46:39 +0300
Message-ID: <CAA8EJpopeXeaec8Yhsu-aQsN8j4v74nBZ0TBSz0WHKiwq9f1wQ@mail.gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 0/7] drm/bridge_connector: perform HPD
 enablement automatically
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-msm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 12 Sept 2022 at 11:51, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 29/04/2022 21:51, Dmitry Baryshkov wrote:
> >  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> > DRM driver do a proper work of calling
> > drm_bridge_connector_en/disable_hpd() in right places. Rather than
> > teaching each and every driver how to properly handle
> > drm_bridge_connector's HPD, make that automatic.
> >
> > Add two additional drm_connector helper funcs: enable_hpd() and
> > disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> > is the time where the drm_bridge_connector's functions are called by the
> > drivers too).
>
> 09077bc3116581f4d1cb961ec359ad56586e370b ("drm/bridge_connector: enable
> HPD by default if supported") was merged in March, but I think that one
> is  bit broken
> (https://lore.kernel.org/all/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/).
> To get omapdrm work without WARNs we could just revert that commit, but
> I think this series makes things cleaner.
>
> There's one small problem with this series: in drm_bridge_connector.c
> the drm_bridge_hpd_disable() function is called from
> _drm_bridge_connector_disable_hpd() and from
> drm_bridge_connector_destroy(). This causes two hpd_disable calls when
> removing the driver modules. I think the call from
> drm_bridge_connector_destroy() could be removed, as
> _drm_bridge_connector_disable_hpd() should always get called when
> removing the drivers.
>
> Dmitry, are you still interested in this series? Can you rebase on top
> of current upstream, and revert 09077bc3116581f4d1cb961ec359ad56586e370b
> first?

Hi, I've been a bit reluctant to continue this work after the
mentioned commit got merged. However of course I can update & resend
this patch series.

-- 
With best wishes
Dmitry
