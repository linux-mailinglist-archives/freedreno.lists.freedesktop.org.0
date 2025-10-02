Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372EFBB5137
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 22:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD3D10E845;
	Thu,  2 Oct 2025 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XjA57dB1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715D910E80E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Oct 2025 16:18:32 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-33082c95fd0so1372483a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421912; x=1760026712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cs0gCH7mhvaO1qaWvoNXBT3MrPhbI+ZP4G1QowHi4cU=;
 b=XjA57dB1SX1a6drYmHwcfsi297M1V3GS3PLxQZeyOq24qrXHFtkgKVom1V0sQM2xfF
 ziZwzGWPf+n4Kk/2K0ZoI8RBHOW5l53Nl0nyd7VDLHrOWzPoKNBP8WiB55u6fJEhtAVe
 SBR4YUSJXIAQFKmISVIWDBPBlpQZuyWI2+KwlxmU+NDYsmV8hM39XbZHXKAuwRY3koMP
 T6eT0r3cQC8eOdFuzypDBQsMT1yOAv96iBewJJZMTRTAbkQjFGt5DR6Dk5bZecAgZIBT
 gLqK3lXB19T6+VjU0lDSqtIGAA32lHG81q1JNOHddPqzy5G/vxCx3d1MA+woYZUN4d6Y
 HrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421912; x=1760026712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cs0gCH7mhvaO1qaWvoNXBT3MrPhbI+ZP4G1QowHi4cU=;
 b=qLEFznnBHt6wOT74h6VVTdtmPEqrxmcfM93eHBFkMjf87IkPWvVfUDNA58pNKN0Am4
 y5VgdM679G8wr/Rvps9ZrRWHQgS5RECqk27L5y5nZ5sqsO/AR7GGSlonbrMyC1kXe/xq
 rCEDVT3+JKS/SWlzy2QzBhTb16GaHY6awPaHvEgEgFZ3dIjo8NYeYXhoPt/ii1Tea+77
 GXu4Ny4fA4nnKWC4lntKx8tO5g8oFbp5kD2RwSXBt9GJZRHbhSnjq+52uoFspBhkKfcc
 oaXMqV0IfXtdfCktewsX+maSrDgJGcMGRKk9zzCarnLMn70/SEoRPbqoGeZyRQxUGo1i
 l3bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpe6tNLvDsMZCUbep+DKIbzbltAqkIXsux8Lo0mkaeo9X7dWw2I0BwnLdFjbx2yDHWW7K9kRkfjIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwER0CEjtvzy3Jq0x0E4OUHwEzDrkAxOKy2a1+BGIz31FlExbog
 OYwHXpboT/1f/dq0au3gWpz3bASsCXC+pDqxppCVNckAQUzx2zfciPAVHC7Da/8NTPxU5zXcxGO
 Qt2BCsKDDI0In83fYHF/MS7fJgBOpmSI=
X-Gm-Gg: ASbGncvznwxdrOko1a7+QKoOkN83gZmCeVutAqxarMZgQCJFr+iOqLsmPZZ4gIaOAyX
 qefzLkixEqt3sfNhy68sJiRv4ms/KC26vuEjPb7MAEFwSSzTKX9Ane6WjG93ox78llEUja2GnH4
 Xrq1znpihq1ckk00AWjSSHHbdUjPpnoWUsA+8t8Dh4Tg3lMSYjHtOYbOOt/mUgLO2peABIfsiUK
 QHVWCuZTzXzKrfMZU636ddQthjJYJo=
X-Google-Smtp-Source: AGHT+IFg+PLUyWcoSsUAUf4htH875wDYY+hRdnGTted2LRpK1PJKUcMRnSKqqpUMk+z7FMvgEMVUAaitgkdEcJV3rx8=
X-Received: by 2002:a17:90b:38cb:b0:32e:ca03:3ba with SMTP id
 98e67ed59e1d1-339a6f2e679mr8142326a91.22.1759421910494; Thu, 02 Oct 2025
 09:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
 <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
In-Reply-To: <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:23:27 -0400
X-Gm-Features: AS18NWDwyTbNJJLg_4zVrM-EyYlDVd5QGpchaU4fwAQ38Pf7WEw2ME2yXmyyL7Q
Message-ID: <CALC8CXfTA6bBN-ZthgRoPXvv-BZQtvL7w7a+6bgTe_GTWnnfHg@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Oct 2025 20:04:12 +0000
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

Yoongxing the Chinaman, and Dmitry the RUSSKIE; Conspiring.

On Fri, Aug 22, 2025 at 6:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Aug 21, 2025 at 11:36:00AM +0800, Yongxing Mou wrote:
> > Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> >
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
>
