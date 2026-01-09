Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3163D0C046
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 20:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4E10E932;
	Fri,  9 Jan 2026 19:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q72Emv9f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A010E931
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 19:11:31 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a08cb5e30eso8597255ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767985891; x=1768590691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jGucWZxG4H0oACzMuTEPVrhVqGkXJT23twyUUE6h0GU=;
 b=Q72Emv9friIIkC1SSj3ZlU0nQH+CsYho8Zp+J8J3XsFvN1dqnS6m1QaDoL+PU5QLIQ
 RcQC+oBuKn9V30sGVj3U4pZM//moDX7FHsgG6OplQ+6tCt4hyX2vlZ5pQH4IGGZBMxdL
 tSUpqqTlRPQGFEmZFRrtBdUBt80QtwUVbEgHmlanqaKEBuu2Y3wYfJJCgFNmc4NtYdyS
 euyp+51eMA6rmOw1yzhb7ME/Qvt8UQ1f9YwMsU9S84ZFJx6ZnmchYzqn+we7906w0hwo
 dnh5AbRzQq5TYlIHRSslc1q2rrGaXgPXO8ZytzfeideBApHpzfkY1HDaffWGqnZsY8xr
 1w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767985891; x=1768590691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jGucWZxG4H0oACzMuTEPVrhVqGkXJT23twyUUE6h0GU=;
 b=mCI2rdSYcFGQU7t/S/LB+LWbUJe1rCMlScbzkhRx685hsvJuP42IjcKBYvVYmoXQRE
 M01Y78qcnehyqg2q4TtZDnMNv6IcdQPVTYs8qMFBgB6ZVIMq4+r0hC3IDLyoO+HxqH+J
 mLzPK6T3QVzzE73ISF/3GNGXGfHfWdZ82scnEJOHJXyhEuqw1T82RfGUOe6snON12HFl
 gXj93YuSsIQr57uy5P7auOVAEWRGOv6ne9xvuRC71LkF1VsSM/Rsk/KXdGg0ubqg+rdv
 7fqNUSKB4Mui600lfy7G0axgMFk+UvDeTgkOhY7IO5bAs2GjzA8UuSPo5uFjX5Y12qxy
 lPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzppklnIi0qolp/Q02roSan0VYP9O1sRoAbI1Irgkjm/l+qyFAczkzyvI8ed3UVDnT3lGfKVS40Nw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2/anCPgew4IzmfWj3K9vrZn6dFDXuKCv8GNThhosa4ru+fstF
 BhEi9C3PwnLhn9Yl50svbzTNjV8soTNabuF2v/mjE6MMHe8V0olM7DNCLyPkVwjs3qews/rhmXB
 3wlVEYw7YrksCSiTmIpdPHO8tFqCrNZk=
X-Gm-Gg: AY/fxX4J3yrhIh27Gz7YctDSxfLeU1RJTflWh/TR035oLaRIV5Bctw+ATLqU2DbfBiO
 4iLE6eakzdJkd0HYfVQxULVYMrClbESXMGV1MRrkHRhl0DSijE+m51X6OvNFzKnZhPA19tVBMSb
 85ZpxYhMKd8mTpaQgGx73WLUq2BojHbDhiolbPHncJpS0veMuQ44lCr5kwG4OyK1lEBvUWGpj8g
 18cv58uZKL4/1tGPrl9i1epLEiG0ybNkgSc4rJ0tzjCElpHYRiggNCdVkgEYtWtRzYnTck=
X-Google-Smtp-Source: AGHT+IF7dTGSqJqWZzwnIHslSdlw6WekSrgn4f0+hOUkO918cHCqTxp+XTuZOMvQz9g2tVbmrdlQKCQmnYtBYPnHFfw=
X-Received: by 2002:a17:90b:2e0c:b0:343:e480:49f1 with SMTP id
 98e67ed59e1d1-34f68c28ea4mr7819215a91.5.1767985890668; Fri, 09 Jan 2026
 11:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 Jan 2026 14:11:19 -0500
X-Gm-Features: AQt7F2qD5NQlHCyqdD_zHjmxV20bvOEGT_rKXFuqrKobJujnG-hNvI21StHEA5Q
Message-ID: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
>
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
>
> Patch 3 should really be merged after 1&2

No. The HBB value currently returned by the bootloader is *not* always
the same as what we use currently, because some SoCs (like SM8250)
with the same DT ship with multiple different DRAM configurations and
we've been using a sub-optimal value the whole time. After all, that's
the whole point of using the bootloader value. But patches 1&2 will
only make the DPU use the bootloader value for HBB, not the GPU. So on
one of the affected SoCs, it will introduce a mismatch. You can't
change anything until the GPU side uses the new ubwc config as its
source of truth.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> - Handle rare cases of DDRInfo v5 with additional trailing data
> - Rebase/adjust to SSoT UBWC
> - Expose hbb value in debugfs
> - cosmetic changes
> - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-de=
ad15264714@oss.qualcomm.com
>
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>   coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>   branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94=
d505cd5593@oss.qualcomm.com
>
> ---
> Konrad Dybcio (3):
>       soc: qcom: smem: Expose DDR data from SMEM
>       soc: qcom: ubwc: Get HBB from SMEM
>       drm/msm/adreno: Trust the SSoT UBWC config
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
>  drivers/soc/qcom/Makefile               |   3 +-
>  drivers/soc/qcom/smem.c                 |  14 +-
>  drivers/soc/qcom/smem.h                 |   9 +
>  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++=
++++++
>  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
>  include/linux/soc/qcom/smem.h           |   4 +
>  9 files changed, 485 insertions(+), 120 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20250409-topic-smem_dramc-6467187ac865
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
