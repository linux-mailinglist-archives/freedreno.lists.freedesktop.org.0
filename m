Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412688A2F3
	for <lists+freedreno@lfdr.de>; Mon, 25 Mar 2024 14:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A4F10E8D4;
	Mon, 25 Mar 2024 13:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e3UdDcRc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ACC10E46F
 for <freedreno@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso3835994276.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711374612; x=1711979412; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
 b=e3UdDcRcEq10UQGnef0ZXCWCwNi1xRISFbKSBljsnelmF7kAXTppDVQtb/acLm8nbS
 50u8RbaHjlHRyQugxTQ0fyLIOrlnZuaBtIoRSAzHYplUk5omm4/7/70Jm8lOl98uP1I0
 877HxJi0wa5WCaRurPrhx/8PVXar/75O3TvyP8pUWuZHS9zKYaRkAAxY0Bx84m18P5jN
 e9KRCv5vFU9E8wUOzqIdV7R+BdUqxEliR4YmdTTnPgnj2iz0OCmLiNuQuXP8F8Tmcz3H
 BAyDw5XEz/1xxX8mWdQNiSEXGVzl6rL/VESWIebiAZUZuzk5XcubGa/2FBldPZPMnSGi
 GFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374612; x=1711979412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
 b=N7Jhcg/hLXTAwHECkT0+y2f16pRCL8ChqJ4peO7+aTBRtlj/ksmb2ySYpmiQUZhIr6
 olfzLsnOZOGBe+YJU+nnOsc0u103QCbVhH2eYXSuNwyeTu2xw68Bp/kz1z7vCSvu5Lkf
 8dtu4qd2GWcsSLWCDhpv9WXwV2DM7fEfmmbfKz4nWSUsFAusuAT1BjthKsVDIVPBgEiq
 0LmFzGxDWGSLlOrzZQbH6JKu89cb4kNkOewqTH0crdFqFn2wZSHtv74PBYBpdgXUEQ3m
 fCwLLVuAzgNhz7F/t3+eemLrz21xplIubw48huEoYPXeb8DmhfomPaa0+3yernnV96bC
 ADRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPlua/S6w1kzHa/E87LSqTgpoDZZ+ffzxZXtwkmzGxcu52hrbC2YuKhppozF/trEjd7P8prSrA6zdmHNhFWHqxRY0mDBrNxfsxYivPAY4/
X-Gm-Message-State: AOJu0Yzrnm0FCWT2E2tu/S2Es2PBNHyR2aOEo4MpRN4M/5JPQd0hyYi0
 8v+k/K4cgUzLK1ilENz4i1O1Lxnx3Z2jEbCdA2aa4S1X8iJPYH+f/eC2asS5qYHvSAKVnBbLieL
 aXKJoNvUd6s18TvI91xsWdg+u0mjP2Ex5zGBaog==
X-Google-Smtp-Source: AGHT+IHYjl0eFIojoJcLVm6Q3FikVODclbSrKrXlRZtK626pzzHApRK7eCpxDKYvNTGQRZ5CWm9dXvBcGq57I2cLYIQ=
X-Received: by 2002:a5b:941:0:b0:dd0:76e:d630 with SMTP id
 x1-20020a5b0941000000b00dd0076ed630mr5054565ybq.53.1711374612032; 
 Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
 <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 15:50:00 +0200
Message-ID: <CAA8EJppK6o0gsashG8yCLrOLbSVFDbHYEgzqBgP5ts65uTWgfw@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, 25 Mar 2024 at 15:33, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sun, Mar 24, 2024 at 12:57:43PM +0200, Dmitry Baryshkov wrote:
> > On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > > > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > > > need to push register changes to Mesa with the following manual
> > > > synchronization step. Existing headers will be removed in the following
> > > > commits (split away to ease reviews).
> > >
> > > Is this approach common in upstream kernel? Isn't it a bit awkward from
> > > legal perspective to rely on a source file outside of kernel during
> > > compilation?
> >
> > As long as the source file for that file is available. For examples of
> > non-trivial generated files see
> > arch/arm64/include/generated/sysreg-defs.h and
> > arch/arm64/include/generated/cpucap-defs.h
>
> I see that the xml files import a GPL compatible license, so I guess
> those are fine. The gen_header.py script doesn't include any license.
> Shouldn't it have one?

True. Rob, could you please add copyright / licence header to the gen_header.py?



-- 
With best wishes
Dmitry
