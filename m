Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304B52E116
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 02:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D982510E3EB;
	Fri, 20 May 2022 00:20:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303F810E3FA
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 00:20:48 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id n23so8936681edy.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
 b=HXRvwBSe1kdLw+E5XZQUg1aqD+Xzx1EPDD38vER8o23tEByEWKBd7UsuCsmlQjS2IA
 UrFRDsWb1JfLL64GhKqULVkddtRl8NXbTC9LPYW7SISZVG8H9KSTco/tZyI1GcTczIEC
 gnDMhQk9vYaGXJfrN3vT+O6EmsVeRrRGlccwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
 b=vh6tABWLSDz/Q3uylOEpzgFvbpe61n5olc0WgAhl6uCs/AV/7DhQDdmLnMk8zbaURD
 0O9ti8ez8xQi+Afc3N/S86aG/EF61YSKktI7Z/zFbo9qRs2QQtvQpvaOM0m4IpdqGH8H
 Gjrj27ESP8JduhmgicILSG0n/qYevaqBpPK5rCN8Qnufal10/jhfprPUF0HYsyXVNrp+
 iy8eLrhcsIjebPogY9Fc0cRHzhy7fWqeCuJFCKgW1Mtf8wsZVedQdcChebFqbe+VIXvV
 eNJk0vFDKE8vnTzFoZLDAb2xs9CJ62uEJxSciwGxaTpnsvEPQJkTWHZBiHiUFFOY6TQ6
 dmlg==
X-Gm-Message-State: AOAM531gmSj8TLDCjMq3yQYMEFQkDOdz24ky7vTOH9bqdvmh3IaHAOwX
 e9vCcVARsy/W7uknicaYO77nBgC7fHtqFuwKOGc=
X-Google-Smtp-Source: ABdhPJwF4TUcE9RDz/S3d7ICvgyV11DLRkrqSTocRLuaYabVJ/dZg/Jx6S+7POJBBLyofad4qlmlrw==
X-Received: by 2002:a05:6402:31e5:b0:42a:b724:c567 with SMTP id
 dy5-20020a05640231e500b0042ab724c567mr8081540edb.347.1653006046520; 
 Thu, 19 May 2022 17:20:46 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 eo8-20020a1709069b0800b006fe78f1123fsm2532343ejc.197.2022.05.19.17.20.44
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 17:20:45 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j25so9359931wrc.9
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:20:44 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr5985688wrq.513.1653006043655; Thu, 19
 May 2022 17:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
In-Reply-To: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 May 2022 17:20:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The drm_helper_probe_single_connector_modes() is a bit long. Let's
> break a chunk off to update and validate modes. This helps avoid one
> goto and also will allow us to more easily call the helper a second
> time in a future patch without adding looping or another goto.
>
> This change is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> Changes in v3:
> - Removed WARN_ON
>
> Changes in v2:
> - Two underscores for __drm_helper_update_and_validate().
> - Return err and use WARN_ON instead of returning a bool.
>
>  drivers/gpu/drm/drm_probe_helper.c | 106 ++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 46 deletions(-)

Pushed to drm-misc-next:

4a2a13a57b60 drm/probe-helper: Add helper for
drm_helper_probe_single_connector_modes()
