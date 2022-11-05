Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDA61DBC2
	for <lists+freedreno@lfdr.de>; Sat,  5 Nov 2022 16:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26E10E002;
	Sat,  5 Nov 2022 15:59:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1410E057
 for <freedreno@lists.freedesktop.org>; Sat,  5 Nov 2022 01:42:33 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id 63so5135179iov.8
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 18:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ODKfnMmjqxxzwry2pTLnKqAVyVDzDGiGj/z/1W+y1ao=;
 b=T/rVzP9JgkxediZX81Hppdtw7mCJGWCTHO1S2E1fbTcfPJjrkBHmbzeCCPDjtUXlok
 RsiLRcdlpzMb9ojKcI6wZs+4SFfINNyRjFdJZAdx2IVXLT3tgzU+g9QWbZDFXtVfxII7
 xMzKKXHjbI4utDnDwNkTzdh+Ls49QWCMjbFO9aeLJeSyAzB4QkvQ2lJWsA/7HL3T02p+
 gkgDdQQ1uh4GUG0A4pllbC+1wA/9X8w6f0M/AQSfTfDJx1vkfpP2nH3an+GLB2JM5jkt
 ajgwdLVWgxFewm+iqT9CrwXFdDSv1/xfkEwIeaIJRPpS7Ldd0f97P7bV/ozRBdHVbYZl
 bjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODKfnMmjqxxzwry2pTLnKqAVyVDzDGiGj/z/1W+y1ao=;
 b=8LsyxHWR10YtxmHgGyD+Tlj2osLnZTdxX+gJkUdsEOMszlzSvVOail/zhtZn3xZI6o
 IjcPlOjj3rv/s+g54/twbCBc+Q6rDHL9wPuxQNM21P+nWagA4DLInoLhTZagdGz0MI2+
 tR2ERaBHelqPj6VKdUaQp9jOjrY3orxFYhJXefWC1MJ4UWzrCs2YTjaY/TXwtXxBYlQ2
 XRXaR07PCwTVxviUAmmBrW49Z4UOdCX3zaIpZY3OrLQuGeA/4tZIH/84EJntgIfMY+Rl
 FYcHKKu1/BQsD2iVayxRX2E6iPMEFSYN/Gsu1JL8507KHIiKjb09mFyBnva57gFtlEAz
 KShQ==
X-Gm-Message-State: ACrzQf0OI49xMzgxzugQqT1lqHpzG6sRdqMmlSOm4b13xk58qfmGoJNI
 2PIxcTlZLk4MygR+xJ75v+4=
X-Google-Smtp-Source: AMsMyM41UG/uOsQbaFCDrxEV/e9tDu8m1vXMB8ZZz9ydR+slhX9KO5CWKh80sD2MNXQ3xyZhHjzM0A==
X-Received: by 2002:a05:6638:216e:b0:373:a265:3b6a with SMTP id
 p14-20020a056638216e00b00373a2653b6amr21616601jak.314.1667612552362; 
 Fri, 04 Nov 2022 18:42:32 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00:f1f0:c4d7:e39e:e2f])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a0566380cb300b00375b5370314sm108152jad.62.2022.11.04.18.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 18:42:32 -0700 (PDT)
Date: Fri, 4 Nov 2022 21:42:30 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Y2W/hkpUcotjEdSB@mailingradian>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-9-dmitry.baryshkov@linaro.org>
 <Y2WOwZdMLjByosel@mailingradian>
 <CAA8EJpr6i9iG4EmzK+AzsqK6582LBScds2N5ZVv+=EyZwLs-Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr6i9iG4EmzK+AzsqK6582LBScds2N5ZVv+=EyZwLs-Pg@mail.gmail.com>
X-Mailman-Approved-At: Sat, 05 Nov 2022 15:59:49 +0000
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

