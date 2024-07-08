Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46C92ABC4
	for <lists+freedreno@lfdr.de>; Tue,  9 Jul 2024 00:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C68210E42E;
	Mon,  8 Jul 2024 22:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJa+TEMg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685E510E435
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2024 22:11:31 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-64b29539d87so39404617b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Jul 2024 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720476690; x=1721081490; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
 b=QJa+TEMg4fjIkjNKyTzE8aWV0uz0FPbqFzoUC2ochapZ3yq6R1JTPWWTFB9TZhMsq0
 zgfitlyMdcrjktJhiXsS1zB5iASIB3o3/Pnl8iTAmioj9LVDJe83VPBcwYFAozrirYQB
 Ve4lVmEiMXpTmCOz8oSPGVjw216OXLGrvC0BWUBhEVAcikZZ4InT31V4aRqyfjVhew0e
 A3XB7kWkvmUeNEIMSVb6IBKxcVG4mMeWjB+I347Wd2LBw/l8scViqr9YQCCQBE/v6f5h
 FCpyfQGHXy7NYcPYPJTNpKyF2V5+FlezPUfhJV9BqJ+uFID1MTFnCBH4qfCSxpgCyRN9
 R0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720476690; x=1721081490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
 b=XkGsBqmG4risq4O275Sg7mSRSRvuqLTgmdF2zlvwYTAulwFz4thzG04IF0Wz9actvh
 lC+sO/RMq9mV0gQ+CZLIegyT/JKQe9bV62hPx1WhvZr74GjvuaqF3h1JDMa3uKXt5PLB
 iqAC/F7GdWV73tu+CWIJDRRPYIFOprMw+9kFMpcsTX6BZczFYTSNa9rXN1IxPyn76WkU
 +LtVA8OrDqir8E9OEWx/LWEyyhxk2zueIYrL2Z348Wje0TwYLhndDlGC/FqgAA+uJWXm
 xqqKOk5WCMx3eIDMUz7rx2GGo9TvrldOihaEOBfYXYxsg0CETRp2sJJE5rKuyS+krl5j
 Ry0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3oYXQf+8HHcExiIo+rG+wBFJuWa/B6Ztc+93ujmtxBXzsY6+BNoy4Ik2bWGbPNtsN8Ox/MUfRtpklcXDfk0RjXY4ZW0GrUJSV4Phj5GDX
X-Gm-Message-State: AOJu0YyHYgxYY+6/2jzg+qpEZSx68z7FWvMijWrJOvPPOyfIkbC25F1l
 SuYPq8YiacgDUX/pRXFdxS48AlTfYYj/3zMiSrZ+6UBheEZPDEUpe6MGCdW0QHjNb7P5+nV2DMa
 vfB0uVTYnBtnX93fCqG/0gC+6CfKthbYapOJ1BA==
X-Google-Smtp-Source: AGHT+IGJJD4YdSne2E2CDJPTcw+1HwH33TbgcTt5pV7mkcprUs/4t0BFrxvbt5GIFxFuNWKCvnJHBDIxbicRlCahRC4=
X-Received: by 2002:a81:6985:0:b0:64b:2a73:f050 with SMTP id
 00721157ae682-658ef2494cfmr10696077b3.23.1720476690444; Mon, 08 Jul 2024
 15:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
 <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
 <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
In-Reply-To: <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jul 2024 01:11:19 +0300
Message-ID: <CAA8EJpoD4og3eb2aFB5HkFh3vAfyhqG=smtcUbmgNeuWwaJtGg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>
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

On Tue, 9 Jul 2024 at 00:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 8.07.2024 2:49 PM, Dmitry Baryshkov wrote:
> > On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> >>
> >> On 05/07/2024 16:34, Dmitry Baryshkov wrote:
>
> [...]
>
> >>> I'm not going to check the math, but it looks pretty close to what we
> >>> have for msm8996.
> >>
> >> What is the consequence of this?
> >
> > That I won't check the math :-D
>
> Dmitry is trying to say that you should check whether the calculations
> are the same or almost the same as in the 8996 driver, and if so, try
> to commonize the code between the two

Not quite :-D

They are slightly different. More importantly, this is a different
version of QMP PHY. So, it's not really worth merging the code.
Earlier on I pasted the patchset to move all HDMI PHY drivers to
drivers/phy/qualcomm. I plan to integrate msm8998 support into that
patchset (this should not be delaying this patch though). But I don't
want to commonize the HDMI QMP PHY code before somebody implements
support for the third version of QMP HDMI PHYs, the one that is found
on msm8992/94.


-- 
With best wishes
Dmitry
