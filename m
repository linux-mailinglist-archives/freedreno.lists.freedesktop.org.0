Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE1E476172
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13DE10F8DA;
	Wed, 15 Dec 2021 19:17:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631B110F8DA
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:17:49 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id t34so22919361qtc.7
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
 b=UlCtoyzOkFrWyGOVFaJU8qsLzBhhoHooghGXITRKZE1Zq83KKPIb7c0zSx3QLeLT8L
 Y+xCxzUh1a6yaaBd3ZKqWBQN6fihrnKTkT7bhYZKbKdPrk9urj6tVs+v4zpgImJsz7a7
 gk7RQntBh0cyirDkrQeVsT/0aGZGbZHEDVAJrAs6SkRLSOrSp40EOM0zB+Hd28B52FNz
 qblXXrz6FFNXCQI5Jl/44mtLAArvcM4LRQ3XDj1+rv9YDKjnBpWUNatahXv3R8u+Uumi
 CRZ4Gj7RSyDxX8D+ydnP9DyPYCdMOiBYxPGc6TEUbmAh78HgRXO31fa8FpRejHglm8fg
 3bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
 b=K2jhDM/cxEfPTu2COrsh849ztkHETpAZkdNVsgJGTBVc7QnGE2gTUzzbn5ku6reaJ8
 cmkAO5QnyyZqbMgHUMBTmh7S093UlPgaYRMLNo/iFHrk/ng0doFwNwlhsjHysVmvw2+E
 n1d9O1JDVFum/h6OgyEhDkuZFxqPQJHyiNyn1z+6SfXUiIXEJCtJaSFtySBWq4jldnz6
 Enngrc5I+vlG66FZ0V5CAZ0dBC15YwL1AT6IhOmQTX+Rgnq7lixrxmc+1KDba8sfggwv
 H4YTGG8EVw+TUAwJbx5ncmmZARAmyZjlAM/Ym6zRoFAkqdSZwPjjYhFU6Kuq+Oh2s40q
 YlaA==
X-Gm-Message-State: AOAM531j/Exim0nUQ7D0oDZaldM4OqkQxgvSk1UNsWxNd6uHJMcAievI
 SZN94CumgpiK1NFq6bAS91b/jxU0D7ar72IJyssC2Q==
X-Google-Smtp-Source: ABdhPJzQ6zkCPECZcOmZlwDiF42Ds+mkiAEnmTOqZu1jr5lAXLAvu/wLfGhsMecRyWc/+WsXDPDGT2QtSA8ScDqEFfo=
X-Received: by 2002:a05:622a:15c6:: with SMTP id
 d6mr13380932qty.439.1639595868469; 
 Wed, 15 Dec 2021 11:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-2-robdclark@gmail.com>
In-Reply-To: <20211215174524.1742389-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Dec 2021 22:17:37 +0300
Message-ID: <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot
 to match gpu snapshot
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add UTS_RELEASE and show timestamp the same way for consistency.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)

We should pull this out of disp/, it's no longer disp-specific.


-- 
With best wishes
Dmitry
