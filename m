Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248D9DFD36
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 10:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7D10E684;
	Mon,  2 Dec 2024 09:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AB4XynXC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96E910E684
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 09:32:50 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e398484b60bso2466828276.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 01:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733131970; x=1733736770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykJ4gnZ8OI+lNlsS7GnWz+Q0GYuAZsbDat/k0gHdcy0=;
 b=AB4XynXCoFCGgRoRBfmeKioZyaSgEEG6gv9bAMCFg52ouiIJCCTPfkTN9WX4gEmwA2
 jMar6un4RgMWDY0yWRHOy0TBA0HnkAFXrdEFusXTYuxzbPVyIMvntNOeiRgazdKufQXa
 /kJA5veWDc7yPSBxIgEjGeyca9DKXd/YztdlWUIPl6qPwBuxtUCfDOrfk4lqW+J0mob5
 ifJHKtMamSFym5Mn8qSYs5bNdJCrAhXCfz7ySRB9jz3bkcYxAsUgd7tQnsA4uYxr+Eyu
 UOhIfiyhne5frEo/Ke35+U34+S1o20i3Tj1PO7mypowfGMAkILFSUFQQpY4ljZNXYbOo
 W4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733131970; x=1733736770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykJ4gnZ8OI+lNlsS7GnWz+Q0GYuAZsbDat/k0gHdcy0=;
 b=UFeyehvLdNAZyioTp5PjQrazDU0UmcOVaaNVLRUXdZCjCfXqI7GroRFr1PdHK44HmW
 lAa1hkuAG1vU2aQjPiu+7SOtmQHnlqBgLBObVLRWKHV2jdxd73ZWjCkhF9T9luEEDwXM
 EQBH7tJWVl3DQH02RKUDaLXnxMu8TieyqwVUm6V5wvFEntnlH+M7ERiFjWbVEqCEwfrF
 pzSlDjhNWOStdwnrjug89mRccOcUBK0YhzuE+AVZpfN+8YzGWc1SaiqAnW7tAJS6bJss
 leSZUrFo27zgCW8Bif6EqXJgwyIj8DNZkzSySPcBIsW6V+Bc60lw/0hp/GD+UXuhkSVl
 lFHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ8Wo9g9lde9taLBPYeRGTLlGVtLONh4pVLthQ6KvTpQh2S/3Ar5PpVkKzO/X4EawGFChq/UoApKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQLuocL+jIrYnRdl4LfvLkyt6Q5raU1Ye0xXLXH+6eOzSdhlrV
 a9RcbBMtI1bDZTWR4kr1ms2KpB+EsFj43mMcyK9gowykOwMowR/YaQ2DB8fxCA6DybEjc3VUg7q
 b+a03NAwRiqOwTk9FbMruY7LJMGod9F4cXFbIjw==
X-Gm-Gg: ASbGnctOCfhSlyQ1QNiY1sLG0+R8hYFxSqBsc+nzovfL8WS9NqVnW8WInL7PI0SOnFi
 TsfYdlpqgqfyMMsRlbBxyMVBMMeaENg==
X-Google-Smtp-Source: AGHT+IGT3z3TbHSFBQBWWQ1KvYeMAU20/kLWtZdyfcltpfmv3iUgGjIOBFmp2Bw/pBAtCruUtd0beWsC6yrtxdL0HE0=
X-Received: by 2002:a05:6902:150d:b0:e38:b889:7eff with SMTP id
 3f1490d57ef6-e395b870d38mr18514341276.6.1733131969951; Mon, 02 Dec 2024
 01:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
 <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
In-Reply-To: <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 2 Dec 2024 11:32:45 +0200
Message-ID: <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
>
>
> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> w=
rote:
> >>
> >> Introduce a maximum width constraint for modes during validation. This
> >> ensures that the modes are filtered based on hardware capabilities,
> >> specifically addressing the line buffer limitations of individual pipe=
s.
> >
> > This doesn't describe, why this is necessary. What does "buffer
> > limitations of individual pipes" mean?
> > If the platforms have hw capabilities like being unable to support 8k
> > or 10k, it should go to platform data
> >
> It's SSPP line buffer limitation for this platform and only support to 21=
60 mode width.
> Then, shall I add max_width config to struct msm_dp_desc in next patch? f=
or other platform will set defualt value to =E2=80=98DP_MAX_WIDTH 7680'

SSPP line buffer limitations are to be handled in the DPU driver. The
DP driver shouldn't care about those.

> >>
> >> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
> >>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>  4 files changed, 18 insertions(+)


--=20
With best wishes
Dmitry
