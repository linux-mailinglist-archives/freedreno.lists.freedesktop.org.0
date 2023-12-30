Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1AB82091B
	for <lists+freedreno@lfdr.de>; Sun, 31 Dec 2023 00:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEB110E025;
	Sat, 30 Dec 2023 23:26:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8826810E025
 for <freedreno@lists.freedesktop.org>; Sat, 30 Dec 2023 23:26:46 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-781708819c4so232157485a.1
 for <freedreno@lists.freedesktop.org>; Sat, 30 Dec 2023 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703978805; x=1704583605; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KTwb/1u2PMknvKhR5t90x9dUO0vwpOhOGb+hJuRUYxU=;
 b=lbZgQe20L3YWSlaR9BcuPdHUOhXDusieWH/CRspF4ghP4lIcBXxA7MqP3aIlF3s35t
 m4zqpEExG0ZzHLL8wvDaRRSBAQpTnw3bNCQ3WTHsd7wjvRCTk5Eob7Zm9sZEn0E4xIJA
 9jWFxxoQC5U0RIGgkcNxlKjNPxLCXRWxFZJDFXBHM6FHHon802NeRUOfnjpU9IxtMDox
 mHjlO9GG+xX6wXnwhQcfFnfxbOQUqWQzhtKGhLTdAP4qGWNh8P2SKroW6+pjHYfsCAkg
 9uIGK8EuLaOX8F6iWHzv/J6WVr+nXuexupvneUO6QLXoILa1vwqqf8knYwHp63dsIO5W
 SJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703978805; x=1704583605;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KTwb/1u2PMknvKhR5t90x9dUO0vwpOhOGb+hJuRUYxU=;
 b=tpoOVsRwj+VODS4EJ7xFgIePvDrBqAVgRUBCkovaSlhPQNP3QeGPDWjydh6QBTWEoO
 AhZfjjb7+5c7jEN92PVTvKXZrv9tWx8RYhgUq9zMhkfSeJrdSsc+MfzIyFoO5blisDrP
 hm8cZxpii6EEvi0185MCeqo7NCX4ASmd/JMYZpXgg3VbIb64hooGCVOJSHOn2K4Ur+Xb
 rggE3YJq0v775ZiV8wK/hO1i08EEtim+xhbyFAzi7KRmrttIweOcSnSdmwJ69rbDE5+z
 5LXU7/HqHJovJRikx0cdvPCIv3HpqyNTdpLHm6WLkOIqW9lzZ/3tsCB/LFP0MWd39p4k
 ENvQ==
X-Gm-Message-State: AOJu0YwB7aQDm7xM4O2w5FqNI3KdmoFgy29Gcv/UJJCv2dj76CPo3Zk0
 AVNXitkQ/jJlI6V1vxE+zMUGzxWw+l7AmRn8hVyfab9aRBJadw==
X-Google-Smtp-Source: AGHT+IHfZmNgnYDzJsbgUA+6u2kNcOlsYvhBqdPB0W1kCemlcIXw9mDFBODf77CKWhl+4n+tmQXHWRYxg7lP99YlMdY=
X-Received: by 2002:a05:620a:8084:b0:781:2b26:f48a with SMTP id
 ef4-20020a05620a808400b007812b26f48amr17434362qkb.20.1703978805452; Sat, 30
 Dec 2023 15:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-6-dmitry.baryshkov@linaro.org>
 <d6447285-5485-4a89-b8e9-43625f00f960@linaro.org>
In-Reply-To: <d6447285-5485-4a89-b8e9-43625f00f960@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 01:26:34 +0200
Message-ID: <CAA8EJprUH_cwUow=93ASEdr8rEzcQcL8D65vJpS-8ZoTB1jPEA@mail.gmail.com>
Subject: Re: [PATCH 05/14] drm/msm/dp: fold dp_power into dp_ctrl module
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 30 Dec 2023 at 02:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 29.12.2023 23:56, Dmitry Baryshkov wrote:
> > The dp_power submodule is limited to handling the clocks only following
> > previous cleanups. Fold it into the dp_ctrl submodule, removing one
> > unnecessary level of indirection.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> >
> > -     /* set dongle to D3 (power off) mode */
> > +     /* set dongle to D3 (ctrl off) mode */
> :thinking emoji:
>
> [...]
>
> > +int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
> > +             enum dp_pm_type pm_type, bool enable)
> > +{
> > +     int rc = 0;
> > +     struct dp_ctrl_private *ctrl;
> > +     struct dss_module_power *mp;
> I haven't checked out the rest of the series yet, but cleaning
> this up with rc->ret and reverse-Christmas-tree (merry late
> Christmas!) would be nice
>
> > +
> > +     ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> > +
> > +     if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
> > +                     pm_type != DP_STREAM_PM) {
> > +             DRM_ERROR("unsupported ctrl module: %s\n",
> > +                             dp_parser_pm_name(pm_type));
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (enable) {
> > +             if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
> again, haven't yet looked through all the patches but this screams
> "if (enable && pm_type == DP_CORE_PM)"

I'd prefer to keep it as is, it follows the existing code and it is
also more idiomatic: we perform several checks if we were told to
enable clocks.

-- 
With best wishes
Dmitry
