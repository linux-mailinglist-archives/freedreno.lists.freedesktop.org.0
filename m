Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C405531E8D
	for <lists+freedreno@lfdr.de>; Tue, 24 May 2022 00:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161F010E4C0;
	Mon, 23 May 2022 22:23:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A63510F41E
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 22:23:53 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id g21so5129280qtg.5
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rhBj+A73ELnQFoNbPkX2hSX+KSJvhC1M2m97Vu/479U=;
 b=gbPrlQWowkamDaF8K7+q80kVb+d89r/jamslVl4EJbre5cyL4MvX/5dcBKf6q2VH6I
 er0Sb4aM2gD/x/rh8OZFGe5f38F5QBLwjqdPHWy6SbvRKdEr1LsFj21PaHNR2RtAXp41
 xyRRDnUVrPJRirTm+W6lvH49HTZpDQ5DmBXXZVXbgnuR9FYs25IwKDgZAYRLtQJiyNEu
 HRytXtVkCaxl7VXdZRBaKy51L1K6gXsoxJF18WY+OsgHLGj/NYqt5M1Yhfhu6eanRMws
 XsB9QAYGXJvKLKb+Wh/Mq8dVVQ5IwnxBXFlrLM40n6unAK9HzEGRQ3TNMXvT5172SkoC
 SZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rhBj+A73ELnQFoNbPkX2hSX+KSJvhC1M2m97Vu/479U=;
 b=xPL3+hCTuk0Jzsrt6JTYjk084SQymoMftvrEUxi3RdyxCdazV70jN8aFQWLf93Dtk/
 hWnidYKi8elm02JZA8LqVeoOemIn1wyTnlv8xhOGT8HYCYEz9k9bLw5oCmAzH21zaai8
 SOnAAd8kfsFeNZM+lI/ZRGrsvvv+inv3PUuUHjgQnm9hIlHnoWxvpsNtP2k5tiVmcoRk
 zvDOkZoouIgh8ihWFVBUlUVpAaS8vNzZ44xhn8U3w04srp8wFCRWqrzPjdytbdiY/zev
 5i9ZDhPT12Oh5fSizdAv/HGV6t9Gl8InGZuZKGCQ+aq7x8LwOKJnw9SIySB5crWlyI4+
 N+qA==
X-Gm-Message-State: AOAM533WWWcCm+6iRqDHFAmi8/br2ZXrzwq2HcAuLf3fI0mtalGAdbtx
 tJVo3pp+FuGESuVN42xKp97SXsRDRfDh54MFeQxGVw==
X-Google-Smtp-Source: ABdhPJy+5gX8nlhFRHAsmFRyR/Vx5wxFrt1lplOIzSVVkI5CsMu823+NB3bn7fO5Vn2JFo1KVJEaIHl+pCk04AND62M=
X-Received: by 2002:a05:622a:13c8:b0:2f9:1cb4:9079 with SMTP id
 p8-20020a05622a13c800b002f91cb49079mr12977238qtk.629.1653344632711; Mon, 23
 May 2022 15:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204337.19739-1-rdunlap@infradead.org>
In-Reply-To: <20220523204337.19739-1-rdunlap@infradead.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:23:41 +0300
Message-ID: <CAA8EJpoLBLVv3Snth2Jn-aLAXTOnOas=zcns829ddr4mF7sNig@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH -next] drm/msm: DRM_DP_AUX_BUS depends on OF
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, 23 May 2022 at 23:43, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a Kconfig warning for DRM_MSM by making it depend on OF,
> since 'select' does not follow any dependency chaings.
>
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS

I think it was agreed that DRM_DP_AUX_BUS should depend on OF ||
COMPILE_TEST (and the patch has been submitted by YueHaibing). See the
thread at https://lore.kernel.org/dri-devel/9534934e-4c4a-ba2f-3bc3-d6d241e=
625bb@linaro.org/T/


>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dm] && OF [=3Dn]
>   Selected by [m]:
>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM || SOC=
_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy] =
&& (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || QCO=
M_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=3Dn=
)
>
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus supp=
ort")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_MSM
>         tristate "MSM DRM"
>         depends on DRM
> +       depends on OF
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT



--=20
With best wishes
Dmitry
