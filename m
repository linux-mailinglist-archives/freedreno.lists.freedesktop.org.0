Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C270D1D4
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 04:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7572510E3C7;
	Tue, 23 May 2023 02:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79F10E3C7
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 02:56:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-510d8d7f8eeso665699a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1684810589; x=1687402589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6o0pldmtPNZczHK6kfIrJdzD+PEWsvSqi4EjRqmT/Y=;
 b=e11dfn1JU9wXqIahkfF02Gf522PcNJQDKa2O7j7arpRNtAJ2Ix/FSqXIyTXApmyvpG
 xqvhZzMdbmyVbhaRlObPxzUge+C9oKx9Itqzwj4DNrXdFAv7kp+WvdGB3xE435lw7jFT
 lvi9pyaA8BQwwKnlMZbu2TcDjX1UkrFPiQO3C69lV78eRrsIeb7XactRS/+o2X6ds4Oq
 CifFeC8clqH8fHML5SIM/QY/85h3UAk2L1JwLDiHe79MTvP7VzfAmkruCWIZ+EVDvHan
 BQI2rTQ4F2c7bs5TAbu7rXfFX5jDWOEcGuxgoNYBfTHM+VE3nfXJKmrjVe9cyfPhhrBy
 /oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684810589; x=1687402589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6o0pldmtPNZczHK6kfIrJdzD+PEWsvSqi4EjRqmT/Y=;
 b=KH61T2vxYk1VtiKDelDkC24dypy5ZVdOYAQ7/dkgZtlOcxY560sz46D61or6vJH1ps
 rGx1mxqGzHcxpyqigdBo+6X+fq2BaLSMH3bKefyMqdANV6rl79V1VtXGQbEFKl0f01h/
 wy8NkBRnKws+a4VRvCMpDnrE8/cm8+N/eG2o8vZlTGYQHWVLZ5DWXX6W5/Z9NleA7A5X
 YQdziTAo/PkQWOh01h8e+Byh3SuMiwz/vUuXyUxSxtcCy7HxBgAHsp5zIe9OiDsFwCeU
 6jwEAGJfHBVjUdHnlGr8kOJRQk+GWmMf/RLcLrCsMkq2f91MGJCPXu01DC0D57dyywXV
 WLLQ==
X-Gm-Message-State: AC+VfDyqQNe9yqnLVYi87GpihT4fiMUnvJfgGK4Umn33hD2vt1ipGOuC
 dTnZ8fRD45fX7nvJRzJ0UiVz7s3GCXjPxMapJO4Byg==
X-Google-Smtp-Source: ACHHUZ4Zm9Cx7sVlYhjjvAXSE1TSetEayzYnn2DXi0k6UasemtiYelBRWj9ZoL5JMF+LnmHGv/vUswTO23KNbH0i4+A=
X-Received: by 2002:a17:907:9716:b0:970:19a2:7303 with SMTP id
 jg22-20020a170907971600b0097019a27303mr2892607ejc.19.1684810589345; Mon, 22
 May 2023 19:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
In-Reply-To: <20230523011522.65351-1-quic_bjorande@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 22 May 2023 21:56:18 -0500
Message-ID: <CAKXuJqjgRdr-16h3G_7u1KDfKBnfu2cmB9FsNYdKOpzOKawU=g@mail.gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v2 0/3] drm/msm/adreno: GPU support on
 SC8280XP
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 8:15=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This series introduces support for A690 in the DRM/MSM driver and
> enables it for the two SC8280XP laptops.
>
> Bjorn Andersson (3):
>   drm/msm/adreno: Add Adreno A690 support
>   arm64: dts: qcom: sc8280xp: Add GPU related nodes
>   arm64: dts: qcom: sc8280xp: Enable GPU related nodes
>
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  26 +++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  26 +++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 169 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 113 +++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c         |  33 ++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |  14 ++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  11 +-
>  7 files changed, 387 insertions(+), 5 deletions(-)
>
> --
> 2.39.2
>
Tested here on my X13s with GNOME 44.1 and using Wayland.

Tested-by: Steev Klimaszewski <steev@kali.org>
