Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1926B0732
	for <lists+freedreno@lfdr.de>; Wed,  8 Mar 2023 13:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DB810E678;
	Wed,  8 Mar 2023 12:35:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714FC10E2CA
 for <freedreno@lists.freedesktop.org>; Wed,  8 Mar 2023 12:35:24 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id t39so14429034ybi.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Mar 2023 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678278923;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
 b=wjrI5GBxcLK2TpY/oAthDy4jtf1z+fsJuQ9xjcbxHaIlP6smp1deqrOVtdOkNnjFIA
 2UrygRCRUkSvYhYIP206gLrLjl0xPM+AD4S5GNdOAcW4d8tIqfe3pZYgXtRsu5Y6lGcH
 j16ROAYlk8/QmUFivnX7oGT1kpc1TF2IyACh3W9NPSJUUaFMKuOvXh7itExrkzx08ERc
 PyntbpEt932gCKkR86biuXCM/rCAdWH4X1ofg+KEsTel8id7WapS80VxZU77UhUOU/Rw
 e70eEtSpzO80RkRXAQg+49btgEFiOrqzTapKjhJrIL/0rBejgJQOCpfPh+HJmAmXw0Xc
 tW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278923;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
 b=RNw22IfA6oDD5o2GKk7KR4uz9J6hcs8Xm+wMkeRbmDmXJd5aHYOJHcwFmf6wBQFSTA
 sKNnVlmiZ7YcsDRbiqKNfLOo3zhfJsVvlS9+gDSkWUzxD0HLJEeO1onC8KhR4EVlAy4h
 Q8ue3LS6R/g8GitoPxAfXbFHm/fbFLO8ksJGpt5FuqIXRPfdFmgUGSgMPqQw2xQyPkhE
 C5Yw++u/DaAoQVdqmtK5HnrBidiS9o56pi5vz+MWBLnoMR9HZvVXEj9c1CMY6n/ZZzhM
 RgZ8r7cVqwdKmeOxrct01BG4kfpVmHRcZgExTHWAsL1FKCRzPSBqvriBTRRmGCP/XhTR
 +WKg==
X-Gm-Message-State: AO0yUKVqPaiV/VrXFfGypa5+bhvFb4Ras+PmXNasVK+dYvLVVqlcELBk
 QepiMYcV63KEPyLysxzvdNjBbRvHIuLq63jgTQGwRA==
X-Google-Smtp-Source: AK7set+wT84PGBj+94QLZa9jjubNNjq68RKKqm41jG5BChuSqdm07c0307nCBlq5YlWDhnsqSvsRE1NW+v6KzhRiMcM=
X-Received: by 2002:a5b:70c:0:b0:a30:38fb:a0b8 with SMTP id
 g12-20020a5b070c000000b00a3038fba0b8mr11038426ybq.9.1678278923492; Wed, 08
 Mar 2023 04:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
 <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
In-Reply-To: <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Mar 2023 14:35:12 +0200
Message-ID: <CAA8EJprKDXYjd2zUdAGZkUEVt++XtA03RnCoYAfb-gJUz7tMsg@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-msm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 8 Mar 2023 at 12:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Nov 02, 2022 at 09:07:03PM +0300, Dmitry Baryshkov wrote:
> > The functionality of drm_bridge_connector_enable_hpd() and
> > drm_bridge_connector_disable_hpd() is provided automatically by the
> > drm_kms_poll helpers. Stop calling these functions manually.
>
> I stumbled over this one when investigating a hotplug-related crash in
> the MSM DRM driver which this series prevents by moving hotplug
> notification enable to drm_kms_helper_poll_enable().
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 93fe61b86967..a540c45d4fd3 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >               goto fail;
> >       }
> >
> > -     drm_bridge_connector_enable_hpd(hdmi->connector);
> > -
> >       ret = msm_hdmi_hpd_enable(hdmi->bridge);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
>
> It looks like you are now enabling hotplug events before the DRM driver
> is ready to receive them (i.e. msm_hdmi_hpd_enable() is called before
> drm_bridge_connector_enable_hpd()).
>
> Could this not lead to missed events or is the state being setup
> correctly somewhere else?
>
> Shouldn't the call to msm_hdmi_hpd_enable() be moved to when HPD is
> enabled either way (e.g. by being converted to a hpd_enable callback)?

Eventually I'll get to it (hopefully during this weekend). There is
one item which needs to be investigated, see [1]. I have to check if
this is applicable to earlier generations, which also means
resurrecting the msm8974 HDMI PHY patchset posted ages ago. I think
the initial status is determined correctly using the .detect(). At
least I saw no issues with this patchset. However, thanks for the
pointer.

[1] https://git.codelinaro.org/linaro/qcomlt/kernel/-/commit/6ae2c308555f470ba63f90b7171519a242f96a67


-- 
With best wishes
Dmitry
