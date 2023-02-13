Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B06951D2
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 21:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4A410E2FE;
	Mon, 13 Feb 2023 20:25:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8B610E70B
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 20:25:52 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 139so14354003ybe.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/0Ws/YlbYYoxDYDAzi4lHOOroimYy2NYmSbxJOySDP4=;
 b=FtxD+4keDj4WORQa3590d18w1Tgvlh+vZeAuVrxN6og/aSdvNMP1Dk0n3WC5kqOkxN
 qdY2ivrbuuH3zqFaBLo5rI/Rguy/C/JqGn9eKiXAlXI6ZhSs4rcbOTbNEWNvC2+eJn8c
 Rl/J74HQm5QH+/eIFPAjonIKpObtvg2WPjyE1Lfmhu8dAwh9vQn5tNrY12OvbjusI2D7
 oIRihtsZ9OccWOerJflZGAl0Tnx+6wQMDJQFo1ZvYS24EMrJEF4kFbFE1Zye1TfHqtv9
 ra8KahXUSZqA5WGsALtahPuMRATBc1pSk1uJ+BeJiGgRbxcKp8FP+B2Iz7yQbbbT/m2V
 w4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0Ws/YlbYYoxDYDAzi4lHOOroimYy2NYmSbxJOySDP4=;
 b=aFSAS3lBFuRgCmZXoFFqSRxfKUwg37XpgnbrtU7kTp8YiYy/duOwcFvdLI3vJ/y6sI
 hnstNFRK6BkROmYUTgAOfrU1wvcZ09GRP9L/WH8eTjkYbKrBsFckwmPkZzvBvG+XP1IG
 8cMFrOYsDzoqcla26ROSkMsmX4GuKsK8nievwPovB4CRBN35Ty0AkkrOpp+kk3h/VnyN
 /koVfUfl+bEAFKblbkjs8v8QtY0WAgRXw7+1TuL8VtKd9TomTxwkv6NRTB0emIw/diSB
 H2bN5eiOzazMzklYf039fP6xGzemQgHKuBvZHxC4eSIvDtpahv5E/3c88QsvSU60Dcjm
 UoDg==
X-Gm-Message-State: AO0yUKUSdGiz9bbeASVofNvESvKGIdBl/z6rmUFGpNiMRvLMX1Js6IPj
 XlGfeuSRTfNIwlaAo+OHV9+SLvGulI9s1dB8YyhBsg==
X-Google-Smtp-Source: AK7set/J+/iYGG/w89J6BRAoLZRY7PDAaMX8d4rSeEC+A9phEA8KjwshqjneIfaPRQlFeIYiRbKJH52D151YyS4LfTQ=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr13117ybo.382.1676319951658; Mon, 13 Feb
 2023 12:25:51 -0800 (PST)
MIME-Version: 1.0
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
In-Reply-To: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Feb 2023 22:25:40 +0200
Message-ID: <CAA8EJppF-UuoooGaX6ySo7CqfnSPBoJiVYBb9QRdyqvWBYAXEg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 0/4] Reserve DSPPs based on user request
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, marijn.suijten@somainline.org, robdclark@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 at 20:12, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Feb 13, 2023 at 3:11 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
> >
> > This series will enable color features on sc7280 target which has
> > primary panel as eDP
> >
> > The series removes DSPP allocation based on encoder type and allows
> > the DSPP reservation based on user request via CTM.
> >
> > The series will release/reserve the dpu resources whenever there is
> > a CTM enable/disable change so that DSPPs are allocated appropriately.
> >
> > Kalyan Thota (4):
> >   drm/msm/dpu: clear DSPP reservations in rm release
> >   drm/msm/dpu: add DSPPs into reservation upon a CTM request
> >   drm/msm/dpu: avoid unnecessary check in DPU reservations
> >   drm/msm/dpu: manage DPU resources if CTM is requested
> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 38 ++++++++++++-----------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 ++
> >  drivers/gpu/drm/msm/msm_atomic.c            | 18 ++++++++++++++
> >  drivers/gpu/drm/msm/msm_drv.c               |  2 +-
> >  drivers/gpu/drm/msm/msm_drv.h               |  1 +
> >  5 files changed, 38 insertions(+), 23 deletions(-)
>
> For whatever reason when I use "b4 shazam" on your series it yells:
>
> Patch failed at 0002 drm/msm/dpu: add DSPPs into reservation upon a CTM request
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:573
> error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>
> ...but then I can apply it with `git am --show-current-patch=diff |
> patch -p1` and it just applies with fuzz. Presumably Abhniav / Dmitry
> can do the same but it would be nice if your patch applied cleanly to
> msm-next.

Hopefully it is not some 'tested on 5.15' story.

> In any case, I tried this patch on both a herobrine (sc7280) and
> trogdor (sc7180) based board running msm-next (including the sc7280
> patch [1]). In both cases the night light on the internal display
> worked fine when using ChromeOS. External night light didn't work on
> either of them (as expected) because we don't have the compositor
> support yet.
>
> I'm happy enough with:
>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Thanks for the testing!


-- 
With best wishes
Dmitry
