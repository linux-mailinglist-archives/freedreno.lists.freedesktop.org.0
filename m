Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D986F4469A1
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 21:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698256E525;
	Fri,  5 Nov 2021 20:26:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058E76E516
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 20:26:13 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id 2so8746581iou.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Nov 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
 b=ZDCN/m0tmqnKaMhe26FXs3xZ5Si8fvJfzleOAKObY1a/TB05o9H4RU9PduYZUA8Ri/
 bRLZ77CghW64RM1dj3p2bmSYjZU4v6wqLhkQcNTMlCTsLe5+9QXsX3dRNmrdyjFIUm27
 ngqeVF/UcylsMcCudABfAf4UBFkDA06ibJIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
 b=bh5HNG14NuLkr0Y+domJM4HpV9FcEy3dUhUYvARxZXXqYgK1nD5sgldKaMPQ0HKmm4
 ZAr04dt+m+tg0/qvDwrpnu0uDQbjGdi8+xuagcK4Rs1AWoj3gyoGYLUcTIRfPdsa/q4S
 IQoJRX5djIsN7DD9/sXqVH0R/DzD2UcwaIXW9re0dy6qWXJKKWWuDP+UjQOG2NpfKUSn
 90StDXdf7mECFb0MKPjNMBzXVTfgRgTeiuFF6OcjzbKKwJxtSftjlvxnFgVB55ia5Cx2
 Kb98cIsYbhXLwyBIMkZwGYU1whjnuVRB1PRoZ4RB6kSFjpgt80icBI1WfUSgnVIO2bo3
 YTmw==
X-Gm-Message-State: AOAM532F3tqICdgeIhTsFg5upganmpq+GpSpAy5/uGbQdoArPPUTmGE4
 /cl4muu5Oa0OYNl01pr+X9Es3Osa7J2how==
X-Google-Smtp-Source: ABdhPJxABoM7gFkLLL4A+vNdrs5BII8FdaD9bz0rh87qHnqgy/cYg4/gZnzIlJEmYkegE9xflXnPSg==
X-Received: by 2002:a05:6602:3ca:: with SMTP id
 g10mr1088137iov.194.1636143973293; 
 Fri, 05 Nov 2021 13:26:13 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id g1sm4269237iov.23.2021.11.05.13.26.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id p193so12061508iod.8
 for <freedreno@lists.freedesktop.org>; Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
X-Received: by 2002:a05:6602:24da:: with SMTP id
 h26mr1098936ioe.168.1636143971873; 
 Fri, 05 Nov 2021 13:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211105202021.181092-1-robdclark@gmail.com>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 13:26:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 5, 2021 at 1:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