On Sat, Nov 05, 2022 at 03:02:15AM +0300, Dmitry Baryshkov wrote:
> On Sat, 5 Nov 2022 at 01:16, Richard Acayan <mailingradian@gmail.com> wrote:
>>
>> On Wed, Nov 02, 2022 at 09:44:17PM +0300, Dmitry Baryshkov wrote:
>> > There is only one platform, which needs special care in the reset
>> > function, the SDM845. Add special handler for sdm845 and drop the
>> > qcom_smmu500_reset() function.
>> >
>> > Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> > Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 34 ++++++++++++----------
>> >  1 file changed, 19 insertions(+), 15 deletions(-)
>> >
>> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> > index c3bcd6eb2f42..75bc770ccf8c 100644
>> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> > @@ -361,6 +361,8 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>> >  {
>> >       int ret;
>> >
>> > +     arm_mmu500_reset(smmu);
>> > +
>> >       /*
>> >        * To address performance degradation in non-real time clients,
>> >        * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
>> > @@ -374,23 +376,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>> >       return ret;
>> >  }
>> >
>> > -static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>> > -{
>> > -     const struct device_node *np = smmu->dev->of_node;
>> > -
>> > -     arm_mmu500_reset(smmu);
>> > -
>> > -     if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
>> > -             return qcom_sdm845_smmu500_reset(smmu);
>> > -
>> > -     return 0;
>> > -}
>> > -
>> >  static const struct arm_smmu_impl qcom_smmu_impl = {
>> >       .init_context = qcom_smmu_init_context,
>> >       .cfg_probe = qcom_smmu_cfg_probe,
>> >       .def_domain_type = qcom_smmu_def_domain_type,
>> > -     .reset = qcom_smmu500_reset,
>> > +     .reset = arm_mmu500_reset,
>> > +     .write_s2cr = qcom_smmu_write_s2cr,
>> > +     .tlb_sync = qcom_smmu_tlb_sync,
>> > +};
>> > +
>> > +static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>> > +     .init_context = qcom_smmu_init_context,
>> > +     .cfg_probe = qcom_smmu_cfg_probe,
>> > +     .def_domain_type = qcom_smmu_def_domain_type,
>> > +     .reset = qcom_sdm845_smmu500_reset,
>> >       .write_s2cr = qcom_smmu_write_s2cr,
>> >       .tlb_sync = qcom_smmu_tlb_sync,
>> >  };
>> > @@ -398,7 +397,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>> >  static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>> >       .init_context = qcom_adreno_smmu_init_context,
>> >       .def_domain_type = qcom_smmu_def_domain_type,
>> > -     .reset = qcom_smmu500_reset,
>> > +     .reset = arm_mmu500_reset,
>> >       .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>> >       .write_sctlr = qcom_adreno_smmu_write_sctlr,
>> >       .tlb_sync = qcom_smmu_tlb_sync,
>> > @@ -450,6 +449,11 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
>> >       .adreno_impl = &qcom_adreno_smmu_impl,
>> >  };
>> >
>> > +static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>> > +     .impl = &sdm845_smmu_500_impl,
>> > +     /* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */
>> separete -> separate
>
> Ack.
>
>> Also, while I'm here, does "No adreno impl" constitute adding a
>> compatible in the driver?
>
> Not sure that I got your question, please excuse me. Could you please
> describe what you meant?
> We already have qcom,sdm845-smmu-v2 in the match table, if that's your
> question. And there is no need for Adreno impl here, on sdm845 the
> SMMU connected to Adreno is v2 rather than mmu-500.

I'm asking because I wrote this patch:

https://lore.kernel.org/linux-iommu/20221103232632.217324-3-mailingradian@gmail.com/

on the basis that the SDM670 SMMU shouldn't have an adreno_impl. I
looked at the other code in this series, and it shouldn't be a problem
to use the fallback entry for SDM670. The adreno_impl is simply unused,
and would cause no problems if it were in the match data for any
platform. Going through the code, I'm considering dropping that patch I
wrote. My question should have been, "if I want to add support for an
SMMU, with no differences from a regular Qualcomm MMU-500, except
without an Adreno variant, does that deserve another entry and match
data?"

I would guess that this is not the case. The sdm845-smmu-v2 uses the
qcom_smmu_data, which includes the regular impl, even though there is no
regular sdm845-smmu-v2 that is not for Adreno.

> Probably I should change this to "No need for adreno impl....". Would
> that be better?

Yes, I think it would be better to clarify that this omission wasn't
made because it's necessary for the driver to work. That will possibly
save people from jumping to the match table, seeing this omission, and
writing a similar match data, only to have it dropped after reading
through the full driver.

>
>> > +};
>> > +
>> >  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>> >       { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>> >       { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
>> > @@ -460,7 +464,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>> >       { .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
>> >       { .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
>> >       { .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
>> > -     { .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
>> > +     { .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>> >       { .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
>> >       { .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
>> >       { .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
>> > --
>> > 2.35.1
>> >
>
>
>
> -- 
> With best wishes
> Dmitry
