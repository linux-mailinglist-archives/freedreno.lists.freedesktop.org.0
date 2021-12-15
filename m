Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168A4763DB
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 22:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D3F10F8BF;
	Wed, 15 Dec 2021 21:00:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2326E10E992
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 21:00:20 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id eq6so29512qvb.7
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
 b=a/2+RNh3pK+JrLvCLpck3va3w4anjHVD0+0YBAgFvx8f2pAlohe0DcYchXO9SeXduM
 ev1+igfhnC6x4YhWjDMGmuLh45hjB3t5WR7S5uNyqf/gp0/EVh6KIGTD0CENNM5jyJj8
 CV9es3d6MQ3P9Ln9sR+KpdMPQ7S0yAnsg+MkPDu1W9lj3HSyl2BEo+KGyZzHaDB5BNe2
 aiQCxXVql3d+TKeaQRVpGtf+vXsvSRDl9DWMyaxJl0/2AH7WXwA/izqqp3i9n+6q1ItK
 8Sc2AowhtYP0aQTBi2jSZeeVWqe0mt4/+BF1919vlm2R0SmdjDS4KQrO5GbgdSdkSRJc
 c6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
 b=Tc4OXP8WT6zq9nGpVN6F0MhCIag4zrwvMR+kLiwp2RjcnAPALw2/X1StzvcRgga7uk
 KMUvlE5eMXQfmF3cg1O1vUOpg9LuGUZlb5FvqWTOQdBcgZXOpGB++kp/L1YAxNvlAZ4y
 FVqcNYNi2YLQKPs5umofReN4L5Nf6hBHsOK5uWJB3EWWzb4EmCfCN+qy7wlgE3LqP5FE
 Ku11xfSSVJg0wzrGwEpcQX9vwdT5TbKPAEfRumufbhU3YV++utkcY/9JSl4BfkIBiRsl
 5E6ACBJPZK04zXCN1wh58clvTdsRqTI+Bisugm4bndvljTSKqwhyfq7Xj9NDzrmZFNh/
 BSQA==
X-Gm-Message-State: AOAM533fwKZXGm45lMiaDHLSEBrsVVThY0B12Ls+PtbucVq5B+IFdIK1
 I6suLjYO35H9H31xmpJHBG6fLEoKgf5QH3mLtKyIqA==
X-Google-Smtp-Source: ABdhPJyDhI9R3Txh4WJoBPNSh6gRhD71ZHtF2dgljmcfj5zlKeDw7UcLIm7GxAe+s2Lh+pPgnrjAChNfcxXxo5CYtSQ=
X-Received: by 2002:a05:6214:83:: with SMTP id
 n3mr13069392qvr.122.1639602019162; 
 Wed, 15 Dec 2021 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-2-robdclark@gmail.com>
 <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
 <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Dec 2021 00:00:08 +0300
Message-ID: <CAA8EJpp-PurZt4_EEbZS3Xnqc9tZgBxW2p6j+k20ZUZ8NqZ2=w@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Dec 15, 2021 at 11:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add UTS_RELEASE and show timestamp the same way for consistency.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
> > >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > We should pull this out of disp/, it's no longer disp-specific.
>
> Or possibly just move dsi/etc into disp?  It is disp specific in the
> sense that dumping GPU state works quite differently..

Not sure about this.  dsi/hdmi/dp seem to be perfect top-level
entities. I see your point here, however I'd rather prefer to move
mdp4/mdp5/dpu1 out of disp subdir rather than pushing all non-GPU code
into disp/

When I tried to move dsi/phy to a separate phy driver, I reworked
msm_disp_snapshot by splitting some parts into lib/ code. But I can
not say that I completely liked what I did. Partially it was one of
the reasons for me not pushing the dsi/phy patchset past RFC.

-- 
With best wishes
Dmitry
