Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82161A63F
	for <lists+freedreno@lfdr.de>; Sat,  5 Nov 2022 01:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC29310E8E4;
	Sat,  5 Nov 2022 00:02:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2712910E8E4
 for <freedreno@lists.freedesktop.org>; Sat,  5 Nov 2022 00:02:27 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-37063f855e5so57326927b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 17:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1MQ/MvgoaM+wuk0nP2WaO7/jeSNOQs6jynN/f4ocCQ0=;
 b=uCT3v5zh5uawbjkGZjrXs2McNiTy2Rqhrb5BuXRgWWQ3haO3WKptSb8bw6bdNISc0w
 QR/AeB0cr0BrpmdJFm7kSehiwr+DXXxaAEIxgz62SeEwFJa3YgPivysVmrK2c+MhRaNL
 GplVFHS/MABcw4VntexMH3asNvfz0P0kWG/MM6p84ICuurNBYHgw/4saUx8TPt731IiI
 rhlUS7izfD1FmuABNStKk/pcOw3SlIJuCsRBuy5ukCBHHxNatZ6rhEHsT43pOgjIt5VB
 0HqCEhNfJyIf1RP9YoyUfHOB/DNIS8+UZMKtb9uVRe/syjvd7tC2XRYCUdi0FYGc+wza
 8zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1MQ/MvgoaM+wuk0nP2WaO7/jeSNOQs6jynN/f4ocCQ0=;
 b=g6SJ9v4N3gy57XcO/Y/Lfye2YkVRO0GutwrfufW59VvLCZQbT+goYygI2Vy7U0K30Q
 Eh4P2/B/Mg2CbB2aSbmi3qRSrJF9uyK0uFB9zfnRcYh+nhmbldeGM+barO47HAWKChS2
 /WSUH5asmooLbqCO8LMMnPROly5g2Y14R9Rd+LsJuO1BXa6HTROs8DFmIgWRsANMpTxd
 2z/L1hk9SLh7dhGsgoGwpruDgvJV4xdMGcfEAngSZLo1r7shgfOPYo/eSUZEZ109nmV9
 /p+jFROAyIcRqjbNkikosw6NzRGlGQNbtbWpNc7MnDOfNepGKiHavJC9gJs2+gJAQDPv
 jdbA==
X-Gm-Message-State: ACrzQf14+h+3XcvubvNb7pKM662lgRbOsOUuhDDQC0w2LzuoUrAlUPjF
 b9aI5fn4xySQjjnpsCohTn+l+A/w+kepsQMLNMhvsA==
X-Google-Smtp-Source: AMsMyM6GhYGELNu1XpnEwkyMOuaA+7Wu3xX/XDzXNHgAcq/VxoTSRKNQdulOGDD9Y5cLUlahvA8V0t9bIJCdojcP29Y=
X-Received: by 2002:a81:5905:0:b0:370:853a:80e4 with SMTP id
 n5-20020a815905000000b00370853a80e4mr25029225ywb.418.1667606546235; Fri, 04
 Nov 2022 17:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-9-dmitry.baryshkov@linaro.org>
 <Y2WOwZdMLjByosel@mailingradian>
In-Reply-To: <Y2WOwZdMLjByosel@mailingradian>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 5 Nov 2022 03:02:15 +0300
Message-ID: <CAA8EJpr6i9iG4EmzK+AzsqK6582LBScds2N5ZVv+=EyZwLs-Pg@mail.gmail.com>
To: Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v2 08/11] iommu/arm-smmu-qcom: provide
 separate implementation for SDM845-smmu-500
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 5 Nov 2022 at 01:16, Richard Acayan <mailingradian@gmail.com> wrote:
>
> On Wed, Nov 02, 2022 at 09:44:17PM +0300, Dmitry Baryshkov wrote:
> > There is only one platform, which needs special care in the reset
> > function, the SDM845. Add special handler for sdm845 and drop the
> > qcom_smmu500_reset() function.
> >
> > Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> > Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 34 ++++++++++++----------
> >  1 file changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > index c3bcd6eb2f42..75bc770ccf8c 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -361,6 +361,8 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> >  {
> >       int ret;
> >
> > +     arm_mmu500_reset(smmu);
> > +
> >       /*
> >        * To address performance degradation in non-real time clients,
> >        * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> > @@ -374,23 +376,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> >       return ret;
> >  }
> >
> > -static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> > -{
> > -     const struct device_node *np = smmu->dev->of_node;
> > -
> > -     arm_mmu500_reset(smmu);
> > -
> > -     if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
> > -             return qcom_sdm845_smmu500_reset(smmu);
> > -
> > -     return 0;
> > -}
> > -
> >  static const struct arm_smmu_impl qcom_smmu_impl = {
> >       .init_context = qcom_smmu_init_context,
> >       .cfg_probe = qcom_smmu_cfg_probe,
> >       .def_domain_type = qcom_smmu_def_domain_type,
> > -     .reset = qcom_smmu500_reset,
> > +     .reset = arm_mmu500_reset,
> > +     .write_s2cr = qcom_smmu_write_s2cr,
> > +     .tlb_sync = qcom_smmu_tlb_sync,
> > +};
> > +
> > +static const struct arm_smmu_impl sdm845_smmu_500_impl = {
> > +     .init_context = qcom_smmu_init_context,
> > +     .cfg_probe = qcom_smmu_cfg_probe,
> > +     .def_domain_type = qcom_smmu_def_domain_type,
> > +     .reset = qcom_sdm845_smmu500_reset,
> >       .write_s2cr = qcom_smmu_write_s2cr,
> >       .tlb_sync = qcom_smmu_tlb_sync,
> >  };
> > @@ -398,7 +397,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
> >  static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> >       .init_context = qcom_adreno_smmu_init_context,
> >       .def_domain_type = qcom_smmu_def_domain_type,
> > -     .reset = qcom_smmu500_reset,
> > +     .reset = arm_mmu500_reset,
> >       .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> >       .write_sctlr = qcom_adreno_smmu_write_sctlr,
> >       .tlb_sync = qcom_smmu_tlb_sync,
> > @@ -450,6 +449,11 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
> >       .adreno_impl = &qcom_adreno_smmu_impl,
> >  };
> >
> > +static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> > +     .impl = &sdm845_smmu_500_impl,
> > +     /* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */
> separete -> separate

Ack.

> Also, while I'm here, does "No adreno impl" constitute adding a
> compatible in the driver?

Not sure that I got your question, please excuse me. Could you please
describe what you meant?
We already have qcom,sdm845-smmu-v2 in the match table, if that's your
question. And there is no need for Adreno impl here, on sdm845 the
SMMU connected to Adreno is v2 rather than mmu-500.
Probably I should change this to "No need for adreno impl....". Would
that be better?

> > +};
> > +
> >  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >       { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
> >       { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
> > @@ -460,7 +464,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >       { .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
> >       { .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
> >       { .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
> > -     { .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
> > +     { .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
> >       { .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
> >       { .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
> >       { .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
