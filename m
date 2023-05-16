Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96917705B40
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 01:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FB10E380;
	Tue, 16 May 2023 23:22:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546110E380
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 23:22:34 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac8091351eso37771fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684279353; x=1686871353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F0lqRcsSsQH0bBfoyNKX+3AOqI8xO1VZEspaatlK78k=;
 b=uA7/LYKh5HNBNHXQxR6NRDVGEgME5E/5oAkzu0StP2gjzSumdlZ5g/rL//IZqzjU2A
 +gViSD7O4lfppe164q8n3Xky20BhzZGAf9iDiwAoTUlqsRsCx4UDh6Y/4F2Pbhdlqr7y
 yYeUOjhEnhKVEUFdeF5UPkS2h3e5qRfnS4HxxaJ5HaIUa+T1kYHvOhBXJczw9/U8vjEa
 hDN85Ae1svLt7wJIHQffrL0BDY/BTIN9Q+HdpgaykIIQbVNyGHRd8tDHTu7LnyBvKsIg
 aZw8IXL3rbqbK4RVyIEKRlyjXcgTXQjY6UuJ/rLJ0hPQ0Z1PI90sjmJFeIddz1YMZvjs
 ypXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684279353; x=1686871353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0lqRcsSsQH0bBfoyNKX+3AOqI8xO1VZEspaatlK78k=;
 b=h4jKu+nzJ1sNs8eBXaM9TWc2QVGAKTiIpN4jZKUGgjlqj5ZYLGQT8w/DD0Z7k4vk4h
 N9s4YW7kt1i0aw1sVwcLUZ6c8kobVrX6ZbN0y3Wrgj+jpiy6w+zy1EMl9zynaksiu/dA
 jaMIuuI8xPvlqtNIo1Ykqt34qfa0jYRLVtd/tGnBp9shWhebgooDeprkqaUueY4FXNSV
 IYDZ2IYB2KQX1vptpbzqI+rMxQz6QjfdIKJiLICUBK6lnD7K/jJAE/LQtpFS2dKrMvR7
 wko4OQ+hqHzH2lXUDc4pCFbPvsNcvraKj0AzOf4bAb7+i6zJkIdGjzJfJ0UfCd31OZjg
 ykdA==
X-Gm-Message-State: AC+VfDz1swZrKm9IEY5UrB0s9o/gl49JV7emL9EKs+qzpRak02N1z4CB
 NGXP2qJ+QgwxaZaPLDpLYFwupQ==
X-Google-Smtp-Source: ACHHUZ6pKQ/IyOU0B/3fMGnHOQ5asgHXtu0mkqxW5VGYBRoXChUBKHyVyTbPwB9oD8Q/wqE0YYfidg==
X-Received: by 2002:a2e:8851:0:b0:2ac:8e69:c06d with SMTP id
 z17-20020a2e8851000000b002ac8e69c06dmr9126360ljj.49.1684279352762; 
 Tue, 16 May 2023 16:22:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a2e9e04000000b002aecfa8c58bsm1321531ljk.40.2023.05.16.16.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 16:22:32 -0700 (PDT)
Message-ID: <fdd07b5b-a3f5-0cbf-0d71-602d0b3b9847@linaro.org>
Date: Wed, 17 May 2023 02:22:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org
References: <20230516222039.907690-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230516222039.907690-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 1/2] iommu/arm-smmu-qcom: Fix missing
 adreno_smmu's
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
Cc: Rob Clark <robdclark@chromium.org>, Lepton Wu <lepton@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/05/2023 01:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When the special handling of qcom,adreno-smmu was moved into
> qcom_smmu_create(), it was overlooked that we didn't have all the
> required entries in qcom_smmu_impl_of_match.  So we stopped getting
> adreno_smmu_priv on sc7180, breaking per-process pgtables.
> 
> Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create")
> Cc: <stable@vger.kernel.org>
> Suggested-by: Lepton Wu <lepton@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

