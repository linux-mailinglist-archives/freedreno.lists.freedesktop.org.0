Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB718628A67
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 21:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EE110E318;
	Mon, 14 Nov 2022 20:27:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F9C10E0C4
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 20:27:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id 13so31267974ejn.3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 12:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
 b=YZbBARaiZIN5w5hmUzF7Yt5HUb8Fu8ZcAoW26h5RlMwSHRIVsAdn1PNguLoBw9ki+I
 avs6Bhr7b7wxAMHDI3giIi54k5CDbe4SATViP+LZnOobPbn85eYeB7PNCat8brXZqZ/T
 AhbN07fijNjTdg2kBJYXr5RMz1Nf5+naQTzsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
 b=Zw5iFgAEZ0WrbLBdUgFnOHRmAMRnlOQ+LttdSe1sG4O6lR9suWAG5Xf7vURcqrNDLZ
 OL51jjXPZV6L5pTw6a1XX3WEv6gkRzq3p4dJYlmWPKusjTVpxGoK4fc13YyaA1ijOFdX
 mUBALxvK59vw3Ypdcju6FN3U1YciDtr/rtTnnCb/kZ9QovW4Vc3c11JCZeEiVALFH7kQ
 73cxlRdQDuGv2TKwlnJ8uwmWuv7DUcNY/WprkUecTqPcRE8HIfjXDD4Bz5szW/1Y4P8O
 3ILtSMXwwCLt2RcgatSqSho40aOZQJ23Cu5BOMacyA+mKh1u0uLxDmInvWR5Ohd9qB46
 UMaw==
X-Gm-Message-State: ANoB5plamexUySOCpWBgMZiO81nniPsJ69TcItC0bF6CLPUoMeRNGXDg
 h2zRDVFX90OHA3b8htLq1hKuZ2pXhVO/QdBB
X-Google-Smtp-Source: AA0mqf58X4V0yljGI58QvvyCkoIcgntER2moGxg1V/g3DZszW/6CVMYU3QhJrSTku2oEnPwfqjzL6Q==
X-Received: by 2002:a17:906:f8d6:b0:7ad:a0cb:f79e with SMTP id
 lh22-20020a170906f8d600b007ada0cbf79emr11021923ejb.458.1668457663578; 
 Mon, 14 Nov 2022 12:27:43 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 21-20020a170906309500b007add62dafbasm4570059ejv.157.2022.11.14.12.27.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 12:27:35 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so11595035wmb.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 12:27:35 -0800 (PST)
X-Received: by 2002:a1c:f611:0:b0:3cf:9ad3:a20e with SMTP id
 w17-20020a1cf611000000b003cf9ad3a20emr9535222wmc.151.1668457654755; Mon, 14
 Nov 2022 12:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20221114194133.1535178-1-robdclark@gmail.com>
In-Reply-To: <20221114194133.1535178-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Nov 2022 12:27:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix speed-bin detection vs
 probe-defer
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 14, 2022 at 11:41 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If we get an error (other than -ENOENT) we need to propagate that up the
> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
> whatever OPP(s) are represented by bit zero.

Can you explain the "whatever OPP(s) are represented by bit zero"
part? This doesn't seem to be true because `supp_hw` is initiated to
UINT_MAX. If I'm remembering how this all works, doesn't that mean
that if we get an error we'll assume all OPPs are OK?

I'm not saying that I'm against your change, but I think maybe you're
misdescribing the old behavior.

Speaking of the initialization of supp_hw, if we want to change the
behavior like your patch does then we should be able to remove that
initialization, right?

I would also suspect that your patch will result in a compiler
warning, at least on some compilers. The goto label `done` is no
longer needed, right?

-Doug
