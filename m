Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F96A0CB8
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 16:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D1710E057;
	Thu, 23 Feb 2023 15:19:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277588FAE
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 15:19:02 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-53852143afcso53612217b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LwN6HfLSUE5ZKSAzD6kxZTBLoYaNfg1FJI6Ev8TDx4M=;
 b=hY5XLuPCYfHmjKHQuLwKYFlB4WfA4hoN+aNfzERLVE6508A9iiPyioey5culYB5CI+
 ESYRSZAB2d9XOnbo+cPZOt5OLd7wLWB7difGrXDNSB7/03o81Ll8EMoLuzLSK2QUGew9
 awH6Y8ox1ORqwCp48m3OlXmzoIArA44JwGCBbwPMQ6k/CBSrsn6n1K6I40hBbX92WHjT
 DZ76eQqiDDhgz+O0wScTmQJ73Oa6UEiDlkgSHwECcXczHmoGueOLa/ZMalhUxiInxmv5
 MzDYTNI52JhbmS6KV9LughkC8xGgkDEItI0FrO9gg6tlDmWfV0LX6bJHB0udKm29d9zM
 Bz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LwN6HfLSUE5ZKSAzD6kxZTBLoYaNfg1FJI6Ev8TDx4M=;
 b=Wm70lcjbiNt0mbHFgsmTfcaasVZrdye8Qr68yF5Th1TekPQGHoe5KznkPgM5BFQnIW
 yhx7LgW/QmC9D9Nyb6iGuQEcIBpIUpvEPV0KPh8dW/VhZ0FP0/ZAjbospfyxTb8oHqT8
 lPWTwUavy5Qy1QUUa5ncsTwS1wJslG1OOcVoQsIzyTo9k7Jbo3s+6BhTvf3DbbLeYegc
 lkLUuDfI6GKL3vQ5Ohpm0sslllWisCRdAX2EKXv60vwxO6eJpMwLfkmSdcTjlZJAUHk9
 RNAEsvg42RlfcHt9v+NxTOiTce9VQQFOjsXTZUgFCXi6IbzuuM3UA6+uwAc7f/H5KPLQ
 2wtA==
X-Gm-Message-State: AO0yUKXSK6dEIDWWvfykDEA2TbZ/HdNVfTlXln1javRGV9hVk0VhG0jk
 Ssn+pthRGsIB06arR8A0l30IUB5TA3hRPMYj6A2cLQ==
X-Google-Smtp-Source: AK7set/MGnbOMGB+D2Et65I+FbFHFBA3n+THAUTHlhkT5fuvYhaHgIJXj5QE6uw1NwL5PDsQmt26jDgvePFLaYbOwRQ=
X-Received: by 2002:a5b:b8b:0:b0:a28:737a:b214 with SMTP id
 l11-20020a5b0b8b000000b00a28737ab214mr1359757ybq.10.1677165542095; Thu, 23
 Feb 2023 07:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
In-Reply-To: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 17:18:51 +0200
Message-ID: <CAA8EJppZ+Hyhb9MacaFX6xTrJ9XyYbbCRrBvO+yE0=-Bztk7CQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 0/2] drm/msm/dp: refactor the msm dp
 driver resources
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, sean@poorly.run,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 15:57, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The DP driver resources are currently enabled and disabled directly based on code flow.
> As mentioned in bug 230631602, we want to do the following:

private bug tracker

>
> 1) Refactor the dp/edp parsing code to move it to probe (it is currently done in bind).

This is good. I'd suggest splitting this into smaller chunks. First,
move all resource binding, then move the actual dp_aux handling. It
would be easier to review it this way.

> 2) Then bind all the power resources needed for AUX in pm_runtime_ops.
>
> 3) Handle EPROBE_DEFER cases of the panel-eDP aux device.

This is not handled properly. The eDP aux probing is asynchronous, so
you should move the second stage into the done_probing() part, rather
than relying on the -EPROBE_DEFER. There can be cases, when the panel
driver is not available at the DP's probe time. In such cases we
should leave the DP driver probed, then wait for the panel before
binding the component.

> 4) Verify DP functionality is unaffected.
>
> These code changes will parse the resources and get the edp panel during probe.
> All the necessary resources required for the aux transactions are moved to pm_runtime ops.
> They are enabled or disabled via get/put sync functions.
>
> This is a RFC to verify with the community if the approach we are taking is correct.
>
> https://partnerissuetracker.corp.google.com/issues/230631602

This link is useless, since its contents are not public.

>
> Sankeerth Billakanti (2):
>   drm/msm/dp: enumerate edp panel during driver probe
>   drm/msm/dp: enable pm_runtime support for dp driver
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 155 +++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 185 ++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |   7 --
>  5 files changed, 250 insertions(+), 110 deletions(-)
>
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
