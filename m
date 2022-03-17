Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604A54DCFF8
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 22:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7B410E107;
	Thu, 17 Mar 2022 21:11:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC1710E107
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 21:11:54 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q129so4946069oif.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zYhskxegLwNK/LX0CyypPoqsPsPg4Ndg/EH2xEj9EDc=;
 b=aW8tJQrlsx0XXlz61yMOOiWyjJ1MKZCzhxcV2H4Mp8IzQ20W2ETqUGd3k7+Cp+uJDS
 d5qZ3W5EmmC1r5CcvrZ6EDiT8JvXO/KVgLp05KFPGaOe1tXEBAw63Vzlondxpaao9iyg
 3A3SL/JrhceG91mQ2Tm9OB3hEGd+BcVRHJ9lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zYhskxegLwNK/LX0CyypPoqsPsPg4Ndg/EH2xEj9EDc=;
 b=CndEu4hiWYpt+nC59hCWk006D+KR8aEeauIojhPmdNi7dBSzvhNCdT1x8MoRK/iRub
 s1VXv6mOK1ttoncpv7iZoC1GEZlHq4Gf5fmzrHhialAtLQup9NL+8qDKE4h9i6r1lcY5
 WqPt6uk5QjiY8smQSMuZ68GQM/0IUG6Xq8GO3q1m1yMBxzZzdwFeizK/dSwpkHQAA/Oz
 dFSHa5TZdlxF3L4PMp97jkMj87gADJmleTWebDR1rCNwMxno9x5IZ6Aa3ZneLm9ihIsa
 RVa2KTnOXXF7c2ESDZPxp2SlMK65DhmjKjwTJHzBe194lEFuCie4mO/MHFeHAnPjHnA/
 rrDw==
X-Gm-Message-State: AOAM531nAxJIdn+u2nZ4djHUoFoewfkA9H2NDpl8/7Dx6ump3Ioh3ont
 PBAewPH2HdjlDFPU7MHhA/YcsBN60coEJkQBzHEU6g==
X-Google-Smtp-Source: ABdhPJzeShV0kMKyS3lJi78u6Ki8Lo3e40whciOYCG9btFUalOyozbw84Dn3KMOY+A18MI91AHrLaDx/GyGmDHOiDTg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2819997oie.193.1647551513754; Thu, 17
 Mar 2022 14:11:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:11:53 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:11:53 -0400
Message-ID: <CAE-0n523guUYO=qCYcEhw92L4YtpTih_LyXtcJBGWP+EL3pMGg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename
 edp_out label to mdss_edp_out
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, thierry.reding@gmail.com, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:46)
> Rename the edp_out label in the sc7280 platform to mdss_edp_out
> so that the nodes related to mdss are all grouped together in
> the board specific files.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
