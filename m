Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7759B9DD14
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FA910E862;
	Thu, 25 Sep 2025 07:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yDhWGtPo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com
 [74.125.224.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0E10E862
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:10:47 +0000 (UTC)
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-635355713d9so311250d50.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758784246; x=1759389046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQb6C3ttjciQrH1J6+L7MgPLJCUOx0fYYmrUWrGIRb8=;
 b=yDhWGtPo4c9y62KnvftaxH6EjwZ9Fvm3uA1bKDB8LWP1ga23BOSLKeQGMxtDACvgS5
 ZBWsD7VZOLeyuWhyqw3NF0F7Ub5ntZ1+QrDuZQ/4wF2ZLvI/JWECd1nvDQMt+tta+NB9
 GqIrbHIURmLVsv5rFQOMjtpuXjORha5on/ZAKILdeCYyFBeHu9vLCNu1PGOb/DlW0X58
 rCkTSSCvNHrctM5SQIcmdsdBPJnBsWKTd18+4R9RVDV3R3znI02J4pFvowLjMrTPjk0p
 wpEYN9pONnYgzHBgV3HsLpsz2OqYohPlNaHoAEl8UoBoYU0Syu++H+8SkKDMx5mtgU+u
 rWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758784246; x=1759389046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQb6C3ttjciQrH1J6+L7MgPLJCUOx0fYYmrUWrGIRb8=;
 b=jLTKGWghJDrZ8aNaK8QGkufG3Bh/6Z8ihVRSAyYzs3JNA/dbJBVBXS38V70/sTdpVU
 Bh6+tmRCJ5g0swh2APCxSuUtWHcci0nCEOMtH3OAia2Ued27yXXhoJdIGRYLIcah3TFE
 JQWFDHo6nZBGz2xXpoDOqdbmaHhHfm5HgSx5CQ2z0cJgB4z5cFTC49NZwOzOx87gAxjE
 Ze6A1KEU2/LZqdXAtsYtSRFGar34zj+4g3JHp2ux9NVZkkf/Kx+Z4tXkNm802jfinzEV
 ljMxirrqwYECJC0IsKY7amJfaTnVm2Reneo4YgYG4GrcCDIz2iwLwryziBHdD7Yuw3lq
 HUbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBtAo/zM9+ldd20o0DLg1PztxNkyqrZ36xZtGa6YPtXx2sSsxi2l0BLjFFgtPi76n28llJxc/pupo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJHY4GBbi1TNpek+lxQFqPml88+wyCMBh+z7xm9UJ6eZ/RXnlH
 7AYhpYk346Ak58qHjbAblwnzXnQJ1kRA8S4doxkHfCOl3y91vaL9spuSfYdtDExQFTgiEQ+EOUo
 zAhF9D8ao6G+kmAWDKx3a1KikTXlcqftbx43YSedziQ==
X-Gm-Gg: ASbGncvi6436LP2C2JD3zIVoFAoPMXa+Ci4ko0+DRKuUYGZgFH/rtL4KyiC4bbgyGCt
 WXdscHtI+f3rL+rTdfoIJwdQv1xvJy+WMPi4Z/CYtGfCghE3FdRURbwROQnq0Hhfi3+gbbGcsQ+
 9AEfd2Xq/GuoMnOWPTZZ9n54a2X58OBbDkMtXUHY8yiNVHQfKKXVw+/gBXKqUfZ8LEg58CE7w+e
 Kee4NyZNiMkFsVgNdE=
X-Google-Smtp-Source: AGHT+IH2nB64sZM1uazTNjqpZvzrzocGQiVD/Q+ub5hgCK4Vy30NwPZyFUTfLzh70x15UYl3iWsRdzrjakrOb8ae4F8=
X-Received: by 2002:a05:690e:2508:b0:635:4ecd:75a4 with SMTP id
 956f58d0204a3-6361a8ad38amr1112652d50.50.1758784246352; Thu, 25 Sep 2025
 00:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
 <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
In-Reply-To: <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 25 Sep 2025 15:10:35 +0800
X-Gm-Features: AS18NWAPf9tdpp_gChgD_gM1WzlnnA0bBkACDBIPWpyv07LUDbDFj0oLZcuPUcU
Message-ID: <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
9=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 02:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Some devices treat two independent physical DSI panels as a single
> > logical panel from the CRTC's perspective. However, two separate DSI
> > hosts are still required to drive the panels individually.
> >
> > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > allows a panel driver to inform the DSI host that it is part of a
> > dual-panel setup, enabling the host to coordinate both physical
> > displays as one.
>
> How is it being set?

This is set by panel driver in probe(). You mean this should be documented
here, right?

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cd=
c7bf21c1ec20e6eff 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
> >   * @host: DSI host for this peripheral
> >   * @dev: driver model device node for this peripheral
> >   * @attached: the DSI device has been successfully attached
> > + * @dual_panel: the DSI device is one instance of dual panel
> >   * @name: DSI peripheral chip type
> >   * @channel: virtual channel assigned to the peripheral
> >   * @format: pixel format for video mode
> > @@ -188,6 +189,7 @@ struct mipi_dsi_device {
> >         struct mipi_dsi_host *host;
> >         struct device dev;
> >         bool attached;
> > +       bool dual_panel;
> >
> >         char name[DSI_DEV_NAME_SIZE];
> >         unsigned int channel;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
