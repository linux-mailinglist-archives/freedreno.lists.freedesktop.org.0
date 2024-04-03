Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48B8972A6
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 16:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291F3112744;
	Wed,  3 Apr 2024 14:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L3iEp2Jw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486E10EA67
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 14:32:24 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso5591285276.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712154743; x=1712759543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34CSkv0ffEjJCmKkTU1MygJJn6kuTYj1aCVEbSSRxPA=;
 b=L3iEp2JwsL73l0X5ievhl8c4oPUZIu7nocUydtxvmOAZO93ZOcCIsNZgw1Ijj0tcQv
 hAcqn94wXm5LRbg52Jmcc2xK6FUqW76hdY55Y5RVj6CU0qE9Gpp7MN+MYs0KH1qWci5m
 52SFeEKmrR83XE3xjBvcgop1P8gT4T5kWa+mscCXwn8qr0451mFF2ngEphOO+EgKltRL
 fU2Dxaw39BS489Gaw/nVVZ3dGFpUYrnK1caPuowXgwvMO10oXeB0IA+eEThaR0SFNAym
 CyLL0c8dXr+jxPGJGBfQ0T6l9YLCTEgEBm+ArwDDxF/1XKtOjQin2F01Z3oLND4cNIau
 p6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712154743; x=1712759543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34CSkv0ffEjJCmKkTU1MygJJn6kuTYj1aCVEbSSRxPA=;
 b=wFb7c+eDSzacNIAKsytm85ryWwNFy2nlVOAYIblXm+hH9CYDXYW15HDbCrAQoU/5Bo
 KcTGskfw3qODnLkwbjHIuZ+a0405O3LrPOQaTB16Ja2Wc1hoOjy5dUUKLRwfG1fMLQs1
 zkYIG7EQDFkCRvtbqChXZ2CxaN/Gg0YnjhApWvqr7H96/+5+b01oc2Z41MZojgpb2OPS
 RiP9aoLR0bT8T1200/lNJtrBBt1rXUM8VBmttO15DgHevJuwsJiUSx7rQMrATZNZfkUx
 OCPKqLtnLcCt8+dCVJUJBXm2KmwzF1fbZPz/q4j8boEumw5+NnpLTovAMP4d9mWl1b2L
 0TIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqLzgJgzOP4wT9TIsuq9Yu++imP1YjM9aVQxFZUOKLwVYf+G97EE6bffFHD9FJD/ztXY5WM3QQlaakcxrCD55i4IqVheonWJJ9vhfWg3j3
X-Gm-Message-State: AOJu0YxGyhdRItxBVakiQIz9gqivb2CWIeYrfO5b/uE5ljRQ6c+wQ1FP
 XEpNtnj/wVmhhCPGX1jrKmxqM3gy2rUf3ir/9ijoKhqIfe/2bgcAakzNgGpYF8i3EAvIIc/QYxn
 ZZfcEExDGhJ7tkkO3i6+LXEQtg9yjw1t1KdEEZg==
X-Google-Smtp-Source: AGHT+IH98EISaj94HpDi2rlmrd8w9Fj6vSdDh3ZnOjMDuCqy7Y1IBEY6ToBgt88nGS+ar9pdmZ/9uSUzzjKPwGwom1I=
X-Received: by 2002:a25:c543:0:b0:dcf:3ef1:1997 with SMTP id
 v64-20020a25c543000000b00dcf3ef11997mr14153649ybe.1.1712154742988; Wed, 03
 Apr 2024 07:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
 <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
In-Reply-To: <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 17:32:11 +0300
Message-ID: <CAA8EJpoFA3JsxzYrCR7Py8AHcOSrxUZRPO4hMMMDr1SrQFsWRw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add DSC support to DSI video panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 17:27, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:49=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > This is follow up update to Jonathan's patch set.
> > >
> > > Changes vs V2:
> > > - Rebase to latest mainline.
> > > - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> > >     latest mainline code.
> > > - Drop the bonded DSI patch as I do not have device to test it.
> > > - Address comments from version 2.
> >
> > Which comments? "Adress comments" is the worst case of changelog.
> Adopted. Will add more details in next version.
> >
> > Also, what do you consider as version 2? Jonathan Marek has only sent v=
1.
>
> It's wired. I see v2 in patch title of below link. Just notice that
> there is v1 in the link address.
> https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=3D1
>

Ack, I didn't remember that there was v2. Please excuse me then.


--=20
With best wishes
Dmitry
