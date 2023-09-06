Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A8794573
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 23:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742D10E70E;
	Wed,  6 Sep 2023 21:54:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9110E70E
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 21:54:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50079d148aeso398945e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037261; x=1694642061;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
 b=Fz40QQkzPYnexteuIJ4DUa3qj78MNM1BJATjklogNPYBf96YJPf2WjUVbnL+XDD4IH
 7TIhooYzZbYlZuPg3sHxFMHKeqeiXydNiBOear18ag8F7ocwFB+bpVYlDConJOkg7fzS
 O9C9/48Jw1up20LgsBkCiEo8VLD3rjUkDT6Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037261; x=1694642061;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
 b=HwQeKoPBLKXLkeryY/mohSLCvmhWtlkfZlhRrreFDzPMHFALGD780yE6lcxrDMiB04
 bMICJbyZrPW/GhdDge204V97HeZaDXbKseqlEZ5WRAKQph1gFQJ3QxiLHo+QIKjnlEBl
 njVq8cRIiVY/TAXZIV8fGa0zE29shvBAYU/zsx6th5SVQFNQcasp26lQ4GmPbivc3URZ
 mNtC4/qXZg62rM3yKK9XygrtSdVW8mc+mLoLeSuhICR8yLHwYWmMEWWGREco2OGRbLRY
 7slGa6bE9rMGG58lHc8KNYbf9eEp8RZSDa5ma9dKfrMJBCqnf0k34btE6hPb8Nt9T3Dz
 YMkA==
X-Gm-Message-State: AOJu0YyOE9BymhiU9fYGKJUQ0ra/kz1sp1IwbWvGJOgWOgosNOX7zN3F
 5PDtVSJHVP9Cc9E83cizoYHSxO4C6Eb7z7QOKNCtEA==
X-Google-Smtp-Source: AGHT+IGXEYQwSmCl4dKdeY9V+gR3MIjglme5MGP+iBVm4TEGUm6JjAd1CBrovJy6qUN+sXnPG36Am8fUTFYgiyGfd1o=
X-Received: by 2002:a05:6512:3c8b:b0:4f6:3677:54e with SMTP id
 h11-20020a0565123c8b00b004f63677054emr3816276lfv.36.1694037261406; Wed, 06
 Sep 2023 14:54:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:21 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:54:21 -0500
Message-ID: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> Rather than checking for the flag, check for the presense of the

s/presense/presence/

> corresponding interrupt line.

The patch checks for the major version though?
