Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E2094236D
	for <lists+freedreno@lfdr.de>; Wed, 31 Jul 2024 01:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE210E5AF;
	Tue, 30 Jul 2024 23:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QCcP3vkw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67E10E5AF
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jul 2024 23:35:12 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6687f2f0986so34374887b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jul 2024 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722382511; x=1722987311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
 b=QCcP3vkwCc0lQfWO86VFMGAj8FGP5ZTCEzm/p1nFelIEU1AGUkyxQwLdaS6y5GKmIA
 3ivt+HvsHSQFQgt7A31u1Uc5KM1LiTHyFkIxxj9tgF2iwZNTadN8G8Xu4v/JVoB9zgRb
 Ls/YgcL23DSN/VF+u2f7uU8kjJ49y6KM3SAp5bQivZJZlBU5Fd3ftQhadIj/JD2Yude4
 7jilp80+ii37OTcWElXf+FF1I2zh7KIHCx/HzuOu2cPDpwCJdONGMYA+CN4iYCVKeprI
 zqQS/lXwIJ83LAxMK4r7NV4Mn2/xnoJJ43WqAqzTtSz1NFzvFI0hZpoqJi9/mJzgveY/
 T1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722382511; x=1722987311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
 b=HH/vJ4Ahc5gRLH2p423wkdzF8DGgOBh+QLVRoZf0qGDGPFg4kDnMGYAK49iW4CafRj
 tqmA3otyc2PYMeQb83O5WnRzyP8t4CFfA0K8DF2EU6n4Keu1pKHPR5hsjSvUBgCrcuYc
 xR9i8S6GWR5zWSBYy36o85U2fG0Vd2OmfbujnBg2paoRKN6uH5BAc81PVYGOk74iSMO2
 w9Ytmmc05COHe+MRfrjO7n7i1km6aN1iiXsoOnMGwPkLY1XxuiuVg67QyRP0SFTWTmEN
 3Aci51lhkq08Kmn3/NnC6kKhMtyEaFHtJh/9EcdZ30GB9dXm0Fr01sL/72GNptDvaA8E
 YMew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCzIjI9ma57g1BHO7gopW2z5Z2y5hfkT3XLnhUDxzGQ5h3OsK72BrmsNstLpjiHLmvwupmab2Z0MmvWMNXTWN8RIcjH26auFRAtTmZDthy
X-Gm-Message-State: AOJu0YxgzYCl4ETDakxlXkRxa8chUE7SVlnX4ShJNKsg+pJ8nP4KfttE
 6fbnBYjWZESVJ6MD4eqXS18yl8unLKOi8CHW/o2H4OD5K8yXmR7iMskQn/0liLsbU0wwyo0k7vO
 1958AvlSfioNVliG5UO7863nCn+5TEJq+fsO3PQ==
X-Google-Smtp-Source: AGHT+IF5Qu44QrOZ4VrsYyLpvrmeLZVdMHwBqXOOZMpIBMYFD1xy6BhuFX59kqGp3Tq+s0ubsGow/En+HH7guzdfyGk=
X-Received: by 2002:a0d:fd01:0:b0:63b:c16e:a457 with SMTP id
 00721157ae682-67a069151f6mr132078237b3.13.1722382510997; Tue, 30 Jul 2024
 16:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
 <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 02:34:58 +0300
Message-ID: <CAA8EJpok+M3xYqtKDM=N=+fc778ipUdYcnNBLLEXMkpNjjy5rQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 31 Jul 2024 at 01:27, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:58:19PM +0300, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> >
> > On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > Hardware document indicates that widebus is recommended on DP on all
> > > MDSS chipsets starting version 5.x.x and above.
> > >
> > > Follow the guideline and mark widebus support on all relevant
> > > chipsets for DP.
> > >
> > > Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
> > > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
> > The issues are present in the following commits. Please consider using
> > them instead:
> >
> > Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
>
> But are we really fixing any bugs/issues here? While the docs do
> recommend widebus, we're effectively enabling more harware/features.
>
> Unless there's a strong reason (which I'm not confident that the commit
> message entails), I think we should drop the fixes-tags and just bring
> this to 6.12...

I'm fine either way. I'll check tomorrow if this is required to fix
https://gitlab.freedesktop.org/drm/msm/-/issues/43.



-- 
With best wishes
Dmitry
