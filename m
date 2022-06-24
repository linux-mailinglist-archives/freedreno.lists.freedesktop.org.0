Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B907A55A240
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 22:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7207D10E0D1;
	Fri, 24 Jun 2022 20:00:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B230F10E0D1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 20:00:38 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so5129355fac.13
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oSfiCBI6rADUaj04vQ0405OWvsI1kvVtIUHFA11oGr0=;
 b=AzTPUiC43Gj/6Z9t+n4i14I6mGkZI/39weVhrwvNGDiaTV4vwIKZbNSfRAN5wtW1nF
 oDCOsFoC7WQUkXmCGuGxCvYrus4LASoYLkbeuSQnfDmRtkfY21qyLZ2A/1TkZLVaBiKV
 io052kql7sg6+CHv5tGOG8Qn3PSb0td2XoY50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oSfiCBI6rADUaj04vQ0405OWvsI1kvVtIUHFA11oGr0=;
 b=uymZFIfhArcasYtBkS4ejYqJzMgSVJ+mLzYqrfe3aSg0iReuqEQVw8rlMl6iX/zkmF
 Xbag8LkjiQE5oW9kZRzcXfmrMgyk7Rr1qv+EcHCcf6zB4PmE0tM2H4JX0yAfbJMraMHI
 ScmyikrTA3N4/lAWPSB5C4ME+Xrp1UF0dEfm982NUNmlS4BqRPrGuEWk6adBz/M2eyBq
 +QrJskTDhZBykKzLZW329/pjL545ceO+PBKSyTpQ7wA5e3dKEH4jKaHb+j9D3fWYNS0w
 hS3szcyq1j8cKCUoyz1d7N+gy5ghTmOuIAg+yjYjsFJMaD2gAxcbLvymbIWKDY0CyHhm
 w7Kw==
X-Gm-Message-State: AJIora+RdK+vvrBuJKtGTotjjpsoNN1HbgD4TlbH/NRzRENudBuZv632
 Nx7Yu9UjBQTsTPCsBIXTZo/CXAQl94jkchgNFcd9IA==
X-Google-Smtp-Source: AGRyM1vLrNlfEUnoqHSJ2ARj6K9GI68cyGAkEp1ju+dJRkgXCY63E4sSustNSy9m4JbTmpCAiuev4LGT2ZxCahAMIj0=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr461990oap.63.1656100837975; Fri, 24 Jun
 2022 13:00:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 13:00:37 -0700
MIME-Version: 1.0
In-Reply-To: <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 13:00:37 -0700
Message-ID: <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of
 dp controller_id at scxxxx_dp_cfg table
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 10:15:11)
> Current the index (dp->id) of DP descriptor table (scxxxx_dp_cfg[]) are tightly
> coupled with DP controller_id. This means DP use controller id 0 must be placed
> at first entry of DP descriptor table (scxxxx_dp_cfg[]). Otherwise the internal
> INTF will mismatch controller_id. This will cause controller kickoff wrong
> interface timing engine and cause dpu_encoder_phys_vid_wait_for_commit_done
> vblank timeout error.
>
> This patch add controller_id field into struct msm_dp_desc to break the tightly
> coupled relationship between index (dp->id) of DP descriptor table with DP
> controller_id.

Please no. This reverts the intention of commit bb3de286d992
("drm/msm/dp: Support up to 3 DP controllers")

    A new enum is introduced to document the connection between the
    instances referenced in the dpu_intf_cfg array and the controllers in
    the DP driver and sc7180 is updated.

It sounds like the intent of that commit failed to make a strong enough
connection. Now it needs to match the INTF number as well? I can't
really figure out what is actually wrong, because this patch undoes that
intentional tight coupling. Is the next patch the important part that
flips the order of the two interfaces?
