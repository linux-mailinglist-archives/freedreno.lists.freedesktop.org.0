Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCD897294
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 16:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE83112B7A;
	Wed,  3 Apr 2024 14:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sXbVtgar";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7C112B79
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 14:27:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d6a1ad08b8so67311081fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712154467; x=1712759267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2m6TCoiwkZCsl/n4EpXjK7y7a9dk5gfjSvv4CStXcsg=;
 b=sXbVtgarDD/HT98LbmH7vgVsBG9zxT+C+ZcXyA1ldYkcogpgLSA9g++FGtx/1rmbuR
 1dABGGkg46NLnjFEi2Cp543AAcALhhZLVTG00XZGBwUJAMaQt0RZb5IDqmn9RKdpLPWu
 6Y2LOOpG/CZiVRy1dxLCYC5DXZHVU5IqDRftG00qOrQmpcLVg/DW/LUxuHcwqnaLv1FD
 dqe2uWr8hhV7nJrUQqLHo2cfA5mtSo5RW6fb9LUT54iuhO2uVHxKVtQQU5JdGgpCmbmZ
 bwXTGY/pwVjyXEtdJLEg+Gu/PtSXQZUz+MkgTHtMnJ7zFQHnCaBCOojwG8nl9q3KWa+h
 pBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712154467; x=1712759267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2m6TCoiwkZCsl/n4EpXjK7y7a9dk5gfjSvv4CStXcsg=;
 b=b4FhXCT2Pp0c10ECcs0sJ0qJOeSJP8Pakt0Sse8NnkzXSz4p5TJKBg4cXMiCSKM1AC
 pm+xbKjBfRKM4JPVXqdfzwvcUvHkHSfNNagnGDnjvwFTXbmlvFkNjuR0OOnJ2pOMXlim
 mnXlc6mqX68t/nNnvOICcj+u64E02JyzveeaJBCAu/+Gj+iilw7cwbJ59tJzGmUiF5G4
 RNlV/2r4l0w7g6mbrP8EemCX/mCEjDeLBVa1eFIei8ZjV+gaquNliDiPsNzp3/yx4v2Z
 Mjr+FSiIBQiAksSw3HBsjJZI1y+Lp+PbtKj6gGn8g9u29aG64WHcWjsaDbZFe1u33F8u
 JBZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy9tFr7+PGwMsjDiBjZ0eGeQYxcKWePVIaYIOm+pCnJ2WaDhn4xNWDduEJ9gwc9uzSVjouxrXHrj8JyhiFRJu7W1jJTedp6XSyfUfK9eoA
X-Gm-Message-State: AOJu0YyXiZtluUJtOr3oUJN54sGtsBsYogcQOGeD/w4SXhxumyIljV6M
 PkeMPvRoML0lxroUrfbNxjxZ+gz6iD8X1NdvhtgAaM+BzdZjKdYwnlO5cSsoNB+QMBhhJ8Hp9v9
 Biscw8ZdNvYVoNYUCJPEN5djCU+mHvUMleJSNVg==
X-Google-Smtp-Source: AGHT+IEPAVO44UCTaAtdIqZQgD+gNk8dgJ4zsNMB6zzisxd38jmSZ/cwbjAX1C0jxryJk/DzTLmE9V9LXVSnHkltjtU=
X-Received: by 2002:a2e:a58c:0:b0:2d7:7bb2:7afc with SMTP id
 m12-20020a2ea58c000000b002d77bb27afcmr11035945ljp.3.1712154467493; Wed, 03
 Apr 2024 07:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
In-Reply-To: <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 3 Apr 2024 22:27:36 +0800
Message-ID: <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add DSC support to DSI video panel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > This is follow up update to Jonathan's patch set.
> >
> > Changes vs V2:
> > - Rebase to latest mainline.
> > - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> >     latest mainline code.
> > - Drop the bonded DSI patch as I do not have device to test it.
> > - Address comments from version 2.
>
> Which comments? "Adress comments" is the worst case of changelog.
Adopted. Will add more details in next version.
>
> Also, what do you consider as version 2? Jonathan Marek has only sent v1.

It's wired. I see v2 in patch title of below link. Just notice that
there is v1 in the link address.
https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=3D1

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> > Jonathan Marek (5):
> >       drm/msm/dpu: fix video mode DSC for DSI
> >       drm/msm/dsi: set video mode widebus enable bit when widebus is en=
abled
> >       drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode D=
SC)
> >       drm/msm/dsi: add a comment to explain pkt_per_line encoding
> >       drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
> >
> > Jun Nie (1):
> >       drm/display: Add slice_per_pkt for dsc
> >
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  9 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  8 +++++
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 42 +++++++++++---=
--------
> >  include/drm/display/drm_dsc.h                      |  4 +++
> >  5 files changed, 44 insertions(+), 20 deletions(-)
> > ---
> > base-commit: b1e6ec0a0fd0252af046e542f91234cd6c30b2cb
> > change-id: 20240403-msm-drm-dsc-dsi-video-upstream-1156d110a53d
> >
> > Best regards,
> > --
> > Jun Nie <jun.nie@linaro.org>
> >
>
>
> --
> With best wishes
> Dmitry
