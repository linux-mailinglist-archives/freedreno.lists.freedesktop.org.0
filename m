Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B4A50B18
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF5789A88;
	Wed,  5 Mar 2025 19:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkLHLiiQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B1889A60
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:10:06 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3d03d2bd7d2so66209105ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741201805; x=1741806605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
 b=KkLHLiiQJ/SNpbXUeesVqZiXtAbDrWdq24oFMhT4FOTrI6MZ4oEBRTscriebO0vxOl
 mOLMf28QNrVp9LEOjs5N5OAIxs5+M47/xNEWiREbkI1FXS3Hq7P9C4txBBovRfiCoUIc
 eFIQiq/W+dKrsRTVfdpPUNQ37bEdUWOGSQve7FRAQzGL9Ija1+usL84vivcz0omBBBH0
 auNBpx10S+ajqiF4x2NxGAMBiDInpPa8r07ZQMZXfXgDNh+ksWUYXDWPeSL3aw86gvFa
 4GllrH2wFgnl1AonsCu0+VCsLSep/8CM6w/bF2742bblib1S8gY2UwH0npEWiPV/4PQ7
 xIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741201805; x=1741806605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
 b=u87cL0ejIaKpw7Qm+9VHRbYMuiW+5raFA8iML1rBDq9cPi3H9RLpo8JQnmX+knRfGw
 P6fNWkR8M4hyBNTQgM6BjmfkYrCPOSUT2CQz6FLAL6b9q/VZSERhm3eV/ev+lpFNOpPL
 Qmh3fH8Zdiv7GynuiRSzQzp0UEcRwEo9X1yfsrYB5s0mNESz5MJu0dHeFbq+UhDsy6sw
 YGK2Qr0wzJUEAs0m4nKHJvfd1yCYaCrlrWr6y1SDDFAWSCMz4xOtha9zI5NPgyG0VHXG
 YVA2RjUME9F0vplV74Dxf9xBa+lTb3w/d0JVUIqhZx4UjxTI9ZZ1/bN2PktGOOOt8gTd
 rUBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoh46Ui0Tt9CxKRgYXccV7O2XSIJ924U52XprqFrix0MUUAbUIr8aMSQYnE2xDreD8SuTLDgeQ4ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6prORVWfm12tRHqSlyTzp8iGgq+pe9j/DgzkMCToOAcJIbXeL
 Af/pJ1JiKlAsQiJcItgMEg5VcEiyYAbtTjWM/FF/3qa9e5NGqbdaKexASBtJ7ormFDs4oypySnf
 V1xnT4aZNLCx82Ipmee83bl6kuyk=
X-Gm-Gg: ASbGncuXXrOBq2vk7gJiiEewm6qpzFmccFaRlWY4rJQOho59QvIUyfOCrgvRDSGNRGS
 dzTKVtJqzXxiJKLjcoTwB9BPQ6RI7VcwBUHw+pWgQ0W8JsukEWRsgkHxjsd4o1pM6b/mMR3BnpM
 NZFXsidlhyElXAypMg2dCxzWwjVA==
X-Google-Smtp-Source: AGHT+IHwXUPkcwmz1dEZv6qs1mqFyRbKWhc6VLppFLp13raa+hash9p1l8om7PD+XzyVVCshzoOtuLCzkfE1/WnrK9s=
X-Received: by 2002:a92:c54e:0:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d42b8a6723mr65466505ab.7.1741201805384; Wed, 05 Mar 2025
 11:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:52 -0800
X-Gm-Features: AQ5f1JraaawwkUmCt4yL_sk7YXrsKqREgeX17Qs1rzauOQ1SG0Q4PNOpFqsI15E
Message-ID: <CAF6AEGszbZ_2J_LkkPMuCeQwma1xtO2=ZwWQcyrsxb+=qb-koQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> Up until now we have only called the set_stall callback during
> initialization when the device is off. But we will soon start calling it
> to temporarily disable stall-on-fault when the device is on, so handle
> that by checking if the device is on and writing SCTLR.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++++=
+++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce7=
2f48e3b38474da2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *co=
okie, bool enabled)
>  {
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> -       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       u32 mask =3D BIT(cfg->cbndx);
> +       bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> +       unsigned long flags;
>
>         if (enabled)
> -               qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> +               qsmmu->stall_enabled |=3D mask;
>         else
> -               qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> +               qsmmu->stall_enabled &=3D ~mask;
> +
> +       /*
> +        * If the device is on and we changed the setting, update the reg=
ister.
> +        */
> +       if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> +               spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
> +               u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> +
> +               if (enabled)
> +                       reg |=3D ARM_SMMU_SCTLR_CFCFG;
> +               else
> +                       reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> +
> +               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
> +
> +               spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> +
> +               pm_runtime_put_autosuspend(smmu->dev);
> +       }
>  }
>
>  static void qcom_adreno_smmu_resume_translation(const void *cookie, bool=
 terminate)
>
> --
> 2.47.1
>
