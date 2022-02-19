Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B44BC377
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 01:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0AA10EABE;
	Sat, 19 Feb 2022 00:34:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0EF10EACF
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 00:34:02 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q5so4866323oij.6
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
 b=HfSALada/6cdeAWOKMWVGJzL12lUov2M6fbxXPfW2tmBWRqARWU+NKd3/1Vy/kDmRb
 3p/eOHoOWPVhINTFz7+naFVDuNjT5wcLMkNyAt/SGqPvvJ7MXFxlsUxHTMT+UmgnGGDk
 qHyGd4NQRt6w1lA1Q0iPNMVDQadOxp/FbcvMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
 b=JOKEZAiTXseInK2XNE9ljg1+r80Ui+3AZ4+Al2HXU0ZYghJi61dzlWu29U6mUdEW3l
 hsARi3k71Sv0Dx21Nt+Ar1NhSFE+tDpYQuYxWeYNB9hqZQ5lPC0hx2IpR5I+aFWKTyjp
 X/58zyJXa6u7r0p06Wwj1FGDPQbwtiGw4zW5uad6DIEwBAQcSFPRSbYNg7u58/LeSJai
 kYKrTW+K6BsjsCL4l+Nt9OwS9TNx2VAFc5DKPQPPd7DHyRs0mWO3JHsG8zYthoWbkFbI
 3f1qUk4kBBiDqceoWn0y3byxxxYo+W+tspLMwO/K/FK6aqOpEcfwIPzdN8oFzFaH8tol
 FZyA==
X-Gm-Message-State: AOAM530OHLZEpl49PySkEO6d90yMViIsgFAfeiK4zHaCXTbQUtj9bNC8
 mq02p6aPqsojxLrZCOMlngAWESK1AouOOAD2VB28HA==
X-Google-Smtp-Source: ABdhPJyLUHKLgsnFWoq7fgkInpdSdDIj0KpGrczwZENMDX/brDIe6HYXp+lshMaGOJ+HdFljHgy4t77LBqEvf2IZHBM=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr445075oiw.112.1645230841936; Fri, 18 Feb
 2022 16:34:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 16:34:01 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 16:34:01 -0800
Message-ID: <CAE-0n52NCAMXjEWtt_L-KcW0=FRw3o=fQOMBzX+9SkjH8BVhwQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v2 3/5] drm/msm/dp: support finding next
 bridge even for DP interfaces
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-11 14:40:04)
> It is possible to supply display-connector (bridge) to the DP interface,
> add support for parsing it too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
