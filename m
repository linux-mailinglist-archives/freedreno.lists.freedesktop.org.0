Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A7BD12BB
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 04:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFCE10E362;
	Mon, 13 Oct 2025 02:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="feY7Lr9O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6824C10E362
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso6862746a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 12 Oct 2025 19:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760321353; x=1760926153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
 b=feY7Lr9OIelC3UfPbPkJGEalfDYk1uL/nKaQ5XFsorww3WLRkYHs9PQ1ZOvcTSzyHL
 6L6nevWjy0a/Ml7wzf9IR2T+Vlrh5V8cVM3Df9cVdP9ttjYBFUl9RYT1gfrqVThr7EQs
 a1LnUtQtQKHmuyvtnpV6DvsVk0cS+slfe48Mfq4lBEEWLmmcOQSLrnV6xoARSDZnX87J
 z4M2eC9pfx0XvuUZIjhEnJJa2EgHrcsG3SwWnBzDDWaLfovrPXi2kzJp+SBdOq4dCcUw
 jG44dBDrRLsPc2fbaYLDDQANIPInZeNYazpIuwtYu45cnynIV/6+AijHgClxrvl41XUK
 Biyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760321353; x=1760926153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
 b=G71ieNGGhEfHw+AwrVTvBP9ZprnaXjgxCqJk07KGj7uNVDrziLj1x83rlCHl3PDJ/x
 H3mklfhS5FzTx564di1wYB/54Xs+GZKfCUZKeCYPPogVo3SKt6iItQMr1Jg+RE7eAjlv
 hKwNLhxEvXXqTME0icDa8CVutR/U6UH/gEIVx8HEuo14V0m1siSU6MggNmCYKb8Vg64M
 Og3MborE7rwvYadonSHuNWegMYfGF10Z6AXR3cm99l6YCIRwW329nR3bjYIrFZYzliDU
 ATL/eAQCLwQYlTTymoqoDwgb8/d3wOW7opSGKLoZ8HZyHsJ1dWRubdFuCCO2QCi5A+zO
 pnZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwGQxCf1dhUM4y9C+WiYpRir0gwtTSmw30B1V58pP2V9MIXo7Lie2FP97yl/T1kiZ4FNXTh11yl54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAf6xJ1Ms2cmzYXJWUaD5SzbYdtU6PoV3PEYi+cEs5xiloo98f
 W3s541p3jK2vizilJmpWRc97pDf+Eu5Zg5jIVR1UXmptKF8z5HAOJ4WxobBh/6R/dBmWwQX7UiY
 WfypB3aaywI6ZWeTHNSjyvDIzfFVOpYg=
X-Gm-Gg: ASbGncvr1EPA3Z15X1KA1dIY5HJ9EUCOUXm69/A9RlhL7yP6EoJRQWp7tmiPhWAHn+s
 VSjiHUZagWRORn/eEo8/fiN4JkYf76y7BwioUG0XaVV2pS/czMIU9QwlJLxLkoqHeOsa9iI1yvO
 c+oAhvw6BOftZgGq3V+vG6OxBqKM26TPsjzuMvP5oWnbu+0hXa8rk4nzKVPbWUQBGTgYZaejusw
 /xzBS6uIMF0NREbHyMEPG8xbaUoHZh2GWnR
X-Google-Smtp-Source: AGHT+IHVNbPGb048RDwqDj3lyAGwhgF/NMREQX2ImeZH2JgNCDST+u6RIr04BMZZplROx4+MGMoD+CNhHbPvpufAoho=
X-Received: by 2002:a05:6402:144c:b0:639:ffb5:3606 with SMTP id
 4fb4d7f45d1cf-639ffb539d3mr11793727a12.33.1760321352764; Sun, 12 Oct 2025
 19:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:09:00 +0800
X-Gm-Features: AS18NWC3lE60pFWwk3f8ArZQPSoc7l5pOk_MADcRyruwf3oXoyqNAhiZmduKRSQ
Message-ID: <CAK6c68jzWLYgrFXRUsYkvSWE9CRSGVmeyOp7cNhixhyBZBC=1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>> From: Jun Nie <jun.nie@linaro.org>
>>
>> Some panels support multiple slice to be sent in a single DSC packet. An=
d
>> this feature is a must for specific panels, such as JDI LPM026M648C. Add=
 a
>> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>> feature in msm mdss driver.
>>
>> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>>  include/drm/drm_mipi_dsi.h         |  2 ++
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>
>Please extract the generic part, so that it can be merged through a
>generic tree.
>

Sorry, I don't get it.  The generic part, generic tree? Do you mean
the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
tablets that are equipped with qcom chips. I don't know if these
panels are used on other platforms, and if it is necessary to do it
in drm.

>--
>With best wishes
>Dmitry

Regards,
Junjie
