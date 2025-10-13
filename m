Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F012BD12DA
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 04:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0992D10E363;
	Mon, 13 Oct 2025 02:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJPfEvSP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E9310E363
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 02:09:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-63963066fb0so7690874a12.3
 for <freedreno@lists.freedesktop.org>; Sun, 12 Oct 2025 19:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760321384; x=1760926184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wN9WKZXYO2Nmb+YIelwARSerR3E1lKOGfH0FqHzn+JU=;
 b=AJPfEvSPFWpZwnPLd5ms+NTaObrPIQiTp22bYHSUJ1ydY+UK++X5J8aNCcFJxuK1qa
 qNnarLZWZ4uNfpuITkRb+rRo0XTuNHuPfCA4J/8MCUdwHjdZbgWH5MnwkKYSPZkktYx3
 vOyG1q/UYYlWz+x0eh/LfBEenaAV/1qyYlWxy4ZNO2H98t/iYPQF+ivmHduWMHsrlsfg
 evoF88WNfwvgHvhaNcrIWfUCS6pEdSP+JhfjxPZz+W9Ba6burDGK6xv/RqeXIryiSnpl
 4t/obBHxLc5aNN0aKavEP/a0E+gMCSvcFB0Y5KCdEqtOiU4cZMOq4vBlcHYS1ZX15RtO
 bMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760321384; x=1760926184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wN9WKZXYO2Nmb+YIelwARSerR3E1lKOGfH0FqHzn+JU=;
 b=MK0c3sIW6TF928pB4p4tFT9lYQqa2mOcle9wSzHUj0cJVRexzspO6QqhfSufVEoAS+
 e9Y1JZtTTqXwWHh/QYhazvP0+oxUxnOXpQh/uaMeVPSjcOLU0oM29mpDIR6QxtAULeJf
 CVGeAQqpu5xzmHf/L8lmJSBvjuZ+Nh15+CitBi1Ihn0S8dJ/FSmkhQss4MhWQrSY7deR
 JeHyIyqbZf+551TTpcYjCp2JlUYRseuSvOrAtDTIcyU7eAsIoDYqBBotwU2qOwAb3TOT
 XZJ35OZXJFh+7PeHCDTkeKi+lK01DWQAf8Su4TJMIIeiagWc+fVtC9/b//Yl/HR4nhzA
 OrjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0hrrWn5qu1UWZXAkvmg8lhFlBoL2nc/DzuIC8ow74MahGVpx2BbVvMfnVQm0YMkg8G3yjlIK0d+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvucCHV7Gk0NazLxeU9Bjd9A2hjbS7Wb+wfUa+5FUyHdLO+pcP
 jssulF1DeM2DKl9zt9XK0yN+nb52UymvGSxjB60810jPHljIVVtZBZddav/b0V8h0gqqZnnk946
 d1n3GoOps+nw16ollnNZEbH6m31E4hP4=
X-Gm-Gg: ASbGnctX1/baUSDXy/uVcPLkPd9as864jzKOOU0NvNj3SEuDN/UmxY4ujrSWtdLOZrX
 /LA7C/lMgHRjcDCbFFO70u2TtAJtiL9tg1d8C92RybipMwkcy2hIujtEZTFeqDOoAeNVnop7RCS
 4fovmXdLu8qbme1LISYeOzD6ZWHeUS8QJ3wcJRy2k2ek4lZQ2pYHKlwhyf6ru28s8vQv9lmMjsH
 kAnUFw48MwTwM5NL2SoFdOd9Dvk6lkb8Yt6
X-Google-Smtp-Source: AGHT+IHSJMTE42FzCsgTGmPKRezFnzYeGwD48gJLrMiPETpubu6LIUbFJ/YFNHidT3rkFndsTeRCcQITlZmFIhHHLUY=
X-Received: by 2002:a05:6402:5106:b0:638:e8af:35d9 with SMTP id
 4fb4d7f45d1cf-639d5c3e994mr18251877a12.23.1760321384245; Sun, 12 Oct 2025
 19:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:09:32 +0800
X-Gm-Features: AS18NWB68269yeiTzdACPvm7V3NMKR_y0HxD4z4iqSVQM-VjCZQP0WcUwHJ0Wsc
Message-ID: <CAK6c68h307fRVR=QKJG1pRJuDi1oCSrSYXBamwpAMx_jUgX7fg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
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
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info =3D {
>> +     .width_mm =3D 250,
>> +     .height_mm =3D 177,
>> +     .lanes =3D 4,
>> +     .format =3D MIPI_DSI_FMT_RGB888,
>> +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOU=
S |
>> +                   MIPI_DSI_MODE_LPM,
>> +     .display_mode =3D csot_display_mode,
>> +     .dsc_slice_per_pkt =3D 2,
>
>As this is not a part of the standard, what if the DSI host doesn't
>support this feature?
>

Without it, parameters will not be calculated correctly, garbled then.

>> +     .dsc_cfg =3D &csot_dsc_cfg,
>> +     .init_sequence =3D csot_init_sequence,
>> +     .is_dual_dsi =3D true,
>> +};
>> +
>
>--
>With best wishes
>Dmitry

Regards,
Junjie
