Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE62852ED3
	for <lists+freedreno@lfdr.de>; Tue, 13 Feb 2024 12:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D85510E38D;
	Tue, 13 Feb 2024 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AxiKoaMx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235FB10E3A1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Feb 2024 11:10:34 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so3322237276.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Feb 2024 03:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707822633; x=1708427433; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ou+rxKAaHbbML85Kt1koJK934V+YLP7xcnMtHJXjmAs=;
 b=AxiKoaMx6fdY9a7Dz6EXWj+keV8MyxEDIn0TTgASdTA6n0Oq9kTefLAkj6/Jl/QA64
 /EakPU49kWNUuDFIZvI565hDedg3PMszc+xtl+qnhT6LhMpC/8FW1mNVGPVGR2Rukrl3
 fxjF3vKtjoHj3qNeHUdHPpjnb4iikQhUBVKZZDfaHUl2TP5SNwQZKzJRbAn3fK2SIuDl
 QcK9/iZou2B0fhAMlrFAYQ1BbSzFuM/FI4khgnisk9lLCIgRboLnuOxWph+5IJLhdnjb
 9jhVw3BCOJ4WvA8++6IYAhYFAO4EpbbvAnnqI8DBHAFRdYq5zG85o0ZscjrsoR38HJRq
 JkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707822633; x=1708427433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ou+rxKAaHbbML85Kt1koJK934V+YLP7xcnMtHJXjmAs=;
 b=CDsGLx/k1NalaRII+/UtqYXDqMy4Isnu5tOlTtH2VXIHci0udb7NB0ceHpzK9O2WhQ
 TY0KUJzyZ/buZ2e7n9RHL6i7G9J8W7utMxBEbZ6KkaEN1iZjUfgRn1zjQ5vDyxo+37G+
 gp3iddWVQHUQfm4vSzRIJXir8PwtEmqM9mqP4Fpo3j/9ffDF108WNL8dE7/ZJjvz3nER
 as9/M/EAobno3EBECsWaMsFSsJsFDVYYHoTNcR8xAAm9BtfFcgFKbDM6JyFKpoPZoUnR
 1Jh80jbGdsyLTKUxQ6c0Oz5YFElUO7D9pUjZNudc8gd0el+Y9nH67aAHmELbZ6qJST2m
 doAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1LsW6dHfIjf5c0FxUxVWegjqIlaUjWRWVj0EczlxnUsacJ2DjpYJ+4x39lbQx1q98mo5+g08dodaVFs5bJLdZyCAGlhwD8I0k+c+mLFM+
X-Gm-Message-State: AOJu0Yw/QS0fSePp9XNDmvQot7PLkIwNOOYNwGsKaPIlENXNKoy6NTno
 0BGZY1S69v+O8TvOVoAjjC4zwG0kIBtB6kmyNmB3H12OlYMtKUm9+qpiSmyYj+UE12yi82y5+Xb
 c8+Kvt7/deIrE3DEAUzOvoU9znCmOk0Lvbkzzog==
X-Google-Smtp-Source: AGHT+IEeEeSBcZ/sB6u7T/sqmPls2dQZZl/LCtnYYAwE7YzlZ4/C1fbTiGX3NHjTUOn8UG5vNpVHmaaB7Z2L9ykNceE=
X-Received: by 2002:a05:6902:2607:b0:dcc:5b7e:ddfe with SMTP id
 dw7-20020a056902260700b00dcc5b7eddfemr1248774ybb.4.1707822633587; Tue, 13 Feb
 2024 03:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20221114170635.1406534-9-dmitry.baryshkov@linaro.org>
 <a61a3561-0dde-472b-b8a5-451703f6d8ee@quicinc.com>
In-Reply-To: <a61a3561-0dde-472b-b8a5-451703f6d8ee@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:10:22 +0200
Message-ID: <CAA8EJpoJUZDUxpA1+LJTEVRaMQJrpZ7iU9_dZ3uQvzPKE_UUfg@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] iommu/arm-smmu-qcom: Merge table from
 arm-smmu-qcom-debug into match data
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, iommu@lists.linux.dev, joro@8bytes.org, 
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 quic_saipraka@quicinc.com, robdclark@gmail.com, robh+dt@kernel.org, 
 robin.murphy@arm.com, vkoul@kernel.org, will@kernel.org
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

On Tue, 13 Feb 2024 at 12:29, Pratyush Brahma <quic_pbrahma@quicinc.com> wrote:
>
> Hi
>
> Patch [1] introduces a use after free bug in the function
> "qcom_smmu_create()" in file: drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> wherein devm_krealloc() frees the old pointer marked by "smmu" but it is
> still being accessed later in qcom_smmu_impl_data() in the same function
> as:
>
> qsmmu->cfg = qcom_smmu_impl_data(smmu);
>
> The current patchset [2] implicitly fixes this issue as it doesn't
> access the freed ptr in the line:
>
> qsmmu->cfg = data->cfg;
>
> Hence, can this patchset[2] be propagated to branches where patchset[1]
> has been propagated already? The bug is currently present in all branches
> that have patchset[1] but do not have patchset[2].
>
> RFC:
>
> This bug would be reintroduced if patchset [3] is accepted. This makes
> the path prone to such errors as it relies on the
> developer's understanding on the internal implementation of devm_krealloc().

realloc is a basic function. Not understanding it is a significant
problem for the developer.

> Hence, a better fix IMO, would be to remove the confusion around the
> freed "smmu" ptr in the following way:

Could you please post a proper patch, which can be reviewed and
accepted or declined?

>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 549ae4dba3a6..6dd142ce75d1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -463,11 +463,12 @@ static struct arm_smmu_device
> *qcom_smmu_create(struct arm_smmu_device *smmu,
>          qsmmu = devm_krealloc(smmu->dev, smmu, sizeof(*qsmmu), GFP_KERNEL);
>          if (!qsmmu)
>                  return ERR_PTR(-ENOMEM);
> +       smmu = &qsmmu->smmu;
>
>          qsmmu->smmu.impl = impl;
>          qsmmu->cfg = data->cfg;
>
> -       return &qsmmu->smmu;
> +       return smmu;
>   }
>
> This is similar to the patch[4] which I've sent in-reply-to patch[3].
> Will send a formal patch if you think this approach is better.
>
> Please let me know your thoughts.

None of the other implementations does this. If you are going to fix
qcom implementation, please fix all implementations. However a better
option might be to change arm-smmu to remove devm_krealloc() usage at
all.



--
With best wishes
Dmitry
