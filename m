Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EA9F4906
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 11:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F5C10E1AC;
	Tue, 17 Dec 2024 10:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5Bk3EcC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7FD10E1B0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 10:38:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso5793085e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734431901; x=1735036701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
 b=f5Bk3EcCqUd+ETLL8ETU2V95ukUbxHSQLWgdiErnB8M+fWQhMFa8r/uatsCeg8beO9
 H/G/gQJlGP6WlM2oKkZwaQ7oD27TXIulthXka+eEkADmNkJVt+M+ke8huCFuNHLnOCt1
 wNGxE80EUa49HQpJ5AC/6L+lzv26DMI5TGe83F8lEEriLgHs3QoNbwl+Nhp7IMRW2NQx
 gWhBv2YJy/2vLXXn8RKcb/XT/XzZfimR7IZeOIF6lCIR+le4V5+6UgtfQPl1U7a28HyM
 lIvV3xZuUHyyo9AVKqUJXwsqYcaVx6p1FVhoBR+GbZUdq9b7KshoCy6OLajepBc80UdI
 mMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734431901; x=1735036701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
 b=wYVHP/nHZj2+FkEqdwznwp0g3cvQ9PRwfq8b8RNj+3KfM80QMl2TYF7RM9+NCezGlq
 mXazLeeqEFsTVzVtxWDsicrymbegoiBYRFYHA59YCemL+F4ODON4oY6O8+lw2GQESAtZ
 f1zvUr/iHcFbDMEVVGOilt7a+EsSS6OAhkbX/FfBopX4t9XUJTdT3vX0EcuQZ3d9faJp
 He/FhpNFBNgx9HASmwYO6FsNsjlGYWqYWCT4i7uvBRxL/O3TTPQG8Nu/YvZ5x63k/maZ
 LT35oke2zAFCdPvdIOEe+Tj/4EPEbCEHFdMIstT7D7wGiLLfhqEsDAZDrt3ORNxVwPZ/
 xh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiBrq5HWGOPKUX8/xxJJc9a8dFX9GRsDQKsMy7dRhzvX7udItgrvK/2mXbJQOsAuApwbGK1322wuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmA1w3orcBD93UK2DlKbGs+euQBoLAC5jUnN24PBICRTvZtfdH
 kod4bEBt2kN2KajH48EKP0l3IKvqdcsRv664aQCboHLqJtCLy1EdAF6QWyrNiWs=
X-Gm-Gg: ASbGncuoinItTft28mVpLk0Ry8YKLXGLwzKGHy+E6OInZwFg6fHufvQJd1jBytkhfx/
 +dwJgQisZwuCHmYAiplCXhxa5p5mI1T0xCLvhd36fStq+14WYuZAl5opEv+y6qP/t5vOZ26R6AG
 cWEhtrjBSodYwC1ZSM2x7XKn558J9X0kTbgQ2qnSFsUzPY+urqCi5XGDqJzmTWWueAaXuqEscfT
 Qymdb7MOEhHiYJO1+tGDL2DQWouveBJAUQmFpougIQtPdP089hxYuk6E6b0CFUCI3CTxOw4aikD
 IV96CSomfWKvD4tuW1lMFQz6f1rBtgCR/iTu
X-Google-Smtp-Source: AGHT+IEIrR2bMxG3Grf1QUMhkQELSDXhmLc/tmsZ1cto3QX1pRwRlgidZ0/hzrqApkhKtNgij3EB+g==
X-Received: by 2002:a05:6512:3b9d:b0:540:1dac:c042 with SMTP id
 2adb3069b0e04-5408ad82317mr5526367e87.8.1734431900751; 
 Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1fc1csm1114367e87.240.2024.12.17.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Date: Tue, 17 Dec 2024 12:38:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Richard Acayan <mailingradian@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Message-ID: <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
 <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
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

On Tue, Dec 17, 2024 at 09:41:44AM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Please say something about why you're doing this and what the expected
> outcome of doing so is.
> 
> There is currently no way for a third party (e.g. stable or distro
> maintainer) to determine what this patch does, if it needs to be
> backported or if it's essentially just a clean up like Abhinav indicated
> in one of his replies.

These patches allow using colour transformation matrix (aka night mode)
with more outputs at the same time. I think at this point only CrOS
compositor actually uses CTM, so these changes do not need to be
backported. However they are not cleanups, it was a feedback for the
SM6150 patch for the reasons expressed in the Abhinav's email.

> 
> > Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Johan

-- 
With best wishes
Dmitry
