Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2DA325D1
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 13:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9AD10E875;
	Wed, 12 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AjHJnuv4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608810E875
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 12:26:15 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f9625c0fccso60086487b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363174; x=1739967974; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=46uMxi16ondgGccvYcEvXMpewkDX4CAYjnXalJ8+Fuk=;
 b=AjHJnuv4Mr8FB6/2LPdo27hS1TUquTrajlKzGfVzGbWow7NeOmGE2BAHS93u09rUN6
 45kuEWIJ5U3OeV+NYytpw3SuUeG9DuJu6yusDHNin6jU5M5J2VOElSn4K15IW3cuWnx0
 6uQBcKiLKxdyfNXkTBp6wo9kno1GOCpOn7ONI4C2U5RObNkvIOpycRW+sB0x/VGMNVjb
 j/JQl8IHc1i3Xj6B731IJ41fvZQCyoAPCSOe5/717pMyPXaStWuHoYVYYCRjN/qt3tUL
 EpYnvV8G4CuAfvZGArlETVi6ZJubgmKfj4vgF5eLfPf3crLWq5JPi0h9654Dqfx87AJ8
 kIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363174; x=1739967974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=46uMxi16ondgGccvYcEvXMpewkDX4CAYjnXalJ8+Fuk=;
 b=CygZis5i4zyQ0cn4sopBk4BAegNb8QYmGvafIXoQiUvsYwoh4iMMKKTKkKHAhpPZxp
 Q3yyI6OFf4/ayP4mkXM9FVGZrBcslhuMRRMXnhx2Bn6B2f+B0KdqvldGIdvJfU8uSKMZ
 x/xhBvT0Rtr1QpWbEnZWYcZYu2Fo9v6r0F6LcepSppB4NRcGxi1kPjL55kdh+UaUrgOr
 7yCSfzaVmXvfqPImTK5J8JdrixBWI+BQ5184DbgqUG1AyLBiqgYOj7UXkv8D9fRTd4lI
 GSeAEi00pvUDkSLhLZ8f+Bfo+dKZIer+npOaoZaFzwz+5bsa/z5nPJkTecSfbq+ZTZ1F
 5sHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw8z0alu0PIbGl3HlNINpP2eGrIDD/4/sAUPpX7j7D4oTbxUDOMnLq/e9Np9wQOgEitlfc5TKj6J0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8sMYEenBZqO27nTwtmblvYbRh0LiEJqGnwDTGRyCldFcp4pHg
 hUDrdEAnU8c/3S+B4gbWeS7cHmhEuLqGoQAnT2cs6ZFCo5dwH+WeOLg2zQMHJqOJkRlhEFk98dA
 jFmHwBpRTo7ReD/TFNs/TkvCMZRWPO9FBUcjw1Q==
X-Gm-Gg: ASbGnct+KY5AHhLPMm3uzjH6cVNzb0WsTDtGoPoEtbqSzQDIrvaCY8bKoq30piCBbxe
 P+6/yYfEMtP4bCNgihTv+IEvHXwB9DjsqOIr+wivxJZ+h+SNN41pKc5YQIl8/YEN4jIE6DRu8la
 Qdj5prkBVQiPXgNdGbjr+jkkAcfgXy
X-Google-Smtp-Source: AGHT+IFO8HryvH361AtBzukKXHNwFD8iGdVHudVfUR5kStssIhbXkwBCk3h98SYdV45gucw51GK8rpDo/H/XBl0oEtA=
X-Received: by 2002:a05:690c:3687:b0:6f9:50ed:e6eb with SMTP id
 00721157ae682-6fb1f27c541mr33742567b3.27.1739363174466; Wed, 12 Feb 2025
 04:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <wyd7i47pkafa7n2yjohuvlh4btasxle4rw5xm55h4bhv24yvah@pfo224xz4xfl>
 <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
In-Reply-To: <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Feb 2025 14:26:02 +0200
X-Gm-Features: AWEUYZlVhAIT2AG6Qef-78nrtu6QQCvgOuZCQwLtZcDIi0z3rm5hNqs2iPwtYUM
Message-ID: <CAA8EJpoowyKcwDQgbWy4xGHzngNQOcWt_z_Xc49GFB1qYjYO6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 12 Feb 2025 at 12:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/02/2025 11:41, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> >> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> >> output. So not reuse sm8650 dp controller driver and will add a new driver
> >> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> >> to compatible with the qcs8300-dp.
> >
> > NAK for a different reason: QCS8300 is still compatible with SM8650.
> > Enable features instead of randomly reshuffle compats. In this case,
> > enable MST for both architectures.
> >
> So the original patch was probably correct...

I have no idea. I'd let Yongxing Mou to comment on this. It would be
nice  instead of getting a lengthy explanation of obvious items to get
an answer to an actual question: is QCS8300 compatible with SM8650 or
not. In other words whether they can support the same number of MST
streams on each controller or not.

-- 
With best wishes
Dmitry
