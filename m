Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C508CC78E
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 22:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018510EF1B;
	Wed, 22 May 2024 20:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MVcUts4x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A310F155
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 20:00:00 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-df4f05e5901so682474276.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716407999; x=1717012799; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/qhl6IWId5wrM73iQzxcnHSvXyYaW/mKPzC9kbK3RJY=;
 b=MVcUts4xoKwlUt95e6cgQBhrRnFSzfrQ5m9aRTwP05BK0mDR8dfw9/0zwu+OCZE4n6
 ZEvDy644sbDt24tev+7Ud/CmRH1usV9TCdX33+1aplThlajAIfjm9qyoCYZ5UCka3oKl
 od/k5DZnmHTa2HUVCWdNv/BD7Z/g2sUo7VmrJFbbMGaR/gtAHhiFUKOx3ved57PAPrcu
 LRtBIL9sLr2mUWmXffs8aNnrJI31SNxPNw3HOA4RaZEKY2+x6IGAMN7DrqUQbfRMjEd2
 jqijEM8XQi5/KIkD12+XIoQIc2BTU2/YfHPodAU20qcg4Z+g8gXHbyFP5T1DE6TH/V36
 UAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716407999; x=1717012799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/qhl6IWId5wrM73iQzxcnHSvXyYaW/mKPzC9kbK3RJY=;
 b=kc9rV+nVSR6FUv/XUlRqG8F5Ph5GAPazPuh4jmqFtCYXwbR65SlBKukiscz/w8WpEd
 EMUJ8uJyxLhAS34BxrCl3BDpe+dz4D6nlcdhvy5X25ucIJjg01/4uOIO+cxWDRDi9hDV
 F57Xb37+l2nTROME7gcFZShAbYIlBmqrLcEWioD8nraPPbimJPsIiJrZ7hhbUb8mdYc3
 /I6MdZuL0DanASlzUtbiTz9tifCLH3YmweaV3O6AvOEl7dSYJIcCyJKLEeSSn15ir1HC
 Npgpt/e69oOvqANY+yFdlZH7GaGXh2Zyt/0vZxkMwJ2hLL0hWT/PX4xlqyJ+7IWfR9gh
 oKkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuDsgRghPYpNtn/PPTC5rAt2peOrSm0R36DJ+yAHHZ/cN2gx9NDQLgzHoLkHpek65KyQBDxD4kjOI/f5+pnHZf5kPiEsHAHE98R2SI/d4U
X-Gm-Message-State: AOJu0YyPvcriXD+/o4qgfmMqqyRogLor+AUxpx9JzHnBAwmZOF6mDPAC
 9MyjR12bZo4AzwJ/nn7zENwLxiYCt4ucWmgYwWWyOdWQKnfSGKWY1WpbXmYz7uLPuJXlauT2t5W
 TWdMdPoG9luJRUs8MK1Pa31SLOJvksFv80mfSDQ==
X-Google-Smtp-Source: AGHT+IFBdpHbxJ+yLv993NBkaZKCxzG+KUPF15873Oa8DQwzjjPnnwpp06GCFXfzkmTafg7JcepNq4qfLzPm44EJARc=
X-Received: by 2002:a25:2651:0:b0:de4:738b:c2e4 with SMTP id
 3f1490d57ef6-df4e0acfd9amr3345943276.28.1716407999068; Wed, 22 May 2024
 12:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com>
In-Reply-To: <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 22:59:48 +0300
Message-ID: <CAA8EJpoWUEGX8fq5qxXUebA-E25ONycm4NXscFhXAhFwcJGf0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Wed, 22 May 2024 at 21:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > Command-mode DSI panels need to signal the display controlller when
> > vsync happens, so that the device can start sending the next frame. Some
> > devices (Google Pixel 3) use a non-default pin, so additional
> > configuration is required. Add a way to specify this information in DT
> > and handle it in the DSI and DPU drivers.
> >
>
> Which pin is the pixel 3 using? Just wanted to know .. is it gpio0 or gpio1?

gpio2. If it was gpio0 then there were no issues at all.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (7):
> >        dt-bindings: display/msm/dsi: allow specifying TE source
> >        drm/msm/dpu: convert vsync source defines to the enum
> >        drm/msm/dsi: drop unused GPIOs handling
> >        drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
> >        drm/msm/dpu: rework vsync_source handling
> >        drm/msm/dsi: parse vsync source from device tree
> >        drm/msm/dpu: support setting the TE source
> >
> >   .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
> >   drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
> >   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
> >   drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
> >   12 files changed, 106 insertions(+), 62 deletions(-)
> > ---
> > base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> > change-id: 20240514-dpu-handle-te-signal-82663c0211bd
> >
> > Best regards,



-- 
With best wishes
Dmitry
