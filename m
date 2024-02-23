Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD38613C8
	for <lists+freedreno@lfdr.de>; Fri, 23 Feb 2024 15:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314CC10EC2F;
	Fri, 23 Feb 2024 14:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ckRxpIBi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977710EC2A
 for <freedreno@lists.freedesktop.org>; Fri, 23 Feb 2024 14:18:21 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6086c19f6a0so9631857b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 Feb 2024 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708697900; x=1709302700; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R19d00zAe0ESb2W1wfQWoMVwkbh2mKJoTeu+62qXKLU=;
 b=ckRxpIBiGd9IeFaWDXBWreuj0zPDkuNNcd4x5Df69nSIh4pE/VyQwEAOFawu2zNoK0
 rNRSWnZqrvwGdGGow/0hRAdS2TA8nO8TxQdFcThtvMOkQAtLscCEDCNGR/4Wq35dvvxk
 5zJhNNlZgTLi3fBe9AvF5LwdTkAmSTr8QO4zyfzwCKMsUN+16qios/mymrLkRfnFzTxo
 AsaHpyT4hiHzdJFk99uimA/xQyAvtye7iYzKUIg2dG1eCIZJW1nNRavdbCf7g/1TPF5Z
 Ik8JTJkHEd6Spm1PLzXX5J+wv7RcCeiC6xe3jZmr1bCPhHsRumm3mpV4v7xgDJrFYDFs
 P9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708697900; x=1709302700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R19d00zAe0ESb2W1wfQWoMVwkbh2mKJoTeu+62qXKLU=;
 b=B6QQTsbrlVm/hxcSMaWMXqRtDX/ywb7EPXXuzJSzP/wrEc9IHPOJRPrrKYO/nyRjRz
 rpz51vQ8zgJp5SJOq3ux3yVwOMst5Fm2nYJrXYLDgsyjNtx0OHHH0RTmREb7Kw2WVYUN
 4ldAYfU0H9EIctIVA1WvBmXN8p5stkr1nrQPkNvsHHenScB+vBDGz7UV38i2LZkR66Ir
 bzsiIzwErRVJ/6503VN+yzL34YkK7M/+v58cK6nAe94+fF7r5IjWCtyQ6IPLXsyWI6Bw
 g2dxBEWsZxb1khyrzaWTdUOt5Fyz7372byp4uMKlpnTGTvF/iVnmNxKK2sZrJpLE/EUE
 8GCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNJDDEtjLJzIpMunZvz9RwKKBYZv20po6vZAMVBddk/sB9dhifn1Nd44vxac58g/jX9qsBgrhehL64aN7QD5IyXdemExlQjPQUJwolwn8D
X-Gm-Message-State: AOJu0YzRhqPLc1Rc9tncEZXbBz/Z5Bby2pNgE2sZbPh7AQ8/TzYEBfU/
 pztT7phAhRqen8vbl2EYevXI/LEjPuBMiFEej6Qe1yG2S5gY9yk1nKRnmOsC6pz9G6hgvOX1hgr
 g+ko0QX4eX9WzY0eBNhAVkZcdk25GnQNo92UDlQ==
X-Google-Smtp-Source: AGHT+IF70UF5LUoWVCUdf5eKhR2KmxVP4WJANJz9muRW2tleCLa7psg2DI+FTnDe298CK4P04Z21/Fhm5EKyGZLzPvY=
X-Received: by 2002:a25:6b03:0:b0:dc7:32e5:a707 with SMTP id
 g3-20020a256b03000000b00dc732e5a707mr1990018ybc.61.1708697900641; Fri, 23 Feb
 2024 06:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
In-Reply-To: <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 16:18:08 +0200
Message-ID: <CAA8EJppYHdSmsWMk-u=QaAaHWqjFj8zs4CF947eeex6iV4dsYw@mail.gmail.com>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
To: neil.armstrong@linaro.org
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 23 Feb 2024 at 15:52, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 23/02/2024 13:51, Johan Hovold wrote:
> > On Fri, Feb 23, 2024 at 12:03:10PM +0100, Neil Armstrong wrote:
> >> On 23/02/2024 12:02, Neil Armstrong wrote:
> >>> Hi,
> >>>
> >>> On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> >>>> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> >>>> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> >>>> is due to a regression in the DRM subsystem [1].
> >>>>
> >>>> This series fixes a race in the pmic_glink_altmode driver which was
> >>>> exposed / triggered by the transparent DRM bridges rework that went into
> >>>> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> >>>> sometimes triggering a NULL-pointer dereference.
> >>>>
> >>>> [...]
> >>>
> >>> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> >>>
> >>> [1/6] drm/bridge: aux-hpd: fix OF node leaks
> >>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> >>> [2/6] drm/bridge: aux-hpd: separate allocation and registration
> >>>         (no commit info)
> >>> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> >>>         (no commit info)
> >>> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
> >>>         (no commit info)
> >>> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
> >>>         (no commit info)
> >>> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
> >>>         (no commit info)
> >>>
> >>
> >> To clarify, I only applied patch 1 to drm-misc-fixes
> >
> > Ok, but can you please not do that? :)
> >
> > These patches should go in through the same tree to avoid conflicts.
> >
> > I discussed this with Bjorn and Dmitry the other day and the conclusion
> > was that it was easiest to take all of these through DRM.
>
> I only applied patch 1, which is a standalone fix and goes into a separate tree,
> for the next patches it would be indeed simpler for them to go via drm-misc when
> they are properly acked.

I think PHY patches can go through a usual route (phy/next or
phy/fixes). For patches 3 and 4 I'd need an ack from Bjorn to merge
them through drm-misc-next or drm-misc-fixes.


-- 
With best wishes
Dmitry
