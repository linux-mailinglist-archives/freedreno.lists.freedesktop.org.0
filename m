Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064027DA462
	for <lists+freedreno@lfdr.de>; Sat, 28 Oct 2023 02:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402410EA89;
	Sat, 28 Oct 2023 00:38:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CD310EA88
 for <freedreno@lists.freedesktop.org>; Sat, 28 Oct 2023 00:37:59 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a877e0f0d8so32781347b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 27 Oct 2023 17:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698453479; x=1699058279; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
 b=YWPFM34hjQy9CI3mwhoLpnmHjA/rzj+ENs3zbHl1S+IQdCcsb1omkKtsNBp4UgsaQT
 DL+rkqc6+BNl+/ZDWr3u2Q2rj/6hqcCQx0umQfEILjXS+3Vpksnjlg4lXSCL4AcAa/Cu
 xBxRo0tsVqEIVX3k3Lzd4ZpoIdT3UlbmuMJf2JHhJDKmnD4b0l+exxZfONdDMlcjxGhv
 dVh93nflvqbnyE/2AhUVaIa8CwxN3uucZJhCOyyRZZm8FzqejCnYMAncRz++IjWzKp18
 7HIt3qzF2uQSEYQtr4cHNjN8ELMcuntRNsHvyt6nYh4juT6dhrhNEEzaE9bUJuHeVsLV
 B4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698453479; x=1699058279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
 b=OvNwEWIG6mL11GRnPHgzpeTmQ4mRPqMptzcNLOD7403V08ycIIKF7uLE0auIJCcEhO
 Tcpugn8mFJb+3OPOBqpgkikvdTG15A2+jDGX8WDL+sR2ibn+Nwqiu5j+4x6/jNOUOpRS
 FDbiRCQp0mnJnVgiAxMRyRmbpb0VZtbUTSciUUeqBW5kf+bSJnJ4L24gEGq4If4KCcbD
 E+cKPOXng0TKb7TGhWEG/BA/opfD23/udyOVYrB2X5SozhBZ9Ri28UfGnTnfNEVqHDEz
 FqkuwnGnn6yag124OPc1JpIZ2JjUOO6Vj3Wis7Rio7rtrPr2Abp0Dje66+rzgVlMoZsK
 JiKQ==
X-Gm-Message-State: AOJu0Yw2iocU0dsz2RXFFawR/xMNnuQBUqjF1H3jEUqPJdAE7eLRVwrS
 4kCbSDhZpwP1UNGkkXYtlCQ4ftYsOx2NVVOQlZ0niw==
X-Google-Smtp-Source: AGHT+IE29XUeiiTmE/KmVbh4xF/1yO3eBtK3ViC6hAlTaHc1uavtyLD/MOuUAuFFiGdzA1p4cT87alBlLCasJvYcxRk=
X-Received: by 2002:a81:4328:0:b0:5a7:d8c8:aa17 with SMTP id
 q40-20020a814328000000b005a7d8c8aa17mr8366769ywa.13.1698453478747; Fri, 27
 Oct 2023 17:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
 <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
In-Reply-To: <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 03:37:47 +0300
Message-ID: <CAA8EJpqMXMU__zKU+_4rwjyg0kEB1HvRhUviRBwKnbjABS_xQA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dp: don't touch DP
 subconnector property in eDP case
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 28 Oct 2023 at 00:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> > From: Abel Vesa <abel.vesa@linaro.org>
> >
> > In case of the eDP connection there is no subconnetor and as such no
> > subconnector property. Put drm_dp_set_subconnector_property() calls
> > under the !is_edp condition.
> >
> > Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> >
>
> We still need to unify the calls to drm_dp_set_subconnector_property()
> for the hpd connect/disconnect places preferably in
> dp_display_send_hpd_notification().
>
> That way, we would have had to make this change only in one location.

Good point, I'd like to take another look at the HPD handling in the
DP driver after we land the pending pm_runtime changes. As a part of
that I'll check the drm_dp_set_subconnector_property() calls.

> If you want to pursue that as a separate patch, I am fine as well.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
